#!/usr/bin/env python3
"""Record coverage and errors separately; an action sweep is not full gameplay approval."""
import collections
import hashlib
import json
from pathlib import Path
import re
ROOT=Path(__file__).resolve().parents[2]
PROJECT=ROOT/'games/anime_crossover_bvn'
log=PROJECT/'build/roster_runtime_final/console.log'
s=log.read_text()
manifest=json.loads((log.parent/'build_manifest.json').read_text())
hashes={r['id']:r['sha256'] for r in manifest['fighters']}
rows=[];current=None
for line in s.splitlines():
 m=re.search(r'ROSTER_LOAD (ftop_\w+)',line)
 if m:
  current={'id':m[1],'actions':[],'body_present_at_idle':False,'sweep_completed':False,'errors':[]}
  rows.append(current)
 if current is None:continue
 m=re.search(r'ROSTER_ACTION (ftop_\w+) (\S+) body=(.*?)(?: color:|$)',line)
 if m:
  current['actions'].append(m[2])
  if m[2]=='站立':current['body_present_at_idle']=m[3]!='null'
 if 'ROSTER_ACTIONS_COMPLETED ' in line:current['sweep_completed']=True
 m=re.search(r'((?:TypeError|ReferenceError|RangeError|VerifyError|ArgumentError|Error): Error #[^\n]+?)(?: color:|$)',line)
 if m:current['errors'].append(m[1])
for row in rows:
 row['error_counts']=dict(collections.Counter(row.pop('errors')))
 row['fighter_sha256']=hashes[row['id']]
report={'game_sha256':manifest['game_sha256'],
 'test_swf_sha256':manifest['test_swf_sha256'],
 'done':'ROSTER_SMOKE_DONE' in s,'fighter_count':len(rows),'fighters':rows,
 'scope':'Instrumented real BVN: same fighter loaded twice, 15 forced action labels, alternating directions. Does not certify input/AI, full animations, cooldown isolation or KO/reset.',
 'known_runtime_limitation':'Error #1006 on fighter/bullet cleanup under this Ruffle version. No assertion that an action sweep is error-free.'}
(PROJECT/'analysis/roster_runtime_verification.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print('done:',report['done'],'loaded:',len(rows),'completed:',sum(r['sweep_completed'] for r in rows),'idle body:',sum(r['body_present_at_idle'] for r in rows))
