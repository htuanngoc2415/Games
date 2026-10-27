# Chính sách tái sử dụng hitbox

## Nhân vật BVN

Giữ nguyên SWF gốc, frame label, instance hitbox và dữ liệu HitVO. `FighterMC` của BVN tự tìm vùng thân qua instance `bdmn`. Vùng đánh được xác định bằng cách duyệt các display object ở frame hiện tại và tra tên instance trong `FighterHitModel`; vì vậy không đổi tên hay raster hóa các object này.

65 định nghĩa fighter thường và 11 enemy giữ trạng thái `playable_existing` trong inventory. Ba mục random chỉ là selector, không phải nhân vật. 37 trợ chiến giữ nguyên SWF và hitbox; ba mục random trợ chiến cũng chỉ là selector.

## Nhân vật Fairy Tail vs One Piece

Timeline nguồn cũng dùng `bdmn` cho vùng thân và nhiều instance vùng đánh có hậu tố `atm`, ví dụ `k1atm`, `zh2atm`, `bsatm`. Khi publish lại sang AVM2:

1. Giữ nguyên hình học, transform, pivot và khoảng frame của `bdmn`.
2. Giữ nguyên từng object `*atm`; tạo HitVO tương ứng thay vì gộp thành một hình chữ nhật chung.
3. Chuyển bộ thông số AS2 `gjl*.{name}pw/zl/up/x/tm/dz` thành power, độ cứng, lực hất, thời gian choáng và loại hurt của HitVO.
4. Chỉ thêm `hit_check` cho projectile/catch cần vùng kiểm tra riêng; không thay vùng đánh đang có.
5. Kiểm tra cả hướng trái và phải vì BVN lật tọa độ hitbox theo `fighter.direct`.

`analysis/xfl_inventory.json` lưu frame label và tên vùng đánh tìm được của cả 25 timeline FTOP. Đây là dữ liệu nguồn; trạng thái `timeline_exported` chưa có nghĩa là nhân vật đã chạy được trong AVM2.
