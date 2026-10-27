import json
from pathlib import Path
import unittest
from frame_translation import translate_stateful
from gen_fighter import Generator, parse_gjl, hit_vo
from prepare_roster import PROJECT, SOURCE

class ConversionTests(unittest.TestCase):
 def test_conditional_branch_is_not_flattened(self):
  code=translate_stateful('if(_root.game["p" + pn].mc.动作 == -1) { gotoAndStop("砍技12"); play(); }')
  self.assertIn('if((fc.getTargetState()',code)
  self.assertIn('c.loop("砍技12")',code)
 def test_unknown_engine_call_is_not_silently_accepted(self):
  self.assertIsNone(translate_stateful('_root.game["p" + pn].unknown();'))
 def test_state_persists_between_combo_frames(self):
  self.assertIn('this._flyN = 0',translate_stateful('var _flyN = 0;'))
  self.assertIn('this._flyN++',translate_stateful('_flyN++; if(_flyN > 8) { gotoAndStop("招30"); }'))
 def test_both_diagonal_projectiles_are_emitted(self):
  cfg=json.loads((PROJECT/'ports/ftop_gray.json').read_text())
  tl=json.loads((PROJECT/'build/port/ftop_gray/timeline.json').read_text())
  src=(SOURCE/'extracted/downloaded_fighter_scripts/gray.swf/scripts/frame_1/DoAction.as').read_text()
  gen=Generator(cfg,tl,src);gen.build()
  self.assertEqual(sum('c.fire(' in line for line in gen.code[517]),2)
  self.assertEqual({b['params']['y'] for b in cfg['bullets'] if b['frame']==517},{-3,3})
 def test_source_damage_and_knockback(self):
  hit=parse_gjl('gjl1.k1pw = 42; gjl1.k1up = 6; gjl1.k1x = 8; gjl1.k1dz = "击飞";')['k1']
  types=json.loads((PROJECT/'ports/ftop_natsu.json').read_text())['hitTypes']
  vo=hit_vo('k1',hit,types)
  self.assertEqual((vo['power'],vo['hity'],vo['hitx'],vo['hurtType']),(42,-6,8,1))

if __name__=='__main__':unittest.main()
