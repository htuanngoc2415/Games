# Khả năng ghép Bleach vs Naruto và Fairy Tail vs One Piece

## Kết luận

Không tương thích trực tiếp ở mức mã nhân vật. BVN dùng AS3/AVM2, file Fairy Tail vs One Piece được cung cấp dùng AS2/AVM1. Hướng khả thi là giữ BVN làm engine, chuyển tài nguyên hình ảnh/âm thanh và dựng lại phần điều khiển nhân vật theo giao diện BVN. Không chỉ thêm XML hay đổi tên SWF là chạy.

Phân tích tĩnh trên file trong workspace; chưa chạy trận đấu, chưa chuyển thử nhân vật và chưa kiểm chứng toàn bộ chiêu. Không có tỷ lệ tương thích định lượng đáng tin cậy ở giai đoạn này.

## File thứ hai chưa phải bộ game đầy đủ

Tên đầu vào là `fairy_tail_vs_one_piece_2.0.swf`, nhưng `games/fairy_tail_vs_one_piece_2.0/extracted/scripts/frame_1/DoAction.as` dòng 21–22 khai báo `_root.ver = "V 1.1"` và `_root.date_ver = "2016/7/25"`. Giữ tên file người dùng cung cấp; thông tin nội bộ không đủ để khẳng định chính xác phiên bản phát hành, nhưng có mâu thuẫn cần kiểm tra.

`frame_7/DoAction.as:62` đặt `fighterDir = "fighter/"`, dòng 63 đặt `musicDir = "music/"`. `frame_8/DoAction.as` có 25 lời gọi đăng ký nhân vật trực tiếp có URL (không đồng nghĩa toàn bộ nhân vật chọn được). Ví dụ Luffy → `luffy.swf`, Natsu → `natsu.swf`.

`DefineSprite_1872/frame_1/DoAction.as:84` có hàm `loadman`: lấy URL từ cấu hình, ghép `fighterDir`, rồi gọi `loadMovie` vào `_root.game.p1`/`p2`. Cùng script gọi `Sound.loadSound` để nạp nhạc ngoài. Do đó SWF hiện có chứa giao diện, dữ liệu lựa chọn, sân/hiệu ứng và mã điều phối, nhưng thiếu các SWF nhân vật được tham chiếu. Xuất ảnh giao diện không đồng nghĩa đã có đủ animation chiến đấu.

Danh sách: [missing_assets.md](../games/fairy_tail_vs_one_piece_2.0/analysis/missing_assets.md), dữ liệu máy đọc: [external_dependencies.json](../games/fairy_tail_vs_one_piece_2.0/analysis/external_dependencies.json). Chưa tải tài nguyên ngoài; cần URL thực tế hoặc các file bổ sung. Các SWF nhân vật có thể còn phụ thuộc riêng chưa thấy.

## So sánh kỹ thuật

| Thành phần | BVN hiện có | Fairy Tail vs One Piece hiện có | Hệ quả |
|---|---|---|---|
| Định dạng | SWF v19, FileAttributes có AS3, DoABC | SWF v8, AS3 flag tắt, DoAction/DoInitAction, package AS2 | Hai hệ runtime khác nhau |
| Tổ chức mã | `net/play5d/game/bvn`, class/controller AS3 | Script theo frame/sprite; `_root`, `_global`, `onEnterFrame` | Không dùng trực tiếp controller cũ trong BVN |
| Nhân vật | SWF trong archive nhúng, đã giải nén dưới `extracted/binary/unpacked/assets/fighter/` | `loadMovie("fighter/" + url, mc)`; file ngoài đang thiếu | Chưa thể so sánh từng chiêu/khung hình |
| Điều khiển animation | `FighterMC`, `FighterMcCtrler`, MovieClip AS3 và callback | `_root.game.p1.mc`, `gotoAndPlay`, `_currentframe`, các nhãn timeline | Cần chuyển timeline và các sự kiện theo frame |
| Vùng đánh | Cache `body`, `hit`, `hit_check`; `FighterHitModel`, `HitVO` | Chưa xác định đủ do thiếu SWF nhân vật | Phải ánh xạ hoặc dựng lại hitbox, không giả định giống BVN |
| Nhịp thời gian | Header 30 FPS; GameConfig game 60, animation 30 | Header 30 FPS; script có onEnterFrame/setInterval | Cùng FPS header không đảm bảo timing chiêu giống nhau |
| Tài nguyên đồ họa/âm thanh | Đã xuất riêng | Đã xuất phần có trong SWF chính | Có thể tái sử dụng về kỹ thuật, cần kiểm tra scale, pivot, alpha và đồng bộ |

Bằng chứng BVN: `extracted/scripts/net/play5d/game/bvn/fighter/FighterMC.as` khai báo vùng `body`, `hit`, `hit_check`; `fighter/ctrler/FighterMcCtrler.as` có `setSkill1`, `setBisha`, `fire`, `endAct`, `doAction`; `GameConfig.as` khai báo các nhịp FPS. Tất cả đường dẫn BVN trong đoạn này tính từ thư mục game BVN.

Bằng chứng game thứ hai: `DefineSprite_1881/frame_1/DoAction.as` gọi animation mở đầu qua `_root.game.p1.mc.gotoAndPlay`, đọc/ghi `hp`, `ql`, `beida`; `frame_6/DoAction.as` có pause/resume và hiệu ứng dùng các đối tượng toàn cục. Đây là phụ thuộc vào engine nguồn cần thay thế, không phải bằng chứng rằng mọi logic nhân vật đã nằm trong main SWF.

## Hướng tích hợp đề xuất

1. Bổ sung ít nhất một SWF nhân vật, ví dụ `fighter/luffy.swf`, lấy đúng từ các request của cùng bản game. Giữ đường dẫn nguồn và checksum. Không trộn file giữa các phiên bản chỉ vì tên giống nhau.
2. Xuất animation, ảnh/shape, âm thanh, nhãn frame và script của nhân vật; lập bảng chiêu, thời gian startup/active/recovery, sự kiện sinh đạn, hitbox và phụ thuộc vào `_root`.
3. Dựng nhân vật AS3 theo hợp đồng BVN: animation cơ bản, hướng nhìn, tọa độ/pivot, vùng body/hit, sự kiện điều khiển, HitVO và projectile. Không coi việc nạp một SWF AVM1 vào ứng dụng AS3 là đã có nhân vật AS3 dùng được.
4. Thêm khai báo nhân vật và lựa chọn vào dữ liệu BVN; dùng ID riêng tránh trùng tên tài nguyên.
5. Kiểm tra đứng/chạy/nhảy/trúng đòn trước, rồi một đòn thường và một chiêu. Sau đó mới mở rộng combo, biến hình, AI và các nhân vật khác.
6. Thêm cấu hình cooldown riêng theo ID nhân vật + chiêu, bộ đếm riêng cho mỗi đấu sĩ. Cooldown có thể tách khỏi logic thực thi; delay cần gắn đúng sự kiện/frame của animation đã chuyển.

Tiêu chí thử nghiệm: cả hai hướng đánh; cùng nhân vật ở hai bên; pause/resume; đạn biến mất đúng lúc; không gây nhiều hit ngoài ý muốn; reset trạng thái sau KO/đổi trận; AI và người chơi cùng tuân thủ cooldown.

## Đánh giá phạm vi

- Ghép nguyên hai main SWF thành một engine: không phải hướng phù hợp.
- Chép nguyên SWF nhân vật nguồn vào BVN: không tương thích trực tiếp theo kiến trúc đã thấy.
- Chuyển nhân vật/tài nguyên sang BVN: khả thi về kiến trúc, nhưng cần viết lại lớp điều khiển và kiểm chứng bằng một nhân vật mẫu.
- Giữ nguyên từng chiêu với hành vi hoàn toàn giống nguồn: chưa thể cam kết khi thiếu file nhân vật và chưa chạy đối chiếu.

Công việc của lượt này là giải nén, tổ chức và phân tích; chưa chỉnh gameplay hay tạo bản game ghép.
