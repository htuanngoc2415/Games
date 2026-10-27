# Giao diện tiếng Việt và nền chính

Ảnh chính mới tạo bằng imagegen tích hợp có Ichigo, Naruto, Natsu, Luffy và tên bốn bộ truyện. Bản gốc: `assets/backgrounds/crossover_title_master.png`; bản dùng trong game: `assets/backgrounds/crossover_title.jpg`. Prompt đầy đủ: `title_background_prompt.json`.

`MenuState` dùng nền mới và menu bốn mục: Đấu đội, Đấu đơn, Phiêu lưu (Musou), Cài đặt. Bỏ đường chọn Training, Credits, More Games và Rank; danh sách menu lấy trực tiếp cấu hình cục bộ, không nhận mục Rank chèn bởi cổng game. Nút More Games ở màn kết quả cũng bị ẩn và vô hiệu hóa. Các lớp cũ vẫn có thể tồn tại trong binary nền nhưng không còn đường vào từ menu.

Đã Việt hóa menu con, cài đặt, điều khiển phím, tạm dừng, thông báo xác nhận, thông báo tải và các nút quay lại. Hướng dẫn trước trận là giao diện chữ tiếng Việt, đọc phím hiện tại từ cấu hình. Danh sách chiêu giữ hình minh họa và phủ nhãn tiếng Việt lên vùng tiêu đề cũ. Cài đặt dùng nền crossover làm mờ; nhãn Trung trong hình phím được thay bằng lớp chữ tiếng Việt.

Font DejaVu Sans được nhúng vào SWF bằng `tools/ftop_port/EmbedVietnameseFont.java`, có 412 ký tự bao gồm đầy đủ chữ Việt dựng sẵn. Không phụ thuộc font thiết bị của Ruffle. Font và giấy phép nằm ở `assets/fonts/`. Mã thao tác menu, tên nhãn timeline chiến đấu và các ID nội bộ không dịch để giữ hành vi engine.

Build: `bash games/anime_crossover_bvn/build_gameplay.sh`, sau đó `bash tools/ruffle_test/make_test_swf.sh games/anime_crossover_bvn/working/anime_crossover_bvn.swf tools/ruffle_test/www/test.swf`. Bản chơi: `bash games/anime_crossover_bvn/play.sh`.

Ảnh kiểm tra trực tiếp Ruffle lưu tại `build/menu_preview/`; công cụ kiểm tra `tools/ruffle_test/run_menu_test.py` dùng máy chủ cục bộ cổng 8766. Đã kiểm tra luồng menu → cài đặt phím → hướng dẫn → chọn nhân vật. Báo cáo cuối: `ui_vietnamese_verification.json`. Các báo cáo chiến đấu/selection trước đây có hash của bản trước khi sửa giao diện; không coi đó là lần nghiệm thu gameplay mới.
