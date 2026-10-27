# Chạy thử game trên Ruffle (headless)

Dùng để kiểm tra fighter đã port mà không cần Flash Player: Chromium headless của Playwright
chạy Ruffle bản web, gửi phím và chụp màn hình.

Chuẩn bị (một lần):

```bash
python3 -m venv /tmp/ruffle-venv && /tmp/ruffle-venv/bin/pip install playwright
curl -sfL -o /tmp/ruffle.tgz https://registry.npmjs.org/@ruffle-rs/ruffle/-/ruffle-0.8.0-nightly.2026.10.12.tgz
mkdir -p tools/ruffle_test/www/ruffle && tar xzf /tmp/ruffle.tgz -C /tmp && cp /tmp/package/ruffle* tools/ruffle_test/www/ruffle/
```

`run.py` tìm Chromium headless ở `~/.cache/ms-playwright/chromium_headless_shell-*`.

Chạy:

```bash
tools/ruffle_test/make_test_swf.sh games/anime_crossover_bvn/working/anime_crossover_bvn.swf
(cd tools/ruffle_test/www && python3 -m http.server 8765 --bind 127.0.0.1 &)
cd tools/ruffle_test && /tmp/ruffle-venv/bin/python run.py out/t training_natsu_vs_natsu.json
python3 sheet_shots.py out/t_ out/sheet.png
```

Kịch bản là danh sách bước JSON: `["wait",ms]`, `["shot",tên]`, `["key",phím,giữ_ms]`, `["down",phím]`,
`["up",phím]`, `["click",x,y]`. `training_natsu_vs_natsu.json` đi từ menu vào Training, chọn Natsu cho
cả hai bên và vào trận; nối thêm bước để thử chiêu.

`test_patch/` chỉ dành cho bản test: lớp vỏ của bản BVN này gửi request tới `data.vsgod.win` rồi mới
chạy game, và kiểm tra `getObjectsUnderPoint` mà Ruffle chưa hỗ trợ. Bản phát hành giữ nguyên.

Hạn chế đã biết của Ruffle: `stopAllMovieClips()` chưa có (log `Error #1006` khi đạn bị huỷ);
backend wgpu-webgl trên GPU phần mềm thỉnh thoảng sập ở màn chọn nhân vật — chạy lại là được.

## Smoke test toàn bộ roster

`make_roster_smoke.py` tạo bản patch **chỉ dành cho kiểm thử** trong
`games/anime_crossover_bvn/build/roster_smoke_scripts/`. Patch tự nạp lần lượt 25 trận cùng
nhân vật ở hai bên, ép 15 nhãn hành động, đổi hướng và ghi vùng thân. Nó bỏ màn chọn để kiểm
tra nạp asset, không xác minh điều khiển bằng phím hoặc chất lượng chiến đấu đầy đủ.

```bash
python3 tools/ruffle_test/make_roster_smoke.py
java -Xmx6g -Djava.awt.headless=true -Duser.home="$PWD/tools/ffdec-home" \
  -jar /usr/share/java/ffdec/ffdec-cli.jar -onerror abort -importScript \
  games/anime_crossover_bvn/working/anime_crossover_bvn.swf \
  tools/ruffle_test/www/roster_smoke.swf \
  games/anime_crossover_bvn/build/roster_smoke_scripts
# Với server cục bộ 8765 đang chạy và môi trường Python có playwright:
python3 tools/ruffle_test/run_roster_smoke.py
```

Log và ảnh ở `build/roster_runtime_final/`. `ROSTER_ACTIONS_COMPLETED` chỉ xác nhận đã đi hết
chuỗi cưỡng bức hành động, không tự kết luận không có lỗi; phải kiểm tra log lỗi riêng. Bản test
không thay file phát hành `working/`. Backend `wgpu-webgl` được dùng vì Canvas không hỗ trợ
`BitmapData.draw` của BVN.

## Test gameplay toàn roster

```bash
python3 tools/ruffle_test/make_gameplay_test.py            # hoặc: ... ftop_natsu,ftop_luffy
(cd tools/ruffle_test/www && python3 -m http.server 8765 --bind 127.0.0.1 &)
python3 tools/ruffle_test/run_gameplay_test.py OUT_DIR       # ~35 phút cho 25 nhân vật
python3 tools/ruffle_test/analyze_gameplay_test.py OUT_DIR
```

Bản test nạp thẳng vào trận (không qua menu), mỗi nhân vật hai pha: bấm phím thật trong Training rồi đấu AI.
F9 đặt lại vị trí/nội lực, F10 sang pha tiếp. `summary.json` ghi nhãn đã đi qua, sát thương, có về `站立` không.
