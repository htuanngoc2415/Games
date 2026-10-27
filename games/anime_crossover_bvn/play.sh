#!/usr/bin/env bash
# Chơi thử game ghép bằng Ruffle trong trình duyệt (không cần Flash Player).
set -euo pipefail
project_dir="$(cd "$(dirname "$0")" && pwd)"
test_dir="$project_dir/../../tools/ruffle_test"
swf="$project_dir/working/anime_crossover_bvn.swf"
if [ ! -f "$test_dir/www/test.swf" ] || [ "$swf" -nt "$test_dir/www/test.swf" ]; then
  echo "Đang tạo bản chạy cho Ruffle..."
  "$test_dir/make_test_swf.sh" "$swf" "$test_dir/www/test.swf"
fi
port=8765
url="http://127.0.0.1:$port/play.html"
if curl -sf -o /dev/null "$url"; then
  # Đã có server (ví dụ một play.sh khác đang chạy): chỉ mở trình duyệt.
  echo "Server đã chạy sẵn, mở $url"
  xdg-open "$url" >/dev/null 2>&1 || true
  exit 0
fi
echo "Mở $url — nhấn Ctrl+C ở đây để dừng."
( sleep 1; xdg-open "http://127.0.0.1:$port/play.html" >/dev/null 2>&1 || true ) &
cd "$test_dir/www" && exec python3 -m http.server "$port" --bind 127.0.0.1
