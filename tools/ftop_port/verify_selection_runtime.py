#!/usr/bin/env python3
"""Compare pools returned by the actual AVM2 FighterModel to the packaged selectable roster."""
import hashlib,json,re,zipfile
import xml.etree.ElementTree as ET
from prepare_roster import PROJECT
run=json.loads((PROJECT/'build/selection_runtime/pools.json').read_text())
assert run['game_sha256']==hashlib.sha256((PROJECT/'working/anime_crossover_bvn.swf').read_bytes()).hexdigest()
with zipfile.ZipFile(PROJECT/'build/assets_with_gameplay.zip') as z:
 f=ET.fromstring(z.read('assets/config/fighter.xml'));s=ET.fromstring(z.read('assets/config/select.xml'))
 accessible=set()
 for n in s.findall('./char_list/row/item'):
  accessible.add((n.text or '').strip());accessible.update(filter(None,n.get('moreFighter','').split(',')))
 for group in range(-1,4):
  expected={n.get('id') for n in f if n.get('id') in accessible and 'random' not in n.get('id') and (group==-1 or int(n.get('roster_group',n.get('comic_type')))==group)}
  actual=run['pools'][str(group)]
  assert len(actual)==len(set(actual))
  assert set(actual)==expected,(group,set(actual)^expected)
log=(PROJECT/'build/selection_runtime/console.log').read_text()
assert not re.search(r'Error #|PAGEERROR|panicked|RustError',log)
run['counts']={g:len(ids) for g,ids in run['pools'].items()}
run['scope']='Real AVM2 FighterModel pools + GameLogic eligibility; screenshots of grid and hovered random tiles; no combat changes.'
run['error_count']=0
(PROJECT/'analysis/selection_random_verification.json').write_text(json.dumps(run,ensure_ascii=False,indent=2)+'\n')
print('PASS actual AVM2 pools:',run['counts'])
