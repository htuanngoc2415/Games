# Anime Crossover BVN

Engine nền: Bleach vs Naruto 3.5 (AS3/AVM2). Nguồn nhân vật bổ sung: Fairy Tail vs One Piece (AS2/AVM1).

Tài liệu tổng hợp để chuyển ngữ cảnh cho ChatGPT hoặc người phát triển khác: `analysis/PROJECT_HANDOFF_VI.md`.

## Trạng thái hiện tại

- Bản làm việc độc lập: `working/anime_crossover_bvn.swf`.
- Hệ thống cân bằng gameplay đã được chèn vào SWF: cooldown từng chiêu, thời gian choáng (`stunRate`), tốc độ ra đòn (`attackSpeed`), sát thương (`damageRate`), tốc độ đi (`moveSpeed`); chỉnh chung hoặc riêng từng nhân vật.
- Config: `assets/config/gameplay.xml`; hướng dẫn từng thuộc tính nằm ngay đầu file. Cooldown tính bằng game tick, 60 tick/giây.
- 25 SWF nhân vật nguồn và 12 MP3 đã được sao chép vào `assets/`.
- Toàn bộ 102 SWF fighter/enemy/trợ chiến BVN và face liên quan được mirror dưới `assets/fighter/bvn/` và `assets/face/bvn/`; runtime tiếp tục dùng bản nguyên gốc trong archive BVN.
- `analysis/port_manifest.json` theo dõi trạng thái chuyển đổi của từng nhân vật.
- 25 timeline đã được bảo toàn dưới dạng XFL trong `build/source_xfl/`; nhãn và vùng đánh nguồn được lập chỉ mục ở `analysis/xfl_inventory.json`.
- Natsu (`ftop_natsu`) đã chơi được: chuyển tự động từ SWF AS2 sang AS3 bằng `tools/ftop_port`, nằm ở ô trống hàng 5 của màn chọn. Đã chạy thử trên Ruffle (đi, nhảy, combo, chiêu, cầu lửa, 3 tất sát kèm cut-in, bị đánh bay, AI, thắng/thua); chưa thử trên Flash Player thật.
- Đã chuyển thêm 24 nhân vật sang AS3, nhúng đủ 25 FTOP vào game và năm nhóm chọn. Chi tiết kiểm chứng, cách chạy và giới hạn: [roster_port_status_vi.md](analysis/roster_port_status_vi.md). 24 bản mới vẫn cần nghiệm thu gameplay đầy đủ trước khi đánh dấu `playable`.

## Cấu trúc

```text
original/       SWF BVN nền, bất biến
working/        SWF chỉnh sửa hiện tại
assets/         config mới và tài nguyên FTOP nguồn
extracted/      mã BVN dịch ngược dùng để patch
patches/        bản vá và tài liệu tích hợp
analysis/       manifest, kiểm chứng và báo cáo
build/          file trung gian có thể tái tạo
dist/           dành cho bản phát hành đã kiểm thử
```

## Build sau khi sửa config

Chạy `bash games/anime_crossover_bvn/build_gameplay.sh` (khoảng 10 giây). Script kiểm tra XML, thay binary ZIP tài nguyên ID 7, rồi dùng JPEXS import các class AS3 đã sửa từ `extracted/scripts/` vào `working/anime_crossover_bvn.swf`. Không ghi đè SWF gốc.

Script cũng chép các fighter đã port (`ports/*.json` có SWF đầu ra) cùng ảnh mặt, nhạc và thêm chúng vào `fighter.xml`/`select.xml` sinh từ `assets/config/bvn_original/`.

Class đã sửa: `FighterMC` (hitbox/timeline con động của FTOP), `GameData` (đọc config), `FighterActionLogic` (cooldown), `FighterMcCtrler` (stun, tốc độ đi, đếm cooldown), `HitVO` (sát thương), `GameMainLogicCtrler` (tốc độ ra đòn).

- Cooldown chỉ bắt đầu khi controller xác nhận chiêu đã thực hiện thành công. Mỗi đấu sĩ giữ bộ đếm riêng, nên hai đấu sĩ cùng nhân vật không dùng chung cooldown.
- `stunRate` chỉ áp dụng cho choáng khi trúng đòn thường (`hurtType` 0); đòn đánh bay/ngã giữ nguyên. Không đổi thời gian đỡ đòn.
- `attackSpeed` chỉ áp dụng khi đang đánh/dùng chiêu/tất sát và lúc hồi đòn. Tối đa 2 vì animation gốc chạy 30 frame/giây trên logic 60 tick/giây; ở 2x mỗi tick chạy đúng một frame nên không bỏ qua frame script hay hitbox nào. Đạn và vật triệu hồi vẫn chạy tốc độ thường.
- `damageRate` tính theo chủ của đòn, gồm cả đạn và `FighterAttacker`; trợ chiến không bị ảnh hưởng.

## Port nhân vật Fairy Tail/One Piece

```bash
tools/ftop_port/port_fighter.sh games/anime_crossover_bvn/ports/ftop_natsu.json
bash games/anime_crossover_bvn/build_gameplay.sh
```

Chạy thử không cần Flash Player: `tools/ruffle_test/README.md`.

## Điều kiện để chuyển một nhân vật

Một nhân vật chỉ được đổi thành `playable` sau khi có timeline AVM2 tương thích BVN, đủ action bắt buộc, vùng `body`/`hit`/`hit_check`, HitVO, projectile, âm thanh, portrait và kiểm tra cả hai hướng. Chép SWF AS2 vào `fighter.xml` không đáp ứng các điều kiện này.

Quy tắc giữ/chuyển hitbox nằm trong `analysis/hitbox_reuse_policy.md`.

## Màn chọn và random mới

Lưới 12×7; 25 FTOP hiện trực tiếp. Có Random Bleach (31), Naruto (34), Fairy Tail (10), One Piece (15), Random chung (90), tính cả biến thể BVN và loại NPC. Xem [chi tiết bố cục, ảnh và kiểm thử](analysis/selection_random_status_vi.md). Bố cục nằm trong `assets/config/crossover_select.json`.

### Giao diện tiếng Việt

Menu chính dùng nền crossover mới và còn năm mục: Đấu đơn, Phiêu lưu, Chơi LAN, Config, Cài đặt. Đã bỏ More Games, Credits, Rank và Training khỏi menu, bổ sung font tiếng Việt nhúng trong SWF. Hướng dẫn, cài đặt phím, thông báo tải và các nhãn giao diện đã được Việt hóa. Xem `analysis/ui_vietnamese_status_vi.md` về nguồn ảnh, prompt, build và kiểm tra.

## Config trong game (hồi chiêu, sát thương, tốc độ)

Menu chính → **Config**: chọn "Tất cả nhân vật" hoặc từng nhân vật, chỉnh **sát thương gây ra** (bước 10%, 0–1000%, lưu dưới khoá `@damage`, thay `damageRate` của XML) và **tốc độ di chuyển** (bước 10%, 0–500%, khoá `@move`, thay `moveSpeed` của XML; áp dụng cho đi bộ, di chuyển trên không và lướt) và 10 loại chiêu theo bước 0,25 giây
(W/S chọn, J vào bảng chiêu, A/D giảm/tăng, U về mặc định; có thể bấm chuột vào "-"/"+").
Giá trị lưu bằng SharedObject `crossover_cooldowns` (phạm vi "/") và được ưu tiên hơn `gameplay.xml`:
riêng nhân vật (game) > riêng nhân vật (XML) > tất cả (game) > mặc định (XML). Code: `state/MenuState.as`,
`data/GameData.as` (getSkillCooldownFrames / setCooldownOverride). Ô hồi chiêu trong trận (`ui/fight/FightUI.as`)
đọc cùng nguồn.

## Chơi LAN (1 vs 1, 2 vs 2, tự do 4 người)

Menu chính -> **Chơi LAN**. Thiết kế và kết quả khảo sát: `analysis/multiplayer_research_vi.md`.

- Ruffle không tạo được máy chủ TCP, nên launcher (`tools/package_game/launcher.c` + `relay.c`) chạy kèm một bộ
  chuyển tiếp: cổng cục bộ 127.0.0.1:47800 luôn mở; cổng LAN 0.0.0.0:47801 chỉ mở khi bấm "Tạo phòng".
  Cả chủ phòng lẫn người vào đều là client của relay.
- Trận chạy **lockstep**: mỗi khung hình chỉ tính khi đã có phím của cả hai bên (trễ đầu vào 4 khung, khoảng 67 ms),
  nên chỉ gửi phím bấm, không gửi trạng thái. Mỗi 60 khung hai máy trao đổi mã băm trạng thái; khác nhau thì báo
  "Mất đồng bộ". Hạt giống ngẫu nhiên, cấu hình hồi chiêu/sát thương/tốc độ và máu của chủ phòng được gửi cho người vào.
- Mã: `extracted/scripts/net/play5d/game/bvn/net/` (`NetSession`, `NetClient`, `NetInput`, `GameRand`, `LanLobbyState`).
  Các class cũ gọi sang phần mạng gián tiếp qua `GameMode.net`; cổng vào vòng lặp là `GameRender` (chặn khung hình).
- Phải giữ logic chiến đấu **xác định**: không dùng `getTimer`/`setTimeout`/tween/`Math.random` trong luồng mô phỏng
  (dùng `GameMode.random()`). Hai chỗ đã sửa: cảnh KO trong `FightUI` (đếm khung thay vì đồng hồ thật) và
  `FighterAILogicBase`. Thêm đòn/hiệu ứng ảnh hưởng vị trí hay máu mà dùng đồng hồ thật sẽ gây lệch.
- Kiểu trận (`GameMode.layout`: 0 = 1 vs 1, 1 = 2 vs 2, 2 = tự do) do chủ phòng chọn ở phòng chờ. Với layout > 0 mỗi máy
  điều khiển hai ô: `INPUT` là u32 (16 bit thấp = người 1, 16 bit cao = người 2); chủ phòng = ô 1, 2, người vào = ô 3, 4.
  Màn chọn dùng lại màn "Hai người chơi" (`SelectFighterStage.twoLocal`). 2 vs 2: hai đội, thắng trước 2 hiệp; tự do: bốn đội, 1 hiệp.
  Lõi bốn đấu sĩ (`GameRunDataVO`, `TeamMap`, `GameCtrl`, `FightUI`...) kiểm thử một máy bằng `tools/ruffle_test/mp_test.py`.
- `GameStageLoadCtrl.unique` đã sửa: bản gốc đẩy giá trị rỗng vào danh sách tải khi có nhân vật trùng nhau
  (trận 4 người hầu như luôn có trùng).
- Kiểm thử không cần hai máy: `tools/ruffle_test/lan_test.py` (relay + cầu nối WebSocket + hai Chromium ngầm).

### Lưu ý khi viết AS3 mới (trình biên dịch JPEXS)
- `importScript` chỉ thay class đã có; class mới thêm bằng `tools/ftop_port/AddAs3Classes.java` (xem `build_gameplay.sh`).
- Không khởi tạo thuộc tính bằng `new` ở cấp class (`private var _x:Foo = new Foo()`): mã sinh ra thiếu lệnh nạp class.
  Khởi tạo trong hàm tạo. `build_gameplay.sh` chạy `StackCheck` để chặn lỗi kiểu này.
- `new Vector.<T>([a])` tạo vector rỗng; dùng `push`.
- Class có sẵn không được tham chiếu class mới lúc biên dịch (class mới thêm sau): dùng `getDefinitionByName` (xem `GameMode.net`).
