# Anime Crossover

Game đối kháng 2D nơi các nhân vật Bleach, Naruto, Fairy Tail và One Piece đứng chung một võ đài.
Chọn đấu sĩ, gọi thêm một trợ chiến, tung combo, tuyệt chiêu rồi hạ đối thủ. Chơi một mình với máy,
hai người trên cùng một bàn phím, hoặc hai máy qua Wi-Fi / mạng LAN.

Giao diện hoàn toàn bằng tiếng Việt.

## Điểm nổi bật

- **90 lựa chọn đấu sĩ** từ bốn thế giới, kể cả biến thể, cùng các ô "Random" theo từng thế giới hoặc chung tất cả.
  Có cả Natsu, Erza, Gray, Luffy, Zoro, Sanji, Law, Ace và nhiều người khác từ Fairy Tail và One Piece.
- **Chơi LAN 1 vs 1**: một người tạo phòng, người kia nhập địa chỉ IP là vào trận. Hai máy chạy cùng một trận,
  chỉ trao đổi phím bấm nên rất nhẹ, có kiểm tra đồng bộ để không chơi lệch.
- **Tự cân bằng theo ý bạn**: mục **Config** trong menu cho chỉnh ngay trong game, riêng từng nhân vật hoặc chung tất cả:
  thời gian hồi chiêu của 10 loại chiêu, sát thương gây ra (0 - 1000%) và tốc độ di chuyển (0 - 500%).
  Trong trận có hai ô nhỏ cho biết chiêu U và I đã hồi xong hay chưa.
- **Nhiều chế độ**: Đấu đơn (hai người hoặc với máy), Phiêu lưu, Chơi LAN.
- **Chạy ngay, không cài đặt**: giải nén rồi bấm đúp. Có bản cho Windows và Linux, dữ liệu lưu nằm ngay cạnh game.

## Chơi thế nào

| Người chơi 1 | Phím |
|---|---|
| Di chuyển / đỡ đòn | W A S D |
| Đánh | J |
| Nhảy (nhấn hai lần để nhảy đôi) | K |
| Lướt | L |
| Kỹ năng | U |
| Tuyệt chiêu (cần năng lượng) | I |
| Gọi trợ chiến | O |

Người chơi 2 dùng phím mũi tên và các phím số ở bàn phím số (1 - 6). Kết hợp Lên hoặc Xuống với J, U, I để ra chiêu khác.
Đổi phím trong mục **Cài đặt**. Phím F11 hoặc Alt + Enter: toàn màn hình.

### Chạy game

- **Windows:** giải nén, bấm đúp `AnimeCrossover.exe`. Nếu SmartScreen cảnh báo, chọn "Thông tin thêm" rồi "Vẫn chạy".
- **Linux:** giải nén, bấm đúp `AnimeCrossover`, hoặc chạy `./AnimeCrossover` trong terminal
  (nếu báo thiếu quyền: `chmod +x AnimeCrossover engine/ruffle`).

Lần đầu game tải tài nguyên khoảng 1 - 2 phút ở màn "Đang tải", cứ chờ. Cần card đồ hoạ hỗ trợ Vulkan, DirectX 12 hoặc OpenGL
(máy từ khoảng năm 2015 trở lên đều có).

### Chơi hai máy qua Wi-Fi hoặc LAN

1. Cả hai máy cùng mạng và đều chạy bằng `AnimeCrossover` (không mở thẳng file game).
2. Máy A: **Chơi LAN → Tạo phòng**. Màn hình hiện địa chỉ như `192.168.1.5`.
3. Máy B: **Chơi LAN → Tham gia phòng**, nhập địa chỉ đó, bấm **Kết nối**.
4. Chủ phòng bấm **Bắt đầu chọn nhân vật**. Mỗi người chọn đấu sĩ của mình, chủ phòng chọn thêm bản đồ.
5. Hết trận cả hai quay về phòng, chủ phòng bấm J để đấu tiếp. Esc để thoát phòng.

Cổng dùng: TCP 47801. Windows có thể hỏi về tường lửa lần đầu, chọn "Cho phép" cho mạng riêng.
Wi-Fi công cộng hoặc Wi-Fi khách thường chặn các máy nhìn thấy nhau; khi đó hãy dùng điểm phát Wi-Fi từ điện thoại.
Hướng dẫn đầy đủ nằm trong `HUONG_DAN.txt` đi kèm bản đóng gói.

## Ghi công

Anime Crossover là dự án fan làm ra để vui, phi thương mại, không liên kết với các chủ sở hữu thương hiệu.

- Phần lõi chiến đấu dựa trên **Bleach vs Naruto 3.5** (Play5D / Bleach vs Naruto Team).
- Nhân vật Fairy Tail và One Piece lấy từ **Fairy Tail vs One Piece** và được chuyển sang cùng bộ máy chiến đấu.
- Các nhân vật, tên gọi, hình ảnh và âm nhạc thuộc về chủ sở hữu của Bleach, Naruto, Fairy Tail và One Piece
  cùng tác giả các game gốc; nếu bạn là chủ sở hữu và muốn gỡ bất cứ nội dung nào, hãy liên hệ để dự án xử lý.
- Game chạy trên **[Ruffle](https://ruffle.rs)** (MIT / Apache-2.0).

## Dành cho người phát triển

Mã nguồn, cách build, cách chuyển thêm nhân vật, hệ thống LAN và các ghi chú kỹ thuật:

- [games/anime_crossover_bvn/README.md](games/anime_crossover_bvn/README.md): build, cấu hình gameplay, port nhân vật, LAN.
- [WORKSPACE.md](WORKSPACE.md): cấu trúc thư mục phân tích hai game gốc.
- [games/anime_crossover_bvn/analysis/multiplayer_research_vi.md](games/anime_crossover_bvn/analysis/multiplayer_research_vi.md): nghiên cứu LAN, 2 vs 2, tay cầm.
