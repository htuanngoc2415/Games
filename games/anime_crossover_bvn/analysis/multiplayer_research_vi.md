# Nghiên cứu: chơi qua LAN, 2 vs 2 và tay cầm

Ngày: 2026-10-27. Phần 1 vs 1 qua LAN đã làm xong (mục 5); 2 vs 2 và tay cầm chưa làm. Khảo sát dựa trên mã BVN đã giải nén và Ruffle bản 2026-10-12.

## 1. Những điều đã xác nhận

| Điều kiểm tra | Kết quả | Ý nghĩa |
|---|---|---|
| Nguồn điều khiển | Mọi đầu vào đi qua `GameInputer` (`left/right/attack/...(inputType)`), có `GameInputer.setInput(loại, [IGameInput])` | Gắn người chơi từ xa hoặc tay cầm như một nguồn đầu vào mới, không viết lại chiến đấu |
| Nhịp game | Logic chạy theo `enterFrame` (`GameRender`); đồng hồ trận đếm theo khung hình; slow-motion, làm mờ nền, hiệu ứng đều đếm khung hình | Hợp với lockstep (mỗi khung hình chỉ chạy khi đủ đầu vào hai bên) |
| Đồng hồ thật | Không có `setTimeout`, `Timer`, `getTimer`, tween trong `ctrl/`, `fighter/`, `data/` (chỉ SoundCtrl, chế độ Phiêu lưu) | Logic không lệ thuộc tốc độ máy |
| Ngẫu nhiên | `Math.random` trong logic: `FighterMcCtrler` (lực đẩy khi bị đánh, dòng 1817–1823), `FighterAILogicBase`, `EnemyFighterAICtrl` (CPU) | Phải thay bằng bộ ngẫu nhiên có hạt giống chung hai máy; tổng cộng khoảng 8–10 chỗ |
| Socket | Ruffle desktop có `flash.net.Socket` TCP thật (`socket.rs`), cần cờ `--socket-allow allow` | Truyền đầu vào qua LAN được; bản chạy trong trình duyệt thì **không** (chỉ WebSocket) |
| Tay cầm | Ruffle gửi nút tay cầm nhưng **không kèm số thứ tự tay cầm**; `flash.ui.GameInput.isSupported = false` | Hai tay cầm trên một máy bị Ruffle gộp thành một người chơi |
| Đội hình | `TeamVO.children` là danh sách tuỳ ý, vòng kiểm tra va chạm duyệt mọi cặp đội | Nhiều nhân vật mỗi đội là được; nhưng `GameRunData` chỉ có `p1FighterGroup`/`p2FighterGroup` (khoảng 126 chỗ tham chiếu) |

## 2. Thiết kế đề xuất

**Mạng (2 máy, LAN):** lockstep có trễ đầu vào cố định (3–4 khung = 50–70 ms). Mỗi máy chạy toàn bộ trận; mỗi khung gửi phím của mình, đợi phím của máy kia rồi mới chạy khung đó. Máy chủ gửi trước: hạt giống ngẫu nhiên, nhân vật, bản đồ, và các giá trị chỉnh (hồi chiêu/sát thương/tốc độ) để hai bên giống hệt nhau. Mỗi 60 khung trao đổi mã băm trạng thái (vị trí, máu, nhãn khung) để phát hiện lệch và báo lỗi thay vì chơi tiếp sai.

**Tay cầm:** một tiến trình phụ nhỏ (trong launcher) đọc từng tay cầm riêng (XInput trên Windows, `/dev/input/js*` trên Linux), mở cổng TCP cục bộ; game nối vào bằng `Socket` và nhận sự kiện theo số người chơi. Cùng một cơ chế socket với phần mạng, không cần chèn phím giả vào hệ điều hành.

**2 vs 2:** thêm nhóm nhân vật p3/p4 vào `GameRunData`, đội 1 = {p1, p3}, đội 2 = {p2, p4}; mở rộng màn chọn, thanh máu, camera (khung hình ôm cả 4 nhân vật), điều kiện thắng (cả đội bị hạ). Mỗi người một bộ phím riêng (thêm `key_p3`, `key_p4`).

## 3. Rủi ro và việc chưa kiểm chứng
- Lockstep chỉ đúng khi mô phỏng xác định tuyệt đối; bước đầu phải dựng bộ phát hiện lệch rồi dò các chỗ còn lệch (hiệu ứng ảnh hưởng vị trí, thứ tự duyệt `Dictionary`...).
- Mình chưa thử Socket của Ruffle thật giữa hai tiến trình, chưa thử thật trên hai máy riêng, và không thể thử bản Windows trên máy này.
- 2 vs 2 chạm nhiều file (màn chọn, UI, camera, AI chọn mục tiêu): lớn nhất trong ba việc.

## 4. Thứ tự đề nghị
1. Hạt giống ngẫu nhiên chung + mã băm trạng thái + thử Socket giữa hai Ruffle trên cùng máy.
2. Chơi 1 vs 1 qua LAN (tạo phòng/nhập IP, đồng bộ cấu hình, đợi nạp xong, thông báo lệch).
3. Tay cầm nhiều người (bridge + `Socket`).
4. 2 vs 2 cục bộ (4 tay cầm/bàn phím), rồi 2 vs 2 qua LAN (lockstep 4 đầu vào).

## 5. Kết quả triển khai 1 vs 1 qua LAN (2026-10-27)

Đã làm theo thiết kế ở mục 2. Kiểm thử bằng hai Ruffle (Chromium ngầm) qua relay thật trên một máy:
tạo phòng, vào phòng, chọn nhân vật, tải trận, đánh nhau đến hạ gục, quay về phòng, chơi tiếp, thoát giữa trận.
Một trận đầy đủ chạy 2.016 khung hình với 33 lần so mã băm đều khớp.

Những điều tìm ra khi kiểm thử (đều đã sửa):
- Bộ đếm khung bị tăng sớm một khung ở khung đầu tiên nên tin đầu vào đầu tiên không bao giờ được gửi.
- `new Vector.<IGameInput>([x])` tạo vector rỗng nên nhân vật không nhận điều khiển (mã băm khi đó vẫn "khớp" vì
  hai máy cùng đứng yên: **phải kiểm tra cả vị trí thay đổi, không chỉ mã băm**).
- Cảnh KO trong `FightUI` dùng đồng hồ thật (`setTimeout` 500 ms, `getTimer` 2 giây) làm hai máy lệch vài phần trăm pixel;
  đã đổi sang đếm khung hình.

Giới hạn còn lại:
- Chưa thử giữa hai máy thật, và chưa thử Windows. Rủi ro lớn nhất là khác biệt số thực giữa hệ điều hành
  (hàm sin/cos/pow); nếu có thì bộ mã băm sẽ báo "Mất đồng bộ" thay vì chơi sai.
- Chưa có tìm phòng tự động (phải nhập IP), chưa có đo độ trễ hiển thị, chưa xử lý mạng chập chờn (chỉ báo mất kết nối sau 12 giây).
- Chế độ hai người dùng bộ phím P1 trên máy của mỗi người; chưa hỗ trợ tay cầm.
- Trong trận LAN, tạm dừng (Esc) bị tắt: Esc là thoát phòng.
