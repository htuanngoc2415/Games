# Hồ sơ tổng hợp dự án ghép hai game Flash

Tài liệu này dùng để chuyển ngữ cảnh cho ChatGPT hoặc một lập trình viên khác. Mục tiêu là ghép nhân vật Fairy Tail vs One Piece vào engine Bleach vs Naruto, đồng thời bổ sung cooldown có thể chỉnh bằng config.

## Cập nhật giao diện tiếng Việt và menu chính

Đã tạo nền chính riêng cho bốn bộ truyện; menu còn Đấu đội, Đấu đơn, Phiêu lưu và Cài đặt. Bỏ More Games, Credits, Rank, Training khỏi đường chọn. Việt hóa giao diện và nhúng font có đủ dấu tiếng Việt vào SWF. Chi tiết nguồn ảnh, prompt, các màn đã sửa và kiểm tra: [ui_vietnamese_status_vi.md](ui_vietnamese_status_vi.md).

## Cập nhật nền tải và kiểm tra support

Nền tải mới có Ichigo, Naruto, Natsu, Luffy và đủ tên BLEACH / NARUTO / FAIRY TAIL / ONE PIECE. Ảnh tạo bằng imagegen tích hợp; bản gốc `assets/backgrounds/crossover_loading_master.png`, bản runtime 804×604 `assets/backgrounds/crossover_loading.jpg`, prompt đầy đủ `analysis/loading_background_prompt.json`. `build_gameplay.sh` thay bitmap 105 trong loading SWF rồi nhúng lại binary 15. Đã xác nhận hình trong Ruffle: `build/loading_preview/03.png`; kiểm chứng binary tại `analysis/loading_background_verification.json`. Báo cáo runtime selection trước đó vẫn ghi hash của bản trước khi thay nền; ZIP roster không đổi.

FTOP 2.0 có khung mã `fzDir`, `yfgj`, `removeFZ`, nhưng không có roster support hoặc tên/file SWF trợ chiến riêng trong dữ liệu đã trích xuất. Xem `../fairy_tail_vs_one_piece_2.0/analysis/external_dependencies.json` (tính từ thư mục dự án) và script nguồn frame 6–8. Không thêm support hay random FT/OP rỗng; giữ support BVN hiện có theo yêu cầu người dùng.

## Cập nhật màn chọn và random

Màn chọn hiện dùng lưới 12×7, 25 FTOP đều hiện trực tiếp. Đủ năm ô random: Bleach 31, Naruto 34, Fairy Tail 10, One Piece 15, toàn bộ 90 fighter/biến thể. Nhóm random tách khỏi mã hiệu ứng chiến đấu; NPC không tham gia. Có hai ảnh random mới tạo bằng imagegen và bản runtime 50×48. Bố cục nguồn: `assets/config/crossover_select.json`. Chi tiết và bằng chứng runtime: [selection_random_status_vi.md](selection_random_status_vi.md).

Các mô tả “năm nhóm chọn” bên dưới là bố cục của lượt port trước, đã được thay bằng lưới mới.

## Cập nhật chuyển toàn bộ roster — 2026-10-26

Đã tạo 24 cấu hình port mới và SWF AS3 tương ứng; bản working hiện nhúng đủ 25 FTOP. Có portrait/cut-in gốc, HitVO, âm thanh, đạn và năm nhóm chọn (không vượt giới hạn tám ô phụ BVN). 102 SWF BVN gốc vẫn nguyên byte. Báo cáo chi tiết: [roster_port_status_vi.md](roster_port_status_vi.md), [roster_verification.json](roster_verification.json).

Trạng thái `timeline_ported` của 24 bản mới có chủ đích: compile + kiểm tra cấu trúc + smoke test chưa thay thế các tiêu chí gameplay đầy đủ ở mục 9. Còn bốn callback `wankai` nguồn chưa ánh xạ; đã xác nhận SWF nguồn tương ứng không có nhãn `万解` và chỉ có một frame gốc. Các form riêng vẫn chọn được.

## 1. Mục tiêu sản phẩm

- Dùng Bleach vs Naruto 3.5 làm engine chiến đấu chính.
- Giữ toàn bộ fighter, enemy và trợ chiến BVN hiện có.
- Chuyển 25 nhân vật Fairy Tail vs One Piece sang chuẩn fighter BVN.
- Tái sử dụng animation, hitbox, hiệu ứng và âm thanh gốc khi có thể.
- Cho phép chỉnh cooldown, thời gian choáng, tốc độ ra đòn, sát thương, tốc độ đi theo từng nhân vật qua XML.
- Giai đoạn đầu giữ giao diện BVN; chỉ trộn hoặc thay UI sau khi gameplay ổn định.

## 2. Cấu trúc workspace

```text
games/
  bleach_vs_naruto_3.5/          # nguồn BVN đã giải nén
  fairy_tail_vs_one_piece_2.0/   # nguồn FTOP đã giải nén + tài nguyên tải ngoài
  anime_crossover_bvn/           # game hợp nhất đang phát triển
    sources/                     # liên kết đến hai folder nguồn trên
    original/                    # SWF BVN nền, bất biến
    working/                     # SWF có hệ cooldown mới
    assets/                      # tài nguyên BVN và FTOP đã gom
    extracted/                   # AS3 BVN dùng để patch
    build/                       # ZIP, SWF trung gian và XFL nguồn
    analysis/                    # manifest, kiểm chứng và báo cáo
    patches/
    dist/
```

`sources/` dùng symbolic link nên không nhân đôi hai folder nguồn. Xóa link không xóa dữ liệu nguồn; không nên xóa hai thư mục thật khi dự án còn đang phát triển.

## 3. Bleach vs Naruto 3.5

### Công nghệ

- SWF version 19.
- ActionScript 3, chạy trên AVM2.
- Header SWF 30 FPS; game logic khai báo 60 FPS và animation 30 FPS.
- Mã chính nằm trong package `net.play5d.game.bvn`.
- Tài nguyên được đóng trong ZIP nhúng ở DefineBinaryData character ID 7.

### Roster

- `fighter.xml`: 79 định nghĩa.
- 65 fighter thường/biến thể có thể truy cập từ màn chọn, trực tiếp hoặc qua `moreFighter`.
- 11 enemy/NPC có đường dẫn `fighter/xb/`.
- 3 mục random, không phải nhân vật thật.
- `assist.xml`: 37 trợ chiến thật và 3 mục random.
- 102 SWF vật lý trong cây `assets/fighter/`; nhiều biến thể dùng chung SWF và khác `startFrame`.

### Hệ thống fighter

Luồng chính:

```text
Input/AI
  -> FighterActionLogic
  -> FighterMcCtrler
  -> FighterMC/timeline
  -> FighterHitModel + HitVO
  -> GameMainLogicCtrler.checkHit
```

- `FighterMC` tìm vùng thân bằng instance tên `bdmn`.
- Ở mỗi frame, nó duyệt display object, lấy tên vùng đánh và tra `HitVO` tương ứng trong `FighterHitModel`.
- `hit_check` dùng cho vùng kiểm tra riêng của projectile/catch.
- Vì vậy hitbox nằm trong timeline fighter, còn sát thương và phản ứng trúng đòn được nối qua tên instance và HitVO.
- Các frame script gọi controller như `setAttack`, `setSkill1`, `setBisha`, `fire`, `addAttacker`, `endAct`.

### Trạng thái trong game hợp nhất

- Toàn bộ 102 SWF đã được mirror sang `assets/fighter/bvn/`.
- 295 tài nguyên face đã được mirror sang `assets/face/bvn/`.
- Checksum của 102 SWF trong game mới khớp BVN gốc.
- Giữ toàn bộ định nghĩa BVN; `fighter.xml`/`select.xml` runtime đã bổ sung 25 FTOP. `assist.xml` vẫn khớp nguyên bản.
- 65 fighter thường vẫn có đầy đủ đường chọn.
- 11 enemy được giữ làm NPC; chưa đưa vào màn chọn vì có thể thiếu bộ hành động dành cho người chơi.

## 4. Fairy Tail vs One Piece

### Nhận diện phiên bản và công nghệ

- File tải có tên `fairy_tail_vs_one_piece_2.0.swf`.
- Nội bộ SWF khai báo `V 1.1`, ngày `2016/7/25`.
- URL tài nguyên thực tế cũng dùng thư mục `data/fairyvop11/`.
- SWF version 8/9 tùy file nhân vật.
- ActionScript 2, chạy trên AVM1.
- Main SWF tải fighter ngoài bằng `loadMovie("fighter/" + url, mc)`.

Trang web mô tả bản 2.0 có 27 nhân vật, nhưng main SWF hiện có chỉ khai báo 25 file. Hai nhân vật chênh lệch chưa có trong bộ V1.1 này.

### Tài nguyên đã lấy được

- 25/25 SWF fighter được main SWF khai báo.
- 12/12 MP3 được config tham chiếu.
- Tất cả SWF có chữ ký `CWS`; không có file HTML lỗi lưu nhầm.
- Đã giải mã 4.309 file ActionScript từ 25 fighter.
- Đã xuất đủ 25 fighter sang XFL, tổng khoảng 223 MB.
- Mỗi fighter có khoảng 31–47 frame label và 15–31 tên vùng đánh nguồn.

### Danh sách 25 fighter

```text
Luffy, Luffy-2Y, Zoro, Zoro-2Y, Buggy, Crocodile,
Sanji, Sanji-2, Nico Robin, Jinbei, Law, Hancock,
Nami, Ace, Doflamingo, Natsu, Gray, Lucy, Ersa,
Gajeel, Wendy, Mirajane, Laxus, Juvia, Makarov
```

Tên file Laxus trong source là `lasasi.swf`; Erza được ghi là `ersa.swf`.

### Điểm tương đồng với BVN

FTOP có dấu hiệu cùng họ thiết kế timeline cũ với BVN:

- Vùng thân cũng dùng tên `bdmn`.
- Vùng đánh thường có hậu tố `atm`, ví dụ `k1atm`, `zh2atm`, `bsatm`.
- Frame label gồm `站立`, `走`, `瞬步`, `跳`, `落`, `砍1`, `砍技1`, `招1`, `必杀`, `上必杀`, `超必杀`, `防御`, `被打`, `击飞`, `起身`, `胜利`, `失败`.
- AS2 lưu thông số đòn trong các object `gjl1`, `gjl2` với hậu tố như `pw`, `zl`, `up`, `x`, `tm`, `dz`.

Điểm tương đồng giúp giữ hình học và timing, nhưng không xóa khác biệt runtime AVM1/AVM2.

### Trợ chiến FTOP

Main SWF có biến `fzDir = "fighter/fz/"`, nhưng không tìm thấy danh sách filename hay lệnh tải SWF trợ chiến ngoài. `p1fz`/`p2fz` xuất hiện trong logic va chạm, nhưng chưa đủ bằng chứng để xem chúng là hệ trợ chiến tải riêng. Hiện không có bộ SWF trợ chiến FTOP xác định để chuyển.

## 5. Vì sao không thể chép trực tiếp fighter FTOP vào BVN

- BVN controller là AS3/AVM2.
- Fighter FTOP chứa timeline và frame script AS2/AVM1.
- AVM2 có thể tải một AVM1 SWF như nội dung cũ, nhưng không thể điều khiển nó như MovieClip AS3 theo API fighter BVN.
- BVN cần frame script gọi `$mc_ctrler`, tên action hợp lệ, HitVO và sự kiện projectile.
- Chỉ thêm `fighter/natsu.swf` vào `fighter.xml` sẽ tạo mục chọn bị lỗi khi controller BVN gọi API không tồn tại.

## 6. Cân bằng gameplay đã triển khai

Game mới có `assets/config/gameplay.xml` (trước 2026-10-26 là `skill_cooldowns.xml`). Ngoài cooldown, file có `stunRate`, `attackSpeed`, `damageRate`, `moveSpeed`; xem chú thích đầu file và README dự án. Các loại chiêu có cooldown:

```text
skill1, skill2, skillAIR,
zhao1, zhao2, zhao3,
bisha, bishaUP, bishaSUPER, bishaAIR
```

Luồng xử lý:

1. Kiểm tra quyền dùng chiêu của Mosou và action hiện tại.
2. Kiểm tra bộ đếm cooldown của instance fighter.
3. Gọi controller thực hiện chiêu.
4. Chỉ khi controller trả về thành công mới bắt đầu cooldown.
5. `FighterMcCtrler.render()` giảm bộ đếm mỗi game tick.

Mỗi đấu sĩ có object cooldown riêng, nên hai người dùng cùng nhân vật không chia sẻ bộ đếm. Giá trị config là frame/tick; với game logic 60 FPS, 60 frame xấp xỉ 1 giây khi game chạy đúng nhịp.

Mã sửa nằm trong:

- `GameData.as`: nạp XML và trả cooldown theo fighter/skill.
- `FighterActionLogic.as`: chặn chiêu và bắt đầu cooldown.
- `FighterMcCtrler.as`: cập nhật bộ đếm.

Mã đã được JPEXS import vào `working/anime_crossover_bvn.swf`. Sau đó đã export ngược để xác nhận hàm mới tồn tại và XML nằm trong ZIP runtime. Chưa có runtime test bằng Flash Player/Ruffle GUI.

## 7. Chính sách hitbox khi chuyển FTOP

Không vẽ lại hitbox nếu dữ liệu nguồn còn dùng được:

1. Giữ nguyên `bdmn`, transform, pivot và khoảng frame.
2. Giữ riêng từng vùng `*atm`; không gộp mọi đòn thành một hitbox.
3. Tạo HitVO dựa trên tên vùng đánh và dữ liệu `gjl*`.
4. Ánh xạ đề xuất:

| AS2 FTOP | Ý nghĩa gần đúng | Đích BVN cần kiểm chứng |
|---|---|---|
| `*pw` | sức mạnh/sát thương | `HitVO.power` |
| `*up` | lực dọc | `hity` hoặc tham số hurt |
| `*x` | lực ngang | `hitx` |
| `*tm` | thời gian phản ứng | `hurtTime` |
| `*dz` | loại phản ứng, như bị đánh/đánh bay | `hurtType` |
| `*zl` | trọng lượng/độ cứng hoặc hệ số đòn | cần kiểm chứng từng nhánh AS2 |

5. Kiểm tra hướng trái/phải vì BVN đổi tọa độ theo `fighter.direct`.
6. Với projectile, chuyển logic tạo MovieClip AS2 sang `fire` hoặc `addAttacker` của BVN.

## 8. Các hướng triển khai

### Hướng A — Publish lại XFL bằng Adobe Animate

Khả thi nhất nếu có Adobe Animate:

1. Mở từng XFL nguồn.
2. Đổi document sang ActionScript 3.
3. Giữ timeline và symbol hình ảnh.
4. Loại bỏ frame script AS2.
5. Thêm frame script gọi API BVN.
6. Giữ/đổi tên hitbox theo mapping.
7. Publish thành SWF fighter AVM2.

Ưu điểm: giữ vector, tween, âm thanh và timeline tốt nhất. Nhược điểm: cần Animate và vẫn phải xử lý từng fighter.

### Hướng B — Pipeline mã nguồn mở tạo SWF mới

Xuất frame/symbol rồi dùng compiler hoặc thư viện tạo SWF AVM2. Cần tự xây MovieClip có frame label, depth, transform, mask và âm thanh. Đây là công cụ chuyển đổi riêng, công sức ban đầu lớn nhưng có thể tự động hóa nhiều fighter.

### Hướng C — Chuyển sang engine mới

Xuất animation/hitbox và dựng lại toàn bộ game bằng Godot/Unity/HTML5. Dễ duy trì lâu dài hơn Flash nhưng không còn là bản sửa BVN; phải viết lại chiến đấu, AI, camera, menu và hiệu ứng.

### Hướng D — Chuyển ở mức tag SWF (đã dùng, 2026-10-26)

Giữ nguyên các tag hình/sprite/âm thanh của SWF FTOP, bỏ bytecode AS2, sửa nhãn và tên instance, rồi biên dịch class AS3 sinh tự động bằng trình biên dịch tích hợp của thư viện JPEXS. Không cần Adobe Animate. Công cụ: `tools/ftop_port`; Natsu đã chơi được theo cách này.

### Khuyến nghị

(Ghi chú cũ, trước khi có Hướng D.) Dùng Hướng A cho một fighter mẫu, ưu tiên Natsu. Khi Natsu đạt đủ đứng/chạy/nhảy/trúng đòn/đánh thường/một chiêu/projectile/cooldown, đóng gói quy trình thành template rồi áp dụng cho 24 fighter còn lại. Không chỉnh UI trước khi mẫu gameplay chạy ổn.

## 9. Tiêu chí một fighter FTOP được coi là hoàn thành

- SWF là AVM2/AS3 và BVN tải được.
- Có đầy đủ action tối thiểu mà `FighterMcCtrler` gọi.
- `bdmn` hoạt động ở mọi action chính.
- Từng hitbox tạo đúng HitVO và không gây multi-hit ngoài ý muốn.
- Projectile xuất hiện, va chạm và tự hủy đúng.
- Âm thanh không bị nhân đôi.
- Hoạt động ở cả hướng trái và phải.
- Người chơi và AI đều điều khiển được.
- Hai bản sao cùng fighter không chia sẻ trạng thái/cooldown.
- Reset đúng sau KO, pause và trận mới.

## 10. Những việc chưa hoàn thành

- Đủ 25 nhân vật đã có bản port AS3 bằng Hướng D; 24 bản mới cần nghiệm thu gameplay đầy đủ.
- Đã tạo fighter.xml/select.xml kết hợp đủ 25 fighter FTOP; giữ toàn bộ roster BVN.
- Đã chuyển `gjl1` thành HitVO tự động; cần tiếp tục kiểm chứng cân bằng sát thương.
- Đã tạo portrait cho đủ FTOP theo kích thước UI BVN từ ảnh gốc.
- Chưa runtime test bản cooldown.
- Chưa quyết định UI cuối cùng.
- Chưa xác định hai nhân vật được trang web gọi là mới trong bản 2.0.

## 11. File quan trọng

- `analysis/current_status.md`: trạng thái ngắn hiện tại.
- `analysis/crossover_roster.json`: roster kết hợp.
- `analysis/bvn_roster.json`: toàn bộ định nghĩa BVN.
- `analysis/port_manifest.json`: trạng thái 25 fighter FTOP.
- `analysis/xfl_inventory.json`: frame label và tên hitbox FTOP.
- `analysis/hitbox_reuse_policy.md`: quy tắc hitbox.
- `analysis/bvn_asset_verification.json`: xác minh checksum BVN.
- `assets/config/gameplay.xml`: config cân bằng gameplay.
- `build_gameplay.sh`: nhúng config và class đã sửa vào SWF.
- `working/anime_crossover_bvn.swf`: SWF BVN có patch cân bằng gameplay.

## 12. Câu hỏi cần giải quyết tiếp

1. Có Adobe Animate để publish XFL AS3 hay phải xây pipeline mã nguồn mở?
2. Giữ toàn bộ bộ chiêu FTOP hay rút gọn theo số action chuẩn BVN?
3. `zl` trong từng nhánh AS2 ảnh hưởng chính xác đến va chạm/phản ứng như thế nào?
4. Có đưa 11 enemy BVN vào màn chọn hay tiếp tục giữ làm NPC?
5. Có cần truy tìm đúng main SWF bản 2.0 để lấy đủ 27 nhân vật không?
6. UI cuối cùng giữ BVN, trộn hai game, hay thiết kế mới sau khi gameplay hoàn tất?

