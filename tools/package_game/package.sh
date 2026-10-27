#!/usr/bin/env bash
# Đóng gói game thành thư mục chạy độc lập cho Windows (AnimeCrossover.exe) và Linux (AnimeCrossover):
#   AnimeCrossover.exe / AnimeCrossover   launcher (tools/package_game/launcher.c)
#   engine/ruffle.exe, engine/ruffle      Ruffle desktop (tải từ GitHub, lưu cache ở tools/package_game/cache)
#   game/game.swf                         bản game đã vá cho Ruffle (tools/ruffle_test/make_test_swf.sh)
#   saves/                                dữ liệu lưu (cài đặt, hồi chiêu), sinh ra khi chơi
# Cần: java + JPEXS (như build_gameplay.sh), python3 với gói ziglang (pip install ziglang), curl, zip.
# Dùng: package.sh [ngày nightly Ruffle, mặc định 2026-10-12 đã thử với game]
set -euo pipefail

tool_dir="$(cd "$(dirname "$0")" && pwd)"
workspace_dir="$(cd "$tool_dir/../.." && pwd)"
project_dir="$workspace_dir/games/anime_crossover_bvn"
nightly="${1:-2026-10-12}"
tag="nightly-$nightly"
stamp="${nightly//-/_}"
cache="$tool_dir/cache"
out="$tool_dir/out/AnimeCrossover"
zig=(python3 -m ziglang cc)

mkdir -p "$cache"
for os in linux-x86_64.tar.gz windows-x86_64.zip; do
  f="$cache/ruffle-$stamp-$os"
  [ -s "$f" ] || curl -fsSL -o "$f" "https://github.com/ruffle-rs/ruffle/releases/download/$tag/ruffle-nightly-$stamp-$os"
done

rm -rf "$tool_dir/out"
mkdir -p "$out/engine" "$out/game" "$tool_dir/build/ruffle-linux" "$tool_dir/build/ruffle-win"
tar xzf "$cache/ruffle-$stamp-linux-x86_64.tar.gz" -C "$tool_dir/build/ruffle-linux"
unzip -qo "$cache/ruffle-$stamp-windows-x86_64.zip" -d "$tool_dir/build/ruffle-win"
cp "$tool_dir/build/ruffle-linux/ruffle" "$out/engine/ruffle"
cp "$tool_dir/build/ruffle-win/ruffle.exe" "$out/engine/ruffle.exe"
cp "$tool_dir/build/ruffle-linux/LICENSE.md" "$out/engine/RUFFLE-LICENSE.md"
chmod +x "$out/engine/ruffle"

"$workspace_dir/tools/ruffle_test/make_test_swf.sh" "$project_dir/working/anime_crossover_bvn.swf" "$out/game/game.swf"

"${zig[@]}" -O2 -s -target x86_64-windows-gnu -Wl,--subsystem,windows "$tool_dir/launcher.c" -o "$out/AnimeCrossover.exe"
"${zig[@]}" -O2 -s -target x86_64-linux-gnu.2.17 "$tool_dir/launcher.c" -o "$out/AnimeCrossover"
chmod +x "$out/AnimeCrossover"
cp "$tool_dir/HUONG_DAN.txt" "$out/HUONG_DAN.txt"

(cd "$tool_dir/out" && zip -qr -9 AnimeCrossover.zip AnimeCrossover)
ls -la "$tool_dir/out"
