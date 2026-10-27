# Kết quả xuất SWF thứ hai

JPEXS FFDec 26.3.0, chế độ headless; export all, sprite/frame/button dùng SVG. Exit code 0; log kết thúc OK, thời gian JPEXS ghi nhận 190.701 giây. Không tìm thấy chỉ báo error/exception/failed/timeout trong log. Việc dịch ngược thành công không đảm bảo mã có thể biên dịch lại hoặc không có sai lệch dịch ngược.

| Nhóm | Số file | Dung lượng byte |
|---|---:|---:|
| buttons | 144 | 683945 |
| fonts | 7 | 203900 |
| frames | 167 | 81802197 |
| images | 737 | 19601953 |
| morphshapes | 4 | 6009 |
| movies | 0 | 0 |
| scripts | 400 | 153633 |
| shapes | 802 | 52665460 |
| sounds | 58 | 2068297 |
| sprites | 8253 | 1169865087 |
| symbolClass | 1 | 548 |
| texts | 133 | 2294 |

Số file sprite/frame là số file biểu diễn frame, không phải số nhân vật. Không có DefineBinaryData/DoABC trong bảng tag SWF chính; không có archive nhân vật nhúng theo mô hình BVN. SWF nhân vật và nhạc ngoài chưa được cung cấp; xem missing_assets.md.

Bản gốc và bản working khớp SHA256 đã lưu trước xuất. Chưa sửa gameplay, chưa chạy kiểm chứng. Các script theo frame/sprite và package được giữ nguyên cấu trúc JPEXS.
