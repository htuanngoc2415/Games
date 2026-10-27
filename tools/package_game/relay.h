#ifndef RELAY_H
#define RELAY_H
#define RELAY_LOCAL_PORT 47800
#define RELAY_LAN_PORT 47801
#define RELAY_CMD_OPEN_LAN 0xF0
#define RELAY_CMD_CLOSE_LAN 0xF1
/* Chạy cho tới khi *stop khác 0. Trả 0 nếu thoát bình thường, khác 0 nếu không mở được cổng cục bộ. */
int relay_run(volatile int *stop, int local_port, int lan_port);
#endif
