/* Mở game bằng Ruffle nằm cạnh: <thư mục>/engine/ruffle[.exe] và <thư mục>/game/game.swf.
 * Đồng thời chạy bộ chuyển tiếp phòng LAN (relay.c) cho tới khi game đóng; cổng LAN chỉ mở khi
 * người chơi bấm "Tạo phòng" trong game.
 * Dữ liệu lưu (cài đặt, hồi chiêu đã chỉnh) nằm ở <thư mục>/saves, mang cả thư mục sang máy khác vẫn giữ nguyên.
 * Lỗi được ghi vào loi.txt cạnh chương trình. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "relay.h"

static volatile int stop_relay = 0;

#ifdef _WIN32
#include <windows.h>
#include <wchar.h>

static void fail(const wchar_t *dir, const wchar_t *what, DWORD code) {
    wchar_t path[MAX_PATH + 16];
    swprintf(path, MAX_PATH + 16, L"%ls\\loi.txt", dir);
    FILE *f = _wfopen(path, L"w, ccs=UTF-8");
    if (f) { fwprintf(f, L"%ls (ma loi %lu)\n", what, (unsigned long)code); fclose(f); }
    ExitProcess(1);
}

static DWORD WINAPI wait_child(LPVOID h) {
    WaitForSingleObject((HANDLE)h, INFINITE);
    stop_relay = 1;
    return 0;
}

int WINAPI WinMain(HINSTANCE a, HINSTANCE b, LPSTR c, int d) {
    wchar_t exe[MAX_PATH], dir[MAX_PATH], engine[MAX_PATH], swf[MAX_PATH], saves[MAX_PATH];
    GetModuleFileNameW(NULL, exe, MAX_PATH);
    wcscpy(dir, exe);
    wchar_t *slash = wcsrchr(dir, L'\\');
    if (slash) *slash = 0;
    swprintf(engine, MAX_PATH, L"%ls\\engine\\ruffle.exe", dir);
    swprintf(swf, MAX_PATH, L"%ls\\game\\game.swf", dir);
    swprintf(saves, MAX_PATH, L"%ls\\saves", dir);
    if (GetFileAttributesW(engine) == INVALID_FILE_ATTRIBUTES) fail(dir, L"Thieu engine\\ruffle.exe", GetLastError());
    if (GetFileAttributesW(swf) == INVALID_FILE_ATTRIBUTES) fail(dir, L"Thieu game\\game.swf", GetLastError());
    CreateDirectoryW(saves, NULL);

    wchar_t cmd[4 * MAX_PATH + 160];
    swprintf(cmd, 4 * MAX_PATH + 160,
             L"\"%ls\" --save-directory \"%ls\" --storage disk --load-behavior blocking --tcp-connections allow \"%ls\"",
             engine, saves, swf);
    STARTUPINFOW si; PROCESS_INFORMATION pi;
    memset(&si, 0, sizeof si); si.cb = sizeof si;
    if (!CreateProcessW(engine, cmd, NULL, NULL, FALSE, 0, NULL, dir, &si, &pi)) fail(dir, L"Khong chay duoc ruffle.exe", GetLastError());
    CloseHandle(pi.hThread);
    HANDLE waiter = CreateThread(NULL, 0, wait_child, pi.hProcess, 0, NULL);
    int r = relay_run(&stop_relay, RELAY_LOCAL_PORT, RELAY_LAN_PORT);
    if (r != 0) WaitForSingleObject(pi.hProcess, INFINITE);   /* cổng bận (bản khác đang chạy): chỉ chờ game */
    if (waiter) WaitForSingleObject(waiter, 2000);
    CloseHandle(pi.hProcess);
    return 0;
}
#else
#include <errno.h>
#include <libgen.h>
#include <limits.h>
#include <signal.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <unistd.h>

static void fail(const char *dir, const char *what) {
    char path[PATH_MAX + 16];
    snprintf(path, sizeof path, "%s/loi.txt", dir);
    FILE *f = fopen(path, "w");
    if (f) { fprintf(f, "%s (%s)\n", what, strerror(errno)); fclose(f); }
    fprintf(stderr, "%s\n", what);
    exit(1);
}

static void on_child(int sig) { (void)sig; stop_relay = 1; }

int main(int argc, char **argv) {
    char exe[PATH_MAX], dir[PATH_MAX], engine[PATH_MAX + 16], swf[PATH_MAX + 16], saves[PATH_MAX + 16];
    ssize_t n = readlink("/proc/self/exe", exe, sizeof exe - 1);
    if (n < 0) { perror("readlink"); return 1; }
    exe[n] = 0;
    strcpy(dir, dirname(exe));
    snprintf(engine, sizeof engine, "%s/engine/ruffle", dir);
    snprintf(swf, sizeof swf, "%s/game/game.swf", dir);
    snprintf(saves, sizeof saves, "%s/saves", dir);
    if (access(engine, X_OK) != 0) fail(dir, "Thieu engine/ruffle");
    if (access(swf, R_OK) != 0) fail(dir, "Thieu game/game.swf");
    mkdir(saves, 0755);
    if (chdir(dir) != 0) fail(dir, "Khong vao duoc thu muc game");

    signal(SIGCHLD, on_child);
    pid_t pid = fork();
    if (pid < 0) fail(dir, "Khong tao duoc tien trinh game");
    if (pid == 0) {
        char *args[argc + 10];
        int i = 0;
        args[i++] = engine;
        args[i++] = "--save-directory"; args[i++] = saves;
        args[i++] = "--storage"; args[i++] = "disk";
        args[i++] = "--load-behavior"; args[i++] = "blocking";
        args[i++] = "--tcp-connections"; args[i++] = "allow";
        for (int k = 1; k < argc; k++) args[i++] = argv[k];
        args[i++] = swf;
        args[i] = NULL;
        execv(engine, args);
        fail(dir, "Khong chay duoc engine/ruffle");
    }
    int r = relay_run(&stop_relay, RELAY_LOCAL_PORT, RELAY_LAN_PORT);
    int status = 0;
    if (r != 0) { while (waitpid(pid, &status, 0) < 0 && errno == EINTR) {} }   /* cổng bận: chỉ chờ game */
    else waitpid(pid, &status, 0);
    return WIFEXITED(status) ? WEXITSTATUS(status) : 0;
}
#endif
