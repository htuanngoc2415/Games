#!/usr/bin/env python3
"""Create isolated BVN instrumentation. Never import these classes into release SWF."""
import json
from pathlib import Path
import shutil
root=Path(__file__).resolve().parents[2]
p=root/'games/anime_crossover_bvn'
out=p/'build/roster_smoke_scripts'
shutil.copytree(root/'tools/ruffle_test/test_patch',out,dirs_exist_ok=True)
source=p/'extracted/scripts/net/play5d/game/bvn/MainGame.as'
s=source.read_text()
s=s.replace('   import flash.display.Sprite;', '   import flash.display.Sprite;\n   import flash.utils.setTimeout;\n   import net.play5d.game.bvn.data.SelectVO;')
fighters=[f.stem for f in sorted((p/'ports').glob('*.json'))]
s=s.replace('      public function goLogo() : void\n      {', '''      private var smokeRoster:Array = %s;
      private var smokeIndex:int = 0;
      private var smokeStep:int = 0;
      private var smokeActions:Array = ["站立","走","砍1","砍技1","砍技2","招1","招2","招3","必杀","上必杀","超必杀","跳砍","跳招","防御","被打"];
      private function smokeLoad():void {
         if(smokeIndex >= smokeRoster.length) { trace("ROSTER_SMOKE_DONE"); return; }
         var id:String = smokeRoster[smokeIndex];
         trace("ROSTER_LOAD " + id);
         GameMode.currentMode = 40;
         GameData.I.p1Select = new SelectVO();
         GameData.I.p2Select = new SelectVO();
         GameData.I.p1Select.fighter1 = id;
         GameData.I.p2Select.fighter1 = id;
         GameData.I.p1Select.fuzhu = "kon";
         GameData.I.p2Select.fuzhu = "kon";
         GameData.I.selectMap = "xianshi";
         smokeStep = 0;
         loadGame();
      }
      private function smokeTick():void {
         var a:* = GameCtrl.I.gameRunData.p1FighterGroup.currentFighter;
         var b:* = GameCtrl.I.gameRunData.p2FighterGroup.currentFighter;
         if(!a || !b) { trace("ROSTER_FAIL missing fighter"); return; }
         if(smokeStep >= smokeActions.length) {
            trace("ROSTER_ACTIONS_COMPLETED " + smokeRoster[smokeIndex] + " hp=" + b.hp);
            smokeIndex++;
            smokeLoad();
            return;
         }
         var label:String = smokeActions[smokeStep++];
         a.x = 300; b.x = 380; a.y = 0; b.y = 0;
         a.direct = smokeStep %% 2 == 0 ? 1 : -1;
         b.x = a.x + 80 * a.direct;
         trace("ROSTER_ACTION " + smokeRoster[smokeIndex] + " " + label + " body=" + a.getCtrler().getBodyArea());
         if(a.getCtrler().getMcCtrl().getFighterMc().checkFrame(label)) {
            a.getCtrler().getMcCtrl().gotoAndPlay(label);
         } else { trace("ROSTER_SKIP " + smokeRoster[smokeIndex] + " " + label); }
         setTimeout(smokeTick,700);
      }
      public function goLogo() : void
      {
         smokeLoad();
         return;
''' % json.dumps(fighters))
s=s.replace('         GameCtrl.I.startGame();','         GameCtrl.I.startGame();\n         setTimeout(smokeTick,3000);')
target=out/source.relative_to(p/'extracted/scripts');target.parent.mkdir(parents=True,exist_ok=True);target.write_text(s)
# Bypass only the interactive fighter ordering in this test build.
source=p/'extracted/scripts/net/play5d/game/bvn/state/LoadingState.as'
s=source.read_text().replace(':loading_fight_mc', ':*').replace(':loading_select_ui_mc', ':*'); start=s.index('         var delayCall:* = function():void',s.index('private function onLoadFinish'))
end=s.index('\n      private function finish()',start)
s=s[:start]+'''         gotoGame([GameData.I.p1Select.fighter1],[GameData.I.p2Select.fighter1]);
      }
      '''+s[end:]
target=out/source.relative_to(p/'extracted/scripts');target.parent.mkdir(parents=True,exist_ok=True);target.write_text(s)
print(out)
