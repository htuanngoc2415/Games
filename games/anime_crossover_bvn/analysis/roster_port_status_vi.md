# Bản chuyển toàn bộ roster FTOP sang BVN — 2026-10-26

Đã tạo đủ 25 SWF AS3 (Natsu hiện có + 24 nhân vật mới), nhúng vào `working/anime_crossover_bvn.swf`. Đây là bản tích hợp để kiểm thử; 24 nhân vật mới chưa đạt đủ toàn bộ tiêu chí `playable` của bàn giao.

## Kết quả đã kiểm chứng

- Cờ AVM2, bytecode AS3 và nhãn hành động bắt buộc của đủ 25 SWF.
- Giữ nguyên byte của các tag hình ảnh, hình dạng, morph và âm thanh nguồn; không rasterize animation.
- Mỗi nhân vật có config riêng, HitVO từ `gjl1`, âm thanh trúng đòn/KO, portrait và cut-in gốc.
- Adapter `FighterMC.as` đọc hitbox động và quản lý stop/loop của timeline con FTOP. Các fighter không có cờ port dùng nhánh BVN cũ. Tên hitbox logic tránh Error #2078 của AS3.
- 25 nhân vật có đường chọn; 102 SWF BVN gốc còn nguyên byte trong ZIP.
- Năm kiểm thử chuyển đổi chạy qua, gồm hai viên đạn Gray cùng frame và giữ điều kiện của nhánh combo.

## Cách chạy và chọn

Chạy `bash games/anime_crossover_bvn/play.sh` từ thư mục workspace. Bản Ruffle dùng lớp vỏ kiểm thử để bỏ phụ thuộc host cũ. `working/anime_crossover_bvn.swf` vẫn dùng lớp vỏ phát hành ban đầu.

Bố cục 7 hàng x 12 cột: Bleach/Naruto ở 4 hàng đầu, Fairy Tail và khách Kenshin hàng 5, One Piece hàng 6–7. Năm ô random ở phải hàng 7: Bleach, Naruto, Fairy Tail, One Piece, tất cả. 25 FTOP hiện trực tiếp; biến thể BVN giữ moreFighter. Xem `selection_random_status_vi.md`.

## Mức độ hoàn thiện theo nhân vật

Không có cảnh báo dịch không có nghĩa là đã kiểm chứng đủ gameplay. Các nhãn nhảy/ngã suy ra từ mốc source vẫn cần kiểm tra trực quan.

| Nhân vật | ID | Cảnh báo dịch còn lại |
|---|---|---:|
| Ace | `ftop_ace` | 0 |
| Buggy | `ftop_buggy` | 1 |
| Crocodile | `ftop_crocodile` | 1 |
| Doflamingo | `ftop_doflamingo` | 0 |
| Ersa | `ftop_ersa` | 0 |
| Gajeel | `ftop_gajeel` | 0 |
| Gray | `ftop_gray` | 0 |
| Hancock | `ftop_hancock` | 0 |
| Jinbei | `ftop_jinbei` | 0 |
| Juvia | `ftop_juvia` | 0 |
| Laxus | `ftop_lasasi` | 0 |
| Law | `ftop_law` | 0 |
| Lucy | `ftop_lucy` | 0 |
| Luffy | `ftop_luffy` | 1 |
| Luffy-2Y | `ftop_luffy2` | 0 |
| Makarov | `ftop_makarov` | 0 |
| Mirajane | `ftop_mirajane` | 0 |
| Nami | `ftop_nami` | 0 |
| Natsu | `ftop_natsu` | 0 |
| Nico Robin | `ftop_robin2` | 0 |
| Sanji | `ftop_sanji` | 0 |
| Sanji | `ftop_sanji2` | 0 |
| Wendy | `ftop_wendy` | 0 |
| Zoro | `ftop_zoro` | 1 |
| Zoro-2Y | `ftop_zoro2` | 0 |

## Runtime smoke test

Đã nạp 25 nhân vật, mỗi nhân vật hai bản sao, và chạy chuỗi 15 nhãn hành động (bỏ qua nhãn nguồn không có). Ghi nhận vùng thân lúc đứng ở 25/25 nhân vật. Các hướng được luân phiên. Chi tiết, hash bản thực sự đã chạy, hành động đã thử và lỗi theo từng nhân vật ở `roster_runtime_verification.json`.

Còn Error #1006 của Ruffle lúc dọn đối tượng. Bản sửa tên hitbox đã được chạy lại; không coi hoàn tất chuỗi hành động là xác nhận mọi chiêu đúng.

## Giới hạn cần xử lý tiếp

- Những lệnh nguồn chưa ánh xạ được ghi trong `build/port/<id>/as3/report.txt`; chi tiết tổng hợp trong `roster_verification.json`.
- Đã bổ sung clip dò trúng và hiệu ứng bám đối thủ của Robin, cờ `kihit` của Luffy-2Y và clip đặt theo khoảng cách của Doflamingo. Các hành vi này vẫn cần kiểm chứng bằng trận đấu đầy đủ.
- Bốn callback `wankai` cũ chưa ánh xạ: Buggy, Crocodile, Luffy, Zoro. Đã kiểm tra: chính SWF nguồn của cả bốn chỉ có một frame gốc và không có nhãn `万解`; đây là callback engine cũ không có timeline đích trong bộ nguồn hiện tại. Các phiên bản Luffy/Zoro/Sanji vẫn chọn riêng được.
- Cần kiểm tra từng tuyệt chiêu đến hết animation, hồi trạng thái, AI, cooldown độc lập, KO/reset, lượng sát thương và hai hướng trên Flash Player/Ruffle. Smoke test cưỡng bức hành động không xác nhận các điều kiện này.
- Ruffle hiện có hạn chế `stopAllMovieClips()` gây Error #1006 lúc dọn fighter/đạn; Canvas thiếu BitmapData.draw, còn renderer GPU phần mềm có thể lỗi. Log runtime được giữ trong `build/roster_runtime*`.

## Tái tạo

```bash
python3 tools/ftop_port/prepare_roster.py
python3 tools/ftop_port/register_roster_assets.py
python3 tools/ftop_port/refine_projectiles.py
python3 tools/ftop_port/refine_effects.py
python3 tools/ftop_port/build_roster.py
bash games/anime_crossover_bvn/build_gameplay.sh
python3 tools/ftop_port/test_conversion.py
python3 tools/ftop_port/verify_roster.py
python3 tools/ftop_port/update_status.py
```

Không đánh dấu toàn bộ roster là `playable` chỉ dựa trên việc compile hoặc chạy smoke test.

## Kiểm thử gameplay bằng phím thật — 2026-10-26 (tối)

Chạy `tools/ruffle_test/make_gameplay_test.py` + `run_gameplay_test.py` cho cả 25 nhân vật: bấm phím thật cho J, combo J, S+J, W+J, U, S+U, W+U, nhảy, nhảy+J, nhảy+U, lướt, I, W+I, S+I (P2 đứng yên trong Training), sau đó 15 giây đấu với AI. Ghi nhãn frame, actionState và HP mỗi 100 ms; tóm tắt bằng `analyze_gameplay_test.py`. Kết quả: `gameplay_test_verification.json`.

- 20/25 qua toàn bộ thao tác ngay lần đầu; AI của cả 25 tự tấn công và gây sát thương; không có lỗi AS3 ngoài #1006 đã biết của Ruffle.
- Đã sửa: Doflamingo bay lên mãi sau W+U (chiêu về idle khi lực bay dọc còn tác dụng). `gen_fighter.py` nay dừng lực dọc trước `idle()`; chỉ Doflamingo bị ảnh hưởng. Kiểm tra lại: 16/16.
- Không phải lỗi: Hancock, Juvia không có 上必杀 (có 空中必杀, đã chạy); Buggy, Laxus không có 空中必杀; Ersa/Hancock S+I chỉ dài hơn thời gian chờ. Combo J của Buggy/Laxus có cửa sổ nối 4–5 frame như bản gốc, bấm liên tục thì nối đủ.
- Vẫn chưa kiểm: Flash Player thật, từng hitbox chi tiết, cooldown/gameplay.xml trên từng nhân vật, chế độ Đấu đội/Phiêu lưu.
