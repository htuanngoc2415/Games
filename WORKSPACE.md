# Workspace phân tích hai game Flash

Mỗi game có bản gốc, bản làm việc, tài nguyên giải nén và báo cáo riêng. Chưa sửa gameplay hoặc ghép nhân vật.

```text
games/
  bleach_vs_naruto_3.5/
    original/       # SWF gốc
    working/        # Bản dành cho chỉnh sửa
    extracted/     # AS3, tài nguyên, SWF nhúng đã xuất
    analysis/      # Báo cáo, chỉ mục, checksum, log BVN
    patches/
    bleach_vs_naruto_3.5.swf  # Bản đầu vào cũ được giữ lại
  fairy_tail_vs_one_piece_2.0/
    original/       # File tải về; nội bộ khai báo V1.1
    working/
    extracted/     # Script AS2/AVM1 và tài nguyên của SWF chính
    analysis/      # Thống kê, checksum, log, tài nguyên còn thiếu
    patches/
    downloaded/    # 25 SWF nhân vật và 12 MP3 tải theo URL trong source
analysis/          # Báo cáo so sánh hai game
tools/             # Công cụ dùng chung
```

- [Phân tích khả năng ghép](analysis/compatibility_vi.md)
- [Hồ sơ tổng hợp dự án ghép hai game](games/anime_crossover_bvn/analysis/PROJECT_HANDOFF_VI.md)
- [Phân tích BVN](games/bleach_vs_naruto_3.5/analysis/game_analysis_vi.md)
- [Tài nguyên Fairy Tail vs One Piece còn thiếu](games/fairy_tail_vs_one_piece_2.0/analysis/missing_assets.md)
- [Checksum tài nguyên đã tải](games/fairy_tail_vs_one_piece_2.0/analysis/downloaded_sha256sums.txt)
- [Kết quả xuất game thứ hai](games/fairy_tail_vs_one_piece_2.0/analysis/export_report.md)

Đường dẫn tương đối trong báo cáo BVN cũ được hiểu từ `games/bleach_vs_naruto_3.5/`. Log và JSON lịch sử có thể còn đường dẫn tuyệt đối trước khi chuyển thư mục; chúng được giữ làm bằng chứng, không dùng làm cấu hình chạy.

Các file ActionScript là mã dịch ngược, không phải dự án nguồn gốc có thể build trực tiếp. Sửa trong `extracted/` không tự thay đổi SWF.

Mở bản làm việc bằng JPEXS trên máy có giao diện:

```bash
ffdec games/bleach_vs_naruto_3.5/working/bleach_vs_naruto_3.5.swf
ffdec games/fairy_tail_vs_one_piece_2.0/working/fairy_tail_vs_one_piece_2.0.swf
```

`tools/export_workspace.py`, `export_embedded.py`, `index_workspace.py` đã trỏ sang thư mục BVN mới. Hai script export cũ dành cho lần xuất đầu tiên, không chạy lại trên kết quả hiện có. FFDec dùng chung thư mục cấu hình `tools/ffdec-home`.

Để xuất SWF khác ra một thư mục mới: `python3 tools/export_swf.py INPUT.swf OUTPUT_DIRECTORY`. Công cụ từ chối thư mục đầu ra đã tồn tại, lưu log và kiểm tra checksum đầu vào.

## Dọn dẹp 2026-10-27

Đã xoá phần giải nén và file trung gian của hai game nguồn (`extracted/`, `working/`, `downloaded/`, bản SWF trùng lặp) và `build/`, `dist/`, `.venv`, bản SWF test. Giữ lại: `games/*/original/` (SWF gốc), `games/*/analysis/`, game ghép `games/anime_crossover_bvn/` (đã build, mã nguồn chỉnh sửa, assets, `ports/`) và `tools/`.

- Hai file BVN mà build cần nay nằm ở `games/anime_crossover_bvn/original/bvn_binary/`.
- Mọi thứ còn thiếu trong `build/` được sinh lại bằng `bash games/anime_crossover_bvn/build_gameplay.sh`.
- `tools/ftop_port/prepare_roster.py` và các script trong `tools/` ở gốc (`export_*.py`, `index_*.py`) cần dữ liệu giải nén của hai game nguồn; muốn chạy lại thì xuất lại bằng `python3 tools/export_swf.py INPUT.swf OUTPUT_DIR` từ SWF trong `original/`.
- Chạy test Ruffle cần cài lại Playwright: xem `tools/ruffle_test/README.md`.

## Đóng gói chơi độc lập (Windows + Linux)

`bash tools/package_game/package.sh` tạo `tools/package_game/out/AnimeCrossover/` và `AnimeCrossover.zip` (khoảng 154 MB):
`AnimeCrossover.exe` (Windows), `AnimeCrossover` (Linux), `engine/` (Ruffle desktop), `game/game.swf`, `saves/` (dữ liệu lưu).
Cần `pip install ziglang` để biên dịch chéo launcher (`launcher.c`). Phải chạy `build_gameplay.sh` trước để có bản game mới nhất.
Đã thử bản Linux; bản Windows chưa thử trên máy Windows thật.
