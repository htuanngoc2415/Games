#!/usr/bin/env python3
"""Tạo bản SWF CHỈ ĐỂ TEST gameplay cho toàn bộ fighter FTOP trong một phiên Ruffle.

Mỗi nhân vật chạy hai pha: "input" (Training, P2 đứng yên, Playwright bấm phím thật) và
"ai" (đấu với máy, P2 do AI điều khiển). F9 đặt lại vị trí và nạp đầy nội lực, F10 sang pha
tiếp theo. Mỗi 100 ms trace "GT ..." gồm nhãn frame, actionState và HP của hai bên.
Không import các class này vào bản phát hành.
"""
import json
import shutil
import subprocess
import sys
from pathlib import Path

root = Path(__file__).resolve().parents[2]
project = root / 'games/anime_crossover_bvn'
out = project / 'build/gameplay_test_scripts'
shutil.rmtree(out, ignore_errors=True)
shutil.copytree(root / 'tools/ruffle_test/test_patch', out)
fighters = sys.argv[1].split(',') if len(sys.argv) > 1 else [f.stem for f in sorted((project / 'ports').glob('*.json'))]

source = project / 'extracted/scripts/net/play5d/game/bvn/MainGame.as'
s = source.read_text()
s = s.replace('   import flash.display.Sprite;', '   import flash.display.Sprite;\n   import flash.events.KeyboardEvent;\n'
              '   import flash.utils.setTimeout;\n   import flash.utils.setInterval;\n   import flash.utils.clearInterval;\n'
              '   import net.play5d.game.bvn.data.SelectVO;', 1)
s = s.replace('      public function goLogo() : void\n      {', '''      private var gtRoster:Array = %s;
      private var gtIndex:int = 0;
      private var gtPhase:String = "input";
      private var gtTimer:uint = 0;
      private var gtLoaded:Boolean = false;
      private function gtLoad():void {
         if(gtTimer) { clearInterval(gtTimer); gtTimer = 0; }
         if(gtIndex >= gtRoster.length) { trace("GT_DONE"); return; }
         var id:String = gtRoster[gtIndex];
         GameMode.currentMode = gtPhase == "input" ? 40 : 22;
         GameData.I.p1Select = new SelectVO();
         GameData.I.p2Select = new SelectVO();
         GameData.I.p1Select.fighter1 = id;
         GameData.I.p2Select.fighter1 = id;
         GameData.I.p1Select.fuzhu = "kon";
         GameData.I.p2Select.fuzhu = "kon";
         GameData.I.selectMap = "xianshi";
         gtLoaded = false;
         trace("GT_LOAD " + gtPhase + " " + id);
         loadGame();
      }
      private function gtFighters():Array {
         try {
            return [GameCtrl.I.gameRunData.p1FighterGroup.currentFighter, GameCtrl.I.gameRunData.p2FighterGroup.currentFighter];
         } catch(e:Error) {}
         return [null, null];
      }
      private function gtLabel(f:*):String {
         try { return f.getCtrler().getMcCtrl().getFighterMc().currentFrameName + "/" + f.actionState; } catch(e:Error) {}
         return "?";
      }
      private function gtReady():void {
         var f:Array = gtFighters();
         if(!f[0] || !f[1]) { trace("GT_FAIL missing fighter " + gtRoster[gtIndex]); return; }
         gtReset();
         gtLoaded = true;
         trace("GT_READY " + gtPhase + " " + gtRoster[gtIndex]);
         gtTimer = setInterval(gtTick, 100);
      }
      private function gtTick():void {
         var f:Array = gtFighters();
         if(!f[0] || !f[1]) { return; }
         trace("GT " + gtRoster[gtIndex] + " " + gtPhase + " a=" + gtLabel(f[0]) + " b=" + gtLabel(f[1]) +
               " ahp=" + int(f[0].hp) + " bhp=" + int(f[1].hp) + " ax=" + int(f[0].x) + " bx=" + int(f[1].x) + " ay=" + int(f[0].y));
      }
      private function gtReset():void {
         var f:Array = gtFighters();
         if(!f[0] || !f[1]) { return; }
         try {
            f[0].getCtrler().getMcCtrl().idle();
            f[1].getCtrler().getMcCtrl().idle();
         } catch(e:Error) { trace("GT_RESET_ERR " + e); }
         f[0].x = 300; f[1].x = 370;
         f[0].direct = 1; f[1].direct = -1;
         f[0].qi = f[0].qiMax;
         f[0].hp = f[0].hpMax; f[1].hp = f[1].hpMax;
      }
      private function gtKey(e:KeyboardEvent):void {
         if(e.keyCode == 120 && gtLoaded) { gtReset(); trace("GT_RESET " + gtRoster[gtIndex]); }
         if(e.keyCode == 121 && gtLoaded) {
            gtLoaded = false;
            if(gtPhase == "input") { gtPhase = "ai"; } else { gtPhase = "input"; gtIndex++; }
            gtLoad();
         }
      }
      public function goLogo() : void
      {
         _stage.addEventListener("keyDown", gtKey);
         gtLoad();
         return;
''' % json.dumps(fighters))
s = s.replace('         GameCtrl.I.startGame();', '         GameCtrl.I.startGame();\n         setTimeout(gtReady,3000);')
target = out / source.relative_to(project / 'extracted/scripts')
target.parent.mkdir(parents=True, exist_ok=True)
target.write_text(s)

source = project / 'extracted/scripts/net/play5d/game/bvn/state/LoadingState.as'
s = source.read_text().replace(':loading_fight_mc', ':*').replace(':loading_select_ui_mc', ':*')
start = s.index('         var delayCall:* = function():void', s.index('private function onLoadFinish'))
end = s.index('\n      private function finish()', start)
s = s[:start] + '''         gotoGame([GameData.I.p1Select.fighter1],[GameData.I.p2Select.fighter1]);
      }
      ''' + s[end:]
target = out / source.relative_to(project / 'extracted/scripts')
target.parent.mkdir(parents=True, exist_ok=True)
target.write_text(s)

swf_out = root / 'tools/ruffle_test/www/gameplay_test.swf'
subprocess.run(['java', '-Xmx6g', '-Djava.awt.headless=true', '-Duser.home=' + str(root / 'tools/ffdec-home'),
                '-jar', '/usr/share/java/ffdec/ffdec-cli.jar', '-onerror', 'abort', '-importScript',
                str(project / 'working/anime_crossover_bvn.swf'), str(swf_out), str(out)], check=True)
print(swf_out, len(fighters), 'fighters')
