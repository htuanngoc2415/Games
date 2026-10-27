/* Bộ chuyển tiếp phòng chơi LAN. Ruffle không tạo được máy chủ TCP nên máy chủ phòng chạy chương trình này
 * (nằm sẵn trong launcher) và mọi người chơi, kể cả chủ phòng, đều nối vào nó như client.
 *
 * Cổng cục bộ  127.0.0.1:LOCAL_PORT  luôn mở (game của chính máy này).
 * Cổng LAN     0.0.0.0:LAN_PORT      chỉ mở khi game chủ phòng gửi lệnh OPEN_LAN.
 *
 * Khung dữ liệu từ client:  [len:u16 BE][payload len byte]  payload[0] = loại tin.
 *   loại >= 0xF0 là lệnh gửi cho relay (chỉ nhận từ client cục bộ), còn lại được chuyển tới mọi client khác.
 * Khung dữ liệu từ relay:   [len:u16 BE][from:u8][payload]   from = 255 là tin của chính relay.
 *   RELAY_ASSIGN  1 [idx][maxPlayers]     gửi cho client mới nối
 *   RELAY_JOIN    2 [idx]                 có người vào (cũng gửi danh sách người đã có cho người mới)
 *   RELAY_LEAVE   3 [idx]                 có người ra
 *   RELAY_LAN     4 [a][b][c][d][port:u16] đã mở cổng LAN; IPv4 của máy này
 *   RELAY_CLOSED  5                       cổng LAN đã đóng
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef _WIN32
#include <winsock2.h>
#include <ws2tcpip.h>
typedef SOCKET sock_t;
#define BAD_SOCK INVALID_SOCKET
#define CLOSE_SOCK closesocket
#define SOCK_ERR_WOULDBLOCK (WSAGetLastError() == WSAEWOULDBLOCK)
static void set_nonblock(sock_t s) { u_long on = 1; ioctlsocket(s, FIONBIO, &on); }
#else
#include <arpa/inet.h>
#include <errno.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <signal.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <unistd.h>
typedef int sock_t;
#define BAD_SOCK (-1)
#define CLOSE_SOCK close
#define SOCK_ERR_WOULDBLOCK (errno == EAGAIN || errno == EWOULDBLOCK)
static void set_nonblock(sock_t s) { fcntl(s, F_SETFL, fcntl(s, F_GETFL, 0) | O_NONBLOCK); }
#endif

#include "relay.h"

#define MAX_PLAYERS 4
#define MAX_MSG 4096
#define INBUF 16384

typedef struct {
    sock_t fd;
    int active, local;
    unsigned char in[INBUF];
    int inlen;
} Client;

static Client clients[MAX_PLAYERS];
static sock_t local_listen = BAD_SOCK, lan_listen = BAD_SOCK;
static int lan_port_cfg;

static sock_t make_listener(const char *addr, int port) {
    sock_t s = socket(AF_INET, SOCK_STREAM, 0);
    if (s == BAD_SOCK) return BAD_SOCK;
    int on = 1;
    setsockopt(s, SOL_SOCKET, SO_REUSEADDR, (const char *)&on, sizeof on);
    struct sockaddr_in a;
    memset(&a, 0, sizeof a);
    a.sin_family = AF_INET;
    a.sin_port = htons((unsigned short)port);
    a.sin_addr.s_addr = inet_addr(addr);
    if (bind(s, (struct sockaddr *)&a, sizeof a) != 0 || listen(s, 8) != 0) { CLOSE_SOCK(s); return BAD_SOCK; }
    set_nonblock(s);
    return s;
}

static void send_all(Client *c, const unsigned char *d, int n) {
    int off = 0;
    for (int tries = 0; off < n && tries < 2000; tries++) {
        int w = send(c->fd, (const char *)d + off, n - off, 0);
        if (w > 0) { off += w; continue; }
        if (w < 0 && SOCK_ERR_WOULDBLOCK) { struct timeval tv = {0, 1000}; select(0, NULL, NULL, NULL, &tv); continue; }
        break;
    }
}

static void send_frame(Client *c, int from, const unsigned char *payload, int n) {
    unsigned char buf[MAX_MSG + 8];
    int len = n + 1;
    buf[0] = (unsigned char)(len >> 8); buf[1] = (unsigned char)len; buf[2] = (unsigned char)from;
    memcpy(buf + 3, payload, n);
    send_all(c, buf, n + 3);
}

static void relay_msg(Client *c, int type, const unsigned char *body, int n) {
    unsigned char p[32];
    p[0] = (unsigned char)type;
    if (n > 0) memcpy(p + 1, body, n);
    send_frame(c, 255, p, n + 1);
}

static int count_active(void) { int n = 0; for (int i = 0; i < MAX_PLAYERS; i++) n += clients[i].active; return n; }

static void drop(int i) {
    if (!clients[i].active) return;
    CLOSE_SOCK(clients[i].fd);
    clients[i].active = 0;
    unsigned char b = (unsigned char)i;
    for (int k = 0; k < MAX_PLAYERS; k++) if (clients[k].active) relay_msg(&clients[k], 3, &b, 1);
}

static void close_lan(int notify) {
    if (lan_listen == BAD_SOCK) return;
    CLOSE_SOCK(lan_listen);
    lan_listen = BAD_SOCK;
    if (notify) for (int k = 0; k < MAX_PLAYERS; k++) if (clients[k].active && clients[k].local) relay_msg(&clients[k], 5, NULL, 0);
}

static void local_ipv4(unsigned char out[4]) {
    out[0] = 127; out[1] = 0; out[2] = 0; out[3] = 1;
    sock_t s = socket(AF_INET, SOCK_DGRAM, 0);
    if (s == BAD_SOCK) return;
    struct sockaddr_in a;
    memset(&a, 0, sizeof a);
    a.sin_family = AF_INET; a.sin_port = htons(9); a.sin_addr.s_addr = inet_addr("192.0.2.1");
    if (connect(s, (struct sockaddr *)&a, sizeof a) == 0) {
        struct sockaddr_in me; socklen_t l = sizeof me;
        if (getsockname(s, (struct sockaddr *)&me, &l) == 0) memcpy(out, &me.sin_addr.s_addr, 4);
    }
    CLOSE_SOCK(s);
}

static void accept_one(sock_t ls, int local) {
    sock_t s = accept(ls, NULL, NULL);
    if (s == BAD_SOCK) return;
    int slot = -1;
    for (int i = 0; i < MAX_PLAYERS; i++) if (!clients[i].active) { slot = i; break; }
    if (slot < 0) { CLOSE_SOCK(s); return; }
    set_nonblock(s);
    int on = 1;
    setsockopt(s, IPPROTO_TCP, TCP_NODELAY, (const char *)&on, sizeof on);
    Client *c = &clients[slot];
    c->fd = s; c->active = 1; c->local = local; c->inlen = 0;
    unsigned char a[2] = {(unsigned char)slot, MAX_PLAYERS};
    relay_msg(c, 1, a, 2);
    for (int k = 0; k < MAX_PLAYERS; k++) {
        if (k == slot || !clients[k].active) continue;
        unsigned char b = (unsigned char)k;
        relay_msg(c, 2, &b, 1);
        b = (unsigned char)slot;
        relay_msg(&clients[k], 2, &b, 1);
    }
    if (count_active() >= MAX_PLAYERS) close_lan(1);
}

static void handle_message(int from, unsigned char *p, int n) {
    if (n < 1) return;
#ifdef RELAY_DEBUG
    fprintf(stderr, "relay: from=%d type=0x%02x len=%d", from, p[0], n);
    if (p[0] == 0x20 && n >= 7) fprintf(stderr, " frame=%u", (p[1] << 24) | (p[2] << 16) | (p[3] << 8) | p[4]);
    fprintf(stderr, "\n");
#endif
    if (p[0] >= 0xF0) {
        if (!clients[from].local) return;
        if (p[0] == RELAY_CMD_OPEN_LAN && lan_listen == BAD_SOCK) {
            lan_listen = make_listener("0.0.0.0", lan_port_cfg);
            if (lan_listen != BAD_SOCK) {
                unsigned char r[6];
                local_ipv4(r);
                r[4] = (unsigned char)(lan_port_cfg >> 8); r[5] = (unsigned char)lan_port_cfg;
                relay_msg(&clients[from], 4, r, 6);
            } else {
                relay_msg(&clients[from], 5, NULL, 0);
            }
        } else if (p[0] == RELAY_CMD_CLOSE_LAN) {
            close_lan(1);
        }
        return;
    }
    for (int k = 0; k < MAX_PLAYERS; k++) if (k != from && clients[k].active) send_frame(&clients[k], from, p, n);
}

static void read_client(int i) {
    Client *c = &clients[i];
    int r = recv(c->fd, (char *)c->in + c->inlen, INBUF - c->inlen, 0);
    if (r == 0 || (r < 0 && !SOCK_ERR_WOULDBLOCK)) { drop(i); return; }
    if (r < 0) return;
    c->inlen += r;
    int off = 0;
    while (c->inlen - off >= 2) {
        int len = (c->in[off] << 8) | c->in[off + 1];
        if (len > MAX_MSG) { drop(i); return; }
        if (c->inlen - off - 2 < len) break;
        handle_message(i, c->in + off + 2, len);
        if (!c->active) return;
        off += 2 + len;
    }
    if (off > 0) { memmove(c->in, c->in + off, c->inlen - off); c->inlen -= off; }
    if (c->inlen >= INBUF) drop(i);
}

int relay_run(volatile int *stop, int local_port, int lan_port) {
#ifdef _WIN32
    WSADATA w;
    if (WSAStartup(MAKEWORD(2, 2), &w) != 0) return 1;
#else
    signal(SIGPIPE, SIG_IGN);
#endif
    lan_port_cfg = lan_port;
    local_listen = make_listener("127.0.0.1", local_port);
    if (local_listen == BAD_SOCK) return 2;
    while (!*stop) {
        fd_set rs;
        FD_ZERO(&rs);
        sock_t mx = local_listen;
        FD_SET(local_listen, &rs);
        if (lan_listen != BAD_SOCK) { FD_SET(lan_listen, &rs); if (lan_listen > mx) mx = lan_listen; }
        for (int i = 0; i < MAX_PLAYERS; i++) if (clients[i].active) { FD_SET(clients[i].fd, &rs); if (clients[i].fd > mx) mx = clients[i].fd; }
        struct timeval tv = {0, 100000};
        int n = select((int)mx + 1, &rs, NULL, NULL, &tv);
        if (n <= 0) continue;
        if (FD_ISSET(local_listen, &rs)) accept_one(local_listen, 1);
        if (lan_listen != BAD_SOCK && FD_ISSET(lan_listen, &rs)) accept_one(lan_listen, 0);
        for (int i = 0; i < MAX_PLAYERS; i++) if (clients[i].active && FD_ISSET(clients[i].fd, &rs)) read_client(i);
    }
    for (int i = 0; i < MAX_PLAYERS; i++) if (clients[i].active) CLOSE_SOCK(clients[i].fd);
    CLOSE_SOCK(local_listen);
    close_lan(0);
    return 0;
}

#ifdef RELAY_STANDALONE
int main(int argc, char **argv) {
    static volatile int stop = 0;
    int lp = argc > 1 ? atoi(argv[1]) : RELAY_LOCAL_PORT, np = argc > 2 ? atoi(argv[2]) : RELAY_LAN_PORT;
    int r = relay_run(&stop, lp, np);
    if (r) fprintf(stderr, "relay: không mở được cổng (%d)\n", r);
    return r;
}
#endif
