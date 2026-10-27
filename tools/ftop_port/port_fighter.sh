#!/usr/bin/env bash
# Port một fighter FTOP (AS2) sang SWF AS3 chuẩn BVN theo ports/<id>.json.
# Dùng: port_fighter.sh games/anime_crossover_bvn/ports/ftop_natsu.json
set -euo pipefail

tool_dir="$(cd "$(dirname "$0")" && pwd)"
workspace_dir="$(cd "$tool_dir/../.." && pwd)"
config="$(realpath "$1")"
project_dir="$(cd "$(dirname "$config")/.." && pwd)"
fighter_id="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["id"])' "$config")"
source_swf="$project_dir/$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["source"])' "$config")"
action_sprite="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["actionSprite"])' "$config")"
work="$project_dir/build/port/$fighter_id"
ffdec_cp="$(ls /usr/share/java/ffdec/lib/*.jar | tr '\n' ':')"
ffdec=(java -Xmx4g -Djava.awt.headless=true -Duser.home="$workspace_dir/tools/ffdec-home" -jar /usr/share/java/ffdec/ffdec-cli.jar)

rm -rf "$work"
mkdir -p "$work" "$tool_dir/build"
"${ffdec[@]}" -dumpSWF "$source_swf" > "$work/dump.txt"
"${ffdec[@]}" -export script "$work/as2" "$source_swf" > "$work/export.log" 2>&1
python3 "$tool_dir/analyze_timeline.py" "$work/dump.txt" "$work/as2/scripts" "$action_sprite" "$work/timeline.json"
python3 "$tool_dir/gen_fighter.py" "$config" "$work/timeline.json" "$work/as2/scripts/frame_1/DoAction.as" \
  "$work/dump.txt" "$project_dir" "$work/as3"
javac -d "$tool_dir/build" -cp "$ffdec_cp" "$tool_dir/SwfAs2ToAs3.java"
mkdir -p "$project_dir/assets/fighter/ported"
java -Xmx4g -Djava.awt.headless=true -Duser.home="$workspace_dir/tools/ffdec-home" \
  -cp "$ffdec_cp:$tool_dir/build" SwfAs2ToAs3 "$work/as3/plan.json"
cat "$work/as3/report.txt"
