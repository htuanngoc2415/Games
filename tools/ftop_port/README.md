# Port fighter Fairy Tail vs One Piece sang BVN

Chuyển một fighter FTOP (AS2/AVM1) thành fighter AS3 theo chuẩn BVN mà không cần Adobe Animate.
Hình, timeline, âm thanh trên timeline và hitbox được giữ nguyên trong SWF; chỉ bytecode AS2 bị bỏ
và thay bằng class AS3 sinh tự động.

```bash
tools/ftop_port/port_fighter.sh games/anime_crossover_bvn/ports/ftop_natsu.json
bash games/anime_crossover_bvn/build_gameplay.sh   # nhúng fighter vào game
```

## Các bước

| File | Việc |
|---|---|
| `analyze_timeline.py` | Đọc dump JPEXS + script AS2, liệt kê nhãn, frame script, clip action và khoảng frame của từng clip |
| `gen_fighter.py` | Dịch sang lệnh BVN, sinh `main_mc` (bảng `gjl1` → `defineAction`), class timeline, class âm thanh/cut-in, `plan.json` |
| `SwfAs2ToAs3.java` | Bỏ DoAction/DoInitAction/ExportAssets/clip action, sửa nhãn và tên instance, bọc timeline gốc thành `main_mc`, nhúng ảnh, biên dịch AS3 bằng thư viện JPEXS, ghi SymbolClass |
| `register.py` | Khi build game: chép SWF, ảnh mặt, nhạc và thêm nhân vật vào `fighter.xml`/`select.xml` |

Kết quả trung gian nằm ở `games/anime_crossover_bvn/build/port/<id>/`; `as3/report.txt` liệt kê lệnh AS2
chưa dịch được.

## Quy tắc dịch chính

- Clip action `if(nornalhit()) gotoAndPlay("砍2")` → `setAttack("砍2")` trong khoảng frame clip tồn tại,
  `endAct()` khi clip kết thúc. Tương tự `skill1/2` → `setSkill1/2`, `magichit1/2/3` → `setZhao1/2/3`,
  `bisha/bishaUP/bishaSuper` → `setBisha/…`, `airMagichit` → `setSkillAIR`, `jump` → `setJump`.
- `moveX/moveY` mỗi frame → `move(vx, vy)` lúc clip bắt đầu; hết clip thì hãm trục X, hoặc `stopMove()`
  và bật lại trọng lực nếu có di chuyển dọc. Đơn vị giữ nguyên vì BVN cũng tính pixel/frame 30 FPS.
- `gjl1.<id>{pw,zl,up,x,tm,dz}` → `defineAction(id, {power, hitType, hitx, hity: -up, hurtTime, hurtType})`;
  `zl > 10` là phá thủ, `dz == "击飞"` là đánh bay.
- `_root.bsd/cbsd` + `showFace` → `fx.bisha(false|true, tên cut-in)`, `bsw/cbsw` → `fx.endBisha()`.
- Các đoạn do engine BVN điều khiển (nhảy, đỡ, bị đánh, bị đánh bay) bỏ script gốc; chỉ thêm nhãn bí danh
  BVN cần (`起跳`, `跳中`, `击飞_落/弹/倒/起`, `防御恢复`) ở frame chọn bằng mắt.

## Cấu hình mỗi nhân vật (`ports/<id>.json`)

Phần phải chọn tay khi port nhân vật mới: frame cho các nhãn bí danh, `engineSections`, đạn
(`bullets`: frame/depth đặt đạn, nhãn `loop/hit/remove`, vùng va chạm đổi tên thành `main`),
sprite hiệu ứng cần dừng ở frame cuối, ảnh mặt/cut-in, ô trên màn chọn. Xem `ftop_natsu.json` làm mẫu
và `tools/ruffle_test/` để chạy thử.

## Chuyển toàn bộ roster

24 config ngoài Natsu đã được tạo trong `ports/`. Các bước có thể tái tạo:

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

`prepare_roster.py` không ghi đè config đã có. `refine_projectiles.py` và `refine_effects.py`
**tái tạo** các trường tự suy ra; nếu sửa tay đạn/child frame script thì không chạy lại hai bước
này, hoặc đưa ngoại lệ vào công cụ trước. Natsu được giữ nguyên khi chạy batch.

- `frame_translation.py` dịch các nhánh có điều kiện thành một khối AS3, giữ counter trên từng
  ActionMC để hai bản sao nhân vật không dùng chung trạng thái.
- Mỗi placement đạn có ID riêng, kể cả hai viên cùng frame. Giữ vận tốc ngang/dọc nguồn.
- `nestedFrameScripts` giữ stop/loop và đổi tên vùng đánh ở timeline con. Bytecode điều khiển
  input/va chạm của engine FTOP và loader host cũ được bỏ vì BVN thay thế phần này.
- `extraRenames` dùng cho probe `hit_check` của Robin; không biến probe thành đòn gây damage.
- `register.moreOf` gắn nhân vật vào nhóm chọn của một anchor. UI BVN chỉ có tám vị trí phụ;
  bộ config hiện dùng năm anchor, không vượt giới hạn này.
- Các âm thanh `voice_hurt*`/`voice_die` dùng ID riêng của source tương ứng; không dùng ID Natsu
  cho các nhân vật khác. Portrait/cut-in trích từ sprite nguồn 1306/1386/1570.

`verify_roster.py` đọc trực tiếp binary SWF: xác nhận AVM2, không còn DoAction/DoInitAction/clip
 action AVM1, đủ nhãn, bảo toàn tag art/audio, đối chiếu SWF trong ZIP, roster BVN và đường chọn.
Báo cáo không đồng nghĩa với nghiệm thu gameplay. Xem
`games/anime_crossover_bvn/analysis/roster_port_status_vi.md`.

### Hitbox thay đổi theo timeline con

Các Effect class có getter/setter `name` riêng: giữ tên logic mà engine đọc, không gọi setter
native của đối tượng đặt trên timeline (AS3 cấm việc này, Error #2078). `ftopStopped` giữ stop
của source khi BVN render timeline con bằng `nextFrame()`.

Adapter `extracted/scripts/net/play5d/game/bvn/fighter/FighterMC.as` được build_gameplay.sh
nhúng cùng các patch cân bằng. Chỉ ActionMC có `ftopDynamicHitAreas` mới tính lại hitbox thay
vì dùng cache theo frame chính; nhờ vậy tên/vị trí hitbox trong timeline con không bị giữ sai
khi đánh lại chiêu. `ftopManagedEffect` cho phép timeline hitbox động tiến frame và tôn trọng
`ftopStopped`. Fighter BVN gốc và bản Natsu đã có không bật các cờ này.

Gói `dist/ftop_bvn_as3_roster_preview.zip` kèm adapter trong `patches/scripts/`. Khi tích hợp
vào bản BVN khác, phải import adapter và nhúng assets, không chỉ chép 25 fighter SWF.

## Bố cục/random hiện tại

`selection_roster.py` áp dụng `assets/config/crossover_select.json`: lưới 12×7, 25 FTOP trực tiếp và 5 random. Quy tắc nhóm `register.moreOf` ở phần trên thuộc bố cục cũ, không còn dùng khi build. Random dùng `roster_group`, tách khỏi comic_type chiến đấu. Build cũng import `FighterModel.as` và `GameLogic.as`. Kiểm tra bằng `test_selection.py` và `verify_selection_runtime.py`; gói riêng chứa cả các adapter này.
