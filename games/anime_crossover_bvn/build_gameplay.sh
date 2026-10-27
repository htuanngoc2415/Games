#!/usr/bin/env bash
# Nhúng assets/config/gameplay.xml, các fighter đã port (ports/*.json) và các class AS3 đã sửa
# vào working/anime_crossover_bvn.swf.
set -euo pipefail

project_dir="$(cd "$(dirname "$0")" && pwd)"
workspace_dir="$(cd "$project_dir/../.." && pwd)"
ffdec_jar=/usr/share/java/ffdec/ffdec-cli.jar
ffdec_home="$workspace_dir/tools/ffdec-home"
source_zip="$project_dir/original/bvn_binary/7_assets_zip.bin"
zip_root="$project_dir/build/ziproot"
import_dir="$project_dir/build/import_scripts"
patched_zip="$project_dir/build/assets_with_gameplay.zip"
asset_swf="$project_dir/build/with_gameplay_assets.swf"
output_swf="$project_dir/working/anime_crossover_bvn.swf"

patched_classes=(
  net/play5d/game/bvn/state/SettingState.as
  net/play5d/game/bvn/state/HowToPlayState.as
  net/play5d/game/bvn/ui/Text.as
  net/play5d/game/bvn/ui/SetBtn.as
  net/play5d/game/bvn/interfaces/GameInterface.as
  net/play5d/game/bvn/state/CongratulateState.as
  net/play5d/game/bvn/state/CreditsState.as
  net/play5d/game/bvn/state/GameLoadingState.as
  net/play5d/game/bvn/state/LoadingMosouState.as
  net/play5d/game/bvn/state/LoadingState.as
  net/play5d/game/bvn/state/SelectFighterStage.as
  net/play5d/game/bvn/state/WinnerState.as
  net/play5d/game/bvn/state/WorldMapState.as
  net/play5d/game/bvn/ui/ContinueBtn.as
  net/play5d/game/bvn/ui/MenuBtn.as
  net/play5d/game/bvn/ui/MenuBtnGroup.as
  net/play5d/game/bvn/ui/MosouPauseDialog.as
  net/play5d/game/bvn/ui/MoveListSp.as
  net/play5d/game/bvn/ui/PauseDialog.as
  net/play5d/game/bvn/ui/SetBtnDialog.as
  net/play5d/game/bvn/ui/SetBtnGroup.as
  net/play5d/game/bvn/ui/SetBtnLine.as
  net/play5d/game/bvn/ui/SetCtrlBtnUI.as
  net/play5d/game/bvn/ui/UIUtils.as
  net/play5d/game/bvn/ui/mosou/CoinUI.as
  net/play5d/game/bvn/state/MenuState.as
  net/play5d/game/bvn/data/GameMode.as
  net/play5d/game/bvn/ctrl/GameRender.as
  net/play5d/game/bvn/MainGame.as
  net/play5d/game/bvn/ctrl/game_ctrls/GameCtrl.as
  net/play5d/game/bvn/fighter/ctrler/ai/FighterAILogicBase.as
  net/play5d/game/bvn/ui/fight/FightUI.as
  net/play5d/game/bvn/data/TeamMap.as
  net/play5d/game/bvn/data/GameRunDataVO.as
  net/play5d/game/bvn/state/GameState.as
  net/play5d/game/bvn/ctrl/game_ctrls/GameStartCtrl.as
  net/play5d/game/bvn/ctrl/game_ctrls/FighterEventCtrl.as

  net/play5d/game/bvn/data/FighterModel.as
  net/play5d/game/bvn/ctrl/GameLogic.as
  net/play5d/game/bvn/data/GameData.as
  net/play5d/game/bvn/fighter/ctrler/FighterActionLogic.as
  net/play5d/game/bvn/fighter/ctrler/FighterMcCtrler.as
  net/play5d/game/bvn/fighter/FighterMC.as
  net/play5d/game/bvn/fighter/models/HitVO.as
  net/play5d/game/bvn/ctrl/game_ctrls/GameMainLogicCtrler.as
)

xmllint --noout "$project_dir/assets/config/gameplay.xml"

rm -rf "$zip_root" "$import_dir"
mkdir -p "$zip_root/assets/config"
cp "$project_dir/assets/config/gameplay.xml" "$zip_root/assets/config/gameplay.xml"
python3 "$workspace_dir/tools/ftop_port/register.py" "$project_dir" "$zip_root"
mkdir -p "$zip_root/assets/backgrounds"
cp "$project_dir/assets/backgrounds/crossover_title.jpg" "$zip_root/assets/backgrounds/"
for class in "${patched_classes[@]}"; do
  mkdir -p "$import_dir/$(dirname "$class")"
  cp "$project_dir/extracted/scripts/$class" "$import_dir/$class"
done

cp "$source_zip" "$patched_zip"
(
  cd "$zip_root"
  zip -0 -u -r "$patched_zip" assets
)

java -Xmx4g -Djava.awt.headless=true -Duser.home="$ffdec_home" \
  -jar "$ffdec_jar" -replace \
  "$project_dir/original/bleach_vs_naruto_3.5_base.swf" \
  "$asset_swf" 7 "$patched_zip"

java -Djava.awt.headless=true -Duser.home="$ffdec_home" \
  -jar "$ffdec_jar" -replace \
  "$project_dir/original/bvn_binary/15_loading_swf_ByteArray.bin" \
  "$project_dir/build/crossover_loading.swf" 105 "$project_dir/assets/backgrounds/crossover_loading.jpg"
java -Xmx4g -Djava.awt.headless=true -Duser.home="$ffdec_home" \
  -jar "$ffdec_jar" -replace "$asset_swf" "$project_dir/build/with_crossover_loading.swf" \
  15 "$project_dir/build/crossover_loading.swf"

java -Xmx6g -Djava.awt.headless=true -Duser.home="$ffdec_home" \
  -jar "$ffdec_jar" -onerror abort -importScript \
  "$project_dir/build/with_crossover_loading.swf" "$output_swf" "$import_dir"

javac -cp "$ffdec_jar" -d "$workspace_dir/tools/ftop_port/build" "$workspace_dir/tools/ftop_port/EmbedVietnameseFont.java"
java -Djava.awt.headless=true -Duser.home="$ffdec_home" -cp "$ffdec_jar:$workspace_dir/tools/ftop_port/build" EmbedVietnameseFont \
  "$output_swf" "$project_dir/build/with_vietnamese_font.swf" "$project_dir/assets/fonts/DejaVuSans.ttf"
cp "$project_dir/build/with_vietnamese_font.swf" "$output_swf"

# Các class AS3 mới (chơi LAN). importScript không thêm được class mới nên dùng công cụ riêng;
# thứ tự biên dịch: class nền tảng trước, màn lobby sau cùng.
net_dir="$project_dir/extracted/scripts/net/play5d/game/bvn/net"
javac -cp "$ffdec_jar" -d "$workspace_dir/tools/ftop_port/build" "$workspace_dir/tools/ftop_port/AddAs3Classes.java"
java -Xmx4g -Djava.awt.headless=true -Duser.home="$ffdec_home" -cp "$ffdec_jar:$workspace_dir/tools/ftop_port/build" AddAs3Classes \
  "$output_swf" "$project_dir/build/with_net.swf" CrossoverNet \
  "$net_dir/GameRand.as" "$net_dir/NetInput.as" "$net_dir/NetClient.as" "$net_dir/NetSession.as" "$net_dir/LanLobbyState.as"
cp "$project_dir/build/with_net.swf" "$output_swf"
# Trình biên dịch AS3 của JPEXS đôi khi sinh hàm sai; kiểm tra độ sâu ngăn xếp từng hàm, hỏng thì dừng build.
javac -cp "$ffdec_jar" -d "$workspace_dir/tools/ftop_port/build" "$workspace_dir/tools/ftop_port/StackCheck.java"
stack_report="$(java -Xmx4g -Djava.awt.headless=true -cp "$ffdec_jar:$workspace_dir/tools/ftop_port/build" StackCheck "$output_swf" CrossoverNet)"
echo "$stack_report" | tail -1
if ! echo "$stack_report" | grep -q "bad=0"; then echo "$stack_report" >&2; echo "LỖI: có hàm mạng biên dịch sai" >&2; exit 1; fi
sha256sum "$output_swf"
