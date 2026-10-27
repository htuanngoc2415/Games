#!/usr/bin/env bash
# Tạo bản SWF CHỈ ĐỂ CHƠI/TEST trên Ruffle: bỏ qua lớp vỏ kiểm tra môi trường/kết nối mạng
# và hàm isInTop (Ruffle chưa hỗ trợ getObjectsUnderPoint). Không dùng để phát hành.
# Dùng: make_test_swf.sh INPUT.swf [OUTPUT.swf] [THƯ_MỤC_VÁ_THÊM]
# THƯ_MỤC_VÁ_THÊM (tuỳ chọn) được chồng lên test_patch, ví dụ lan_test_patch (hiệp 10 giây, máu 1%) cho test LAN.
set -euo pipefail
tool_dir="$(cd "$(dirname "$0")" && pwd)"
workspace_dir="$(cd "$tool_dir/../.." && pwd)"
patch_dir="$tool_dir/test_patch"
if [ -n "${3:-}" ]; then
  patch_dir="$(mktemp -d)"
  cp -r "$tool_dir/test_patch/." "$patch_dir/"
  cp -r "$3/." "$patch_dir/"
fi
java -Xmx6g -Djava.awt.headless=true -Duser.home="$workspace_dir/tools/ffdec-home" \
  -jar /usr/share/java/ffdec/ffdec-cli.jar -onerror abort -importScript \
  "$1" "${2:-$tool_dir/www/test.swf}" "$patch_dir"
[ -n "${3:-}" ] && rm -rf "$patch_dir"
exit 0
