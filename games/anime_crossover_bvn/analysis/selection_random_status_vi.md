# Màn chọn và random của bốn bộ truyện

## Bố cục

- Lưới **12 cột × 7 hàng**, giữ kích thước ảnh/ô gốc. Khoảng cách hàng đồng đều, dành vùng dưới màn hình cho chân dung nhân vật đã chọn.
- Hàng 1–4: Bleach ở sáu cột trái, Naruto ở sáu cột phải.
- Hàng 5: đủ 10 nhân vật Fairy Tail và nhân vật khách Kenshin.
- Hàng 6–7: đủ 15 nhân vật One Piece. Hàng 7 bên phải có năm ô random.
- Cả 25 FTOP hiện trực tiếp; các biến thể BVN vẫn mở qua `moreFighter`. Giữ đủ 65 fighter/biến thể BVN và toàn bộ trợ chiến.
- Bố cục khai báo tại `assets/config/crossover_select.json`; chỉnh file này rồi chạy `build_gameplay.sh`. Metadata vị trí trong `ports/*.json` đã đồng bộ.

## Random

| Ô | Số lựa chọn |
|---|---:|
| Random Bleach | 31 |
| Random Naruto | 34 |
| Random Fairy Tail | 10 |
| Random One Piece | 15 |
| Random chung | 90 |

Bộ lọc dùng `roster_group` trong XML, độc lập với `comic_type` dùng cho hiệu ứng chiến đấu. FTOP vẫn giữ mã hiệu ứng cũ nhưng không còn lọt vào Random Naruto. `FighterModel` đọc nhóm mới và `GameLogic.canSelectFighter` nhận cả các biến thể trong `moreFighter`. Các pool loại NPC, các ô random; màn chọn tiếp tục loại nhân vật đã chọn trong đội theo logic có sẵn.

## Hai ảnh mới

Tạo bằng công cụ **imagegen tích hợp**, lấy random Bleach/Naruto làm mẫu phong cách: bóng nhân vật, dấu hỏi, viền sáng và tên bộ truyện.

- Bản gốc: `assets/face/random_sources/random_fairy_tail.png`, `random_one_piece.png`.
- Bản dùng trong game (50×48): `assets/face/ported/random_fairy_tail.png`, `random_one_piece.png`.
- Prompt đầy đủ và đường dẫn tham chiếu: `analysis/random_icons_prompts.json`.

## Kiểm tra và build

```bash
bash games/anime_crossover_bvn/build_gameplay.sh
python3 tools/ftop_port/test_selection.py
python3 tools/ftop_port/verify_roster.py
```

`test_selection.py` kiểm tra XML/assets thực sự nằm trong ZIP, toàn bộ roster, các pool không giao nhau, random chung 90 mục, vị trí ô không đè vùng chân dung và danh sách trợ chiến giữ nguyên nội dung.

Kiểm tra Ruffle dùng `tools/ruffle_test/make_selection_test.py` và `run_selection_test.py`: bản test tự vào màn chọn và ghi pool từ chính FighterModel/GameLogic AVM2. `verify_selection_runtime.py` so sánh tập ID runtime với roster đã đóng gói, không chỉ so sánh số lượng. Kết quả: `analysis/selection_random_verification.json`; ảnh chụp: `build/selection_runtime/`.

Bản sử dụng: `working/anime_crossover_bvn.swf`. Chạy `bash games/anime_crossover_bvn/play.sh`; tải lại trang nếu game đang mở. Gói port riêng cũng kèm ảnh random, roster mới và các class adapter cần import. Các giới hạn gameplay của lần port trước không thay đổi trong lượt chỉnh màn chọn này.
