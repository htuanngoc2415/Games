# Nghiên cứu: chơi qua LAN, 2 vs 2 và tay cầm

Ngày: 2026-10-27. Phần 1 vs 1 qua LAN đã làm xong (mục 5); khảo sát 2 vs 2 và 1 vs 1 vs 1 vs 1 ở mục 6; tay cầm chưa làm. Khảo sát dựa trên mã BVN đã giải nén và Ruffle bản 2026-10-12.

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

## 6. Khảo sát 2 vs 2 và 1 vs 1 vs 1 vs 1 (hai máy, mỗi máy hai người)

Yêu cầu: hai máy cùng Wi-Fi/LAN, mỗi máy có hai người chơi trên cùng bàn phím (người 1: W A S D J K L U I O; người 2: mũi tên và phím số), tổng bốn đấu sĩ cùng đánh trong một trận. Hai kiểu: **2 vs 2** (hai đội) và **tự do 1 vs 1 vs 1 vs 1** (bốn đội một người). Mục "Đấu đội" (3 đấu sĩ thay phiên) đã gỡ khỏi menu; nó khác hẳn 2 vs 2 vì chỉ có hai đấu sĩ trên sân.

### 6.1 Điều đã có sẵn trong engine (đọc mã, chưa chạy thử)

| Thành phần | Hiện trạng | Ý nghĩa cho 4 đấu sĩ |
|---|---|---|
| Đội | `TeamMap`/`TeamVO` chứa số đội tuỳ ý; mỗi đấu sĩ có `targetTeams` = mọi đội khác (`getOtherTeams`); `getTargets()` gộp đối thủ còn sống của các đội đó | Đội hay tự do đều biểu diễn được bằng cách chia đội; hai người cùng đội không đánh trúng nhau |
| Va chạm/đòn | `GameMainLogicCtrler` duyệt mọi cặp đội, không giả định hai đội | Dùng nguyên |
| Camera | `camera.focus(mảng)` với `autoZoom` (chế độ Phiêu lưu đã dùng nhiều mục tiêu) | Ôm cả bốn đấu sĩ bằng cách đưa đủ bốn vào mảng |
| Đầu vào | `FighterKeyCtrl.inputType` là chuỗi; `GameInputer.setInput(tên, [IGameInput])` nhận tên bất kỳ | Thêm "P3", "P4" gắn `NetInput` thứ 3, 4; không cần phím mới vì trong LAN mọi đầu vào đi qua mạng |
| Mạng | Relay đã hỗ trợ tối đa 4 client; lockstep gom đầu vào theo khung | Mở rộng từ 2 lên bốn ô đầu vào |

### 6.2 Chỗ đang cứng theo hai đội (phải sửa)

- `GameRunDataVO`: chỉ có `p1FighterGroup`, `p2FighterGroup`, `p1Wins`, `p2Wins`, `getWins` (`team.id - 1`). Cần mảng bốn nhóm và số thắng theo đội.
- `GameCtrl`: `buildGame` (tạo đúng hai đấu sĩ, màu đổi khi trùng nhân vật), `addFighter` (case 0/1), `getEnemyTeam` (trả đội đối diện), `doGameEnd`/`onFighterDie` (một người chết là hết hiệp), `startNextRound`, `fightTimeover` (so máu P1/P2).
  Luật mới: hiệp kết thúc khi chỉ còn không quá một đội còn người sống; hết giờ thì so tổng máu còn lại giữa các đội; hoà khi cùng hạ gục.
- `FighterEventCtrl.addAssister` chọn nhóm theo `team.id == 1` (cần tra theo đấu sĩ); `addHits`/`FightBar` có `switch(team.id - 1)`; `FighterMcCtrler` gọi `getAttacker(.., team.id)`.
- `GameStartCtrl.start1v1`/`GameEndCtrl` (vị trí xuất hiện, màn giới thiệu, tư thế thắng): chỉ nhận hai đấu sĩ; cần vị trí cho bốn và chọn "người thắng" là một thành viên đội thắng.
- `GameState.initFight/resetFight` và `LoadingState.gotoGame`: nhận hai nhóm; cần nạp tài nguyên cho bốn đấu sĩ và bốn trợ chiến.
- `FightUI` (giao diện nhúng sẵn trong SWF): chỉ có hai thanh máu và hai thanh năng lượng. Giữ hai thanh nhúng cho đấu sĩ 1 và đấu sĩ 3, vẽ bằng mã hai thanh nhỏ cho đấu sĩ 2 và 4 (cách đã dùng cho ô hồi chiêu). Số vòng thắng, bộ đếm combo cũng đang theo P1/P2.
- Màn chọn nhân vật (`SelectFighterStage`, 1.219 dòng) có hai con trỏ `_p1Slt`, `_p2Slt`. **Không cần làm bốn con trỏ:** mỗi máy chạy đúng màn chọn hai người của chế độ "Hai người chơi" (người 1 dùng bộ phím P1, người 2 dùng bộ phím mũi tên), rồi gửi cả hai lựa chọn sang máy kia. Máy chủ chọn bản đồ.

### 6.3 Thiết kế mạng mở rộng

- Mỗi máy báo số người chơi cục bộ (1 hoặc 2) khi vào phòng; chủ phòng gán ô: máy A = ô 1, 2; máy B = ô 3, 4. Tổng tối đa 4, nên cũng dùng được kiểu 4 máy mỗi máy một người nếu sau này cần.
- `INPUT` chuyển từ một mặt nạ phím 16 bit thành danh sách mặt nạ theo ô của máy đó; một khung chỉ chạy khi nhận đủ đầu vào của mọi máy (cùng cơ chế chờ như hiện nay). Mã băm trạng thái duyệt qua cả bốn đấu sĩ.
- Phòng: chủ phòng chọn **kiểu trận** (2 vs 2 / tự do) và **cách ghép đội** (máy A đấu máy B, hoặc mỗi máy chia hai đội: A1 + B1 đấu A2 + B2). Mặc định: máy A đấu máy B.
- Một người trên máy ngắt kết nối giữa trận: dừng trận và báo, như 1 vs 1 hiện nay.

### 6.4 Rủi ro

- **Hiệu năng:** bốn đấu sĩ, bốn trợ chiến và hiệu ứng đòn đồng thời trên Ruffle chưa từng chạy; lockstep cần cả hai máy giữ đủ tốc độ 60 khung/giây. Cần đo sớm trên máy yếu nhất.
- **Phím:** hai người chung một bàn phím dễ gặp giới hạn nhiều phím cùng lúc (phím ma) trên bàn phím phổ thông; chưa kiểm được trên máy thật.
- **Xác định:** thứ tự duyệt các đội/đấu sĩ phải giống nhau trên hai máy; `TeamMap` dùng `Object` để lưu đội nên cần ép thứ tự cố định khi lấy danh sách.
- **Cân bằng:** thanh máu mỗi người vẫn tính như 1 vs 1, nên 2 vs 2 sẽ dễ có người bị đánh hội đồng; có thể cần tăng máu hoặc cho chỉnh trong Config.
- **Thử nghiệm:** kiểm thử tự động cần hai trình duyệt, mỗi trình duyệt bấm hai bộ phím; kịch bản `lan_test.py` mở rộng được.

### 6.5 Thứ tự đề nghị

1. **Lõi bốn đấu sĩ** (chưa có mạng): dùng cờ thử để dựng trận bốn đấu sĩ điều khiển bằng AI hoặc đầu vào giả, sửa `GameRunDataVO`, `GameCtrl`, luật thắng, vị trí xuất hiện, camera, thanh máu. Kiểm tra bằng ảnh chụp và theo dõi số khung hình/giây.
2. **Chọn nhân vật và nạp trận** cho bốn đấu sĩ (hai người chọn trên mỗi máy, bốn nhóm tài nguyên).
3. **Mạng:** `INPUT` nhiều ô, lobby chọn kiểu trận và ghép đội, so mã băm bốn đấu sĩ.
4. **Kiểm thử hai trình duyệt** (mỗi trình duyệt hai người) cho cả 2 vs 2 và tự do; lặp lại đến khi mã băm khớp suốt nhiều trận.
5. Tay cầm làm sau, độc lập (cầu nối trong launcher).

Ước lượng khối lượng: bước 1 là phần lớn công việc và rủi ro (khoảng 15 file chạm tới); bước 2 và 3 vừa phải nhờ tận dụng được màn chọn hiện có và khung lockstep sẵn.
