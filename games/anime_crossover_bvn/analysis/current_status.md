# Trạng thái chuyển đổi

Ngày cập nhật: 2026-10-26.

## Đã hoàn thành

- Tạo game thứ ba độc lập với cấu trúc original/working/assets/extracted/patches/analysis/build/dist.
- Giữ checksum bản BVN nền; hai game nguồn không bị chỉnh sửa.
- Đưa 25 SWF nhân vật và 12 MP3 FTOP vào dự án mới.
- Mirror đủ 102 SWF fighter BVN: 65 định nghĩa fighter, 11 enemy và 37 trợ chiến (nhiều biến thể dùng chung file).
- Giữ toàn bộ roster/select BVN và bổ sung FTOP; cả 65 fighter BVN thường đều có đường chọn trực tiếp hoặc `moreFighter`.
- Lập `bvn_roster.json` và `crossover_roster.json`; enemy được giữ trong dữ liệu nhưng chưa đưa vào màn chọn để tránh biến NPC thiếu bộ hành động thành fighter người chơi.
- Tạo manifest 25 nhân vật với ID có tiền tố `ftop_`.
- Xuất đủ 25 timeline nguồn sang XFL (223 MB), gồm hình, symbol, âm thanh và frame label.
- Lập `xfl_inventory.json`: mỗi nhân vật có 31–47 frame label và 15–31 tên vùng đánh nguồn.
- Tạo và nhúng `gameplay.xml` (thay `skill_cooldowns.xml`, 2026-10-26) vào ZIP tài nguyên của SWF: cooldown, stunRate, attackSpeed, damageRate, moveSpeed, mặc định và theo từng nhân vật.
- Chèn mã vào GameData, FighterActionLogic, FighterMcCtrler, HitVO và GameMainLogicCtrler bằng JPEXS (`build_gameplay.sh`).
- Xuất lại mã từ SWF kết quả và xác nhận các hàm cooldown/tuning tồn tại; xuất binary data và xác nhận XML nằm trong archive runtime.

- 2026-10-26: port Natsu bằng công cụ tự động `tools/ftop_port` (không cần Adobe Animate): giữ hình/timeline/hitbox gốc, thay AS2 bằng AS3 sinh tự động, đăng ký vào màn chọn. Kiểm thử runtime trên Ruffle headless (`tools/ruffle_test`): di chuyển, combo, chiêu, đạn, tất sát + cut-in, bị đánh bay, AI, thắng/thua.

## Chưa hoàn thành

- Nghiệm thu gameplay 24 bản AS3 mới; xem `roster_port_status_vi.md`. Toàn bộ đã có config, SWF, portrait/cut-in và đường chọn trong game.
- Kiểm thử trên Flash Player thật; mới chạy trên Ruffle.
- Hoàn thiện giao diện tổng thể; màn chọn đã sắp xếp lại và bổ sung random bốn nhóm.

Không đưa 25 SWF nguồn vào `fighter.xml` trước khi chuyển timeline: làm vậy sẽ tạo lựa chọn nhân vật bị lỗi khi tải hoặc khi controller gọi API BVN.

## Cập nhật roster 2026-10-26

Đã đóng gói đủ 25 FTOP + roster BVN gốc. Kiểm chứng thực tế tag SWF, hash trong ZIP, giữ tài nguyên và giới hạn menu ở `roster_verification.json`. Bốn lệnh biến hình nguồn chưa nối với BVN; không coi smoke test là nghiệm thu toàn bộ gameplay.

## Cập nhật màn chọn và random 2026-10-26

Lưới 12 cột × 7 hàng hiển thị trực tiếp đủ 25 nhân vật FTOP. Đã tạo hai ảnh Random Fairy Tail/One Piece và nối pool tương ứng 10/15 nhân vật. Random chung gồm 90 fighter/biến thể của roster kết hợp. Kiểm tra pool thực trong Ruffle khớp đầy đủ ID, không có lỗi runtime ở màn chọn; xem `selection_random_status_vi.md` và `selection_random_verification.json`.

## Cập nhật giao diện tiếng Việt

Nền menu mới có bốn bộ truyện; bỏ các mục More Games, Credits, Rank, Training khỏi đường chọn. Việt hóa giao diện, hướng dẫn và cài đặt; nhúng font DejaVu Sans để hiển thị đủ dấu. Chi tiết: `ui_vietnamese_status_vi.md`.
