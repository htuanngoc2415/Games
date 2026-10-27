#!/usr/bin/env bash
# Tạo bản SWF CHỈ ĐỂ TEST trên Ruffle: bỏ qua lớp vỏ kiểm tra môi trường/kết nối mạng
# và hàm isInTop (Ruffle chưa hỗ trợ getObjectsUnderPoint). Không dùng để phát hành.
# Dùng: make_test_swf.sh INPUT.swf [OUTPUT.swf]
set -euo pipefail
tool_dir="$(cd "$(dirname "$0")" && pwd)"
workspace_dir="$(cd "$tool_dir/../.." && pwd)"
java -Xmx6g -Djava.awt.headless=true -Duser.home="$workspace_dir/tools/ffdec-home" \
  -jar /usr/share/java/ffdec/ffdec-cli.jar -onerror abort -importScript \
  "$1" "${2:-$tool_dir/www/test.swf}" "$tool_dir/test_patch"
