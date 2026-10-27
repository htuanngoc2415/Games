"""Test-only startup: expose the actual random pools and enter the character grid."""
from pathlib import Path
import shutil
ROOT=Path(__file__).resolve().parents[2]
P=ROOT/'games/anime_crossover_bvn'
out=P/'build/selection_test_scripts'
shutil.copytree(ROOT/'tools/ruffle_test/test_patch',out,dirs_exist_ok=True)
f=P/'extracted/scripts/net/play5d/game/bvn/MainGame.as'
s=f.read_text().replace('   import flash.display.Sprite;', '   import flash.display.Sprite;\n   import net.play5d.game.bvn.data.FighterModel;\n   import net.play5d.game.bvn.data.FighterVO;\n   import net.play5d.game.bvn.ctrl.GameLogic;')
s=s.replace('      public function goLogo() : void\n      {', '''      public function goLogo() : void
      {
         for(var group:int = -1; group <= 3; group++) {
            var pool:* = FighterModel.I.getFighters(group,function(f:FighterVO):Boolean {
               return f.id.indexOf("random") == -1 && GameLogic.canSelectFighter(f.id);
            });
            var ids:Array = [];
            for each(var item:FighterVO in pool) ids.push(item.id);
            ids.sort();
            trace("SELECTION_POOL " + group + " " + ids.join(","));
         }
         GameMode.currentMode = 40;
         goSelect();
         trace("SELECTION_READY");
         return;
''')
f=out/'net/play5d/game/bvn/MainGame.as';f.parent.mkdir(parents=True,exist_ok=True);f.write_text(s)
print(out)
