# Tài nguyên ngoài

Nguồn: scripts/frame_7/DoAction.as, frame_8/DoAction.as và DefineSprite_1872/frame_1/DoAction.as. Đường dẫn tương đối so với URL SWF gốc, không phải tên file được đổi lúc tải.

## Nhân vật đã tải

- `fighter/luffy.swf` — Luffy
- `fighter/luffy2.swf` — Luffy-2Y
- `fighter/zoro.swf` — Zoro
- `fighter/zoro2.swf` — Zoro-2Y
- `fighter/buggy.swf` — Buggy
- `fighter/crocodile.swf` — Crocodile
- `fighter/sanji.swf` — Sanji
- `fighter/sanji2.swf` — Sanji
- `fighter/robin2.swf` — Nico Robin
- `fighter/jinbei.swf` — Jinbei
- `fighter/law.swf` — Law
- `fighter/hancock.swf` — Hancock
- `fighter/nami.swf` — Nami
- `fighter/ace.swf` — Ace
- `fighter/doflamingo.swf` — Doflamingo
- `fighter/natsu.swf` — Natsu
- `fighter/gray.swf` — Gray
- `fighter/lucy.swf` — Lucy
- `fighter/ersa.swf` — Ersa
- `fighter/gajeel.swf` — Gajeel
- `fighter/wendy.swf` — Wendy
- `fighter/mirajane.swf` — Mirajane
- `fighter/lasasi.swf` — Laxus
- `fighter/juvia.swf` — Juvia
- `fighter/makarov.swf` — Makarov

## Nhạc đã tải

- `music/desert.mp3`
- `music/ersa.mp3`
- `music/fairytail.mp3`
- `music/fairytail2.mp3`
- `music/fairytail3.mp3`
- `music/onepiece.mp3`
- `music/onepiece2.mp3`
- `music/onepiece3.mp3`
- `music/rain.mp3`
- `music/sea.mp3`
- `music/sunny.mp3`
- `music/wind.mp3`

Toàn bộ file trên đã được lưu trong `../downloaded/`, giữ nguyên cấu trúc `fighter/` và `music/`. Các SWF nhân vật có chữ ký `CWS`; các file nhạc được nhận dạng là MPEG Layer III. Checksum nằm trong `downloaded_sha256sums.txt`.

## Trợ chiến

Main SWF có biến `fzDir = "fighter/fz/"`, nhưng không có danh sách tên file trợ chiến và không có lệnh nạp SWF từ thư mục này. Kiểm tra 4.309 script xuất từ 25 SWF nhân vật cũng không tìm thấy URL `fighter/fz/*.swf` hay tên file `.swf` phụ thuộc. Các đối tượng `p1fz`/`p2fz` được dùng trong logic va chạm và hiệu ứng, nhưng bằng chứng hiện tại không cho thấy chúng là các file trợ chiến tải ngoài.

Vì vậy không có file trợ chiến xác định để tải từ bộ V1.1 này. Nếu bản 2.0 thật tải thêm request khi vào trận, cần ghi lại Network log của bản đó.
