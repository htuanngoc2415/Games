#!/usr/bin/env python3
"""Keep child hitbox renames and stop/loop scripts; audit unsupported reachable scripts."""
import json,re
from prepare_roster import PROJECT,SOURCE
from analyze_timeline import read_scripts,parse_sprite
from frame_translation import translate_stateful
for path in sorted((PROJECT/'ports').glob('*.json')):
 if path.stem=='ftop_natsu':continue
 cfg=json.loads(path.read_text());scripts=SOURCE/'extracted/downloaded_fighter_scripts'/cfg['source'].split('/')[-1]/'scripts'
 dump=(PROJECT/'build/port'/cfg['id']/'dump.txt').read_text();lines=dump.splitlines()
 voices={name:int(sid) for sid,name in re.findall(r'ExportAssets \(chid: (\d+), exp: "([^"]+)"',dump)}
 hurt=[sid for name,sid in voices.items() if name.startswith('voice_hurt')]
 cfg['sounds']={'hurt':hurt,'hurtFly':hurt,'die':[voices['voice_die']] if 'voice_die' in voices else []}
 sprite_ids={int(n) for n in re.findall(r'DefineSprite \(chid: (\d+)\)',dump)}
 reachable=set();queue=[cfg['actionSprite']]
 while queue:
  sid=queue.pop()
  if sid in reachable:continue
  reachable.add(sid)
  _,events=parse_sprite(lines,sid)
  queue += [e['chid'] for e in events if e['tag'].startswith('PlaceObject') and e.get('chid') in sprite_ids and e['chid'] not in reachable]
 nested={}; warnings=[];bullet_ids={b['sprite'] for b in cfg['bullets']}
 for sid in sorted(reachable-{cfg['actionSprite']}-bullet_ids):
  fs,clips=read_scripts(str(scripts),sid);frames={}
  total,_=parse_sprite(lines,sid)
  for f,src in fs.items():
   if '_root.jie' in src:continue # Obsolete source host/version loader, not combat.
   if (sid < 30 or total == 1) and 'function gameRunning()' in src:continue
   if sid < 30 and 'function ' in src:continue # Source input/body engine is replaced by BVN.
   if '_parent._parent._x' in src and '_X = ' in src:
    adapted=src.replace('_parent._parent','_parent').replace('_parent.pn','pn').replace('_X','clip._x').replace('_Y','clip._y')
    converted=translate_stateful(adapted)
    if converted:
     frames[str(f)] = 'var fc:* = parent && parent.parent ? parent.parent.$fighter_ctrler : null; ' + converted.replace('if(fc.target)', 'if(fc && fc.target)').replace('this.clip.', 'this.')
     continue
   statements=[x.strip() for x in src.split(';') if x.strip()];translated=[]
   for stmt in statements:
    if stmt=='stop()':translated.append('stop();');continue
    m=re.fullmatch(r'(?:this\.)?_name = "(\w+)"',stmt)
    if m:translated.append('this.name = "%s";' % m[1]);continue
    m=re.fullmatch(r'gotoAndPlay\((\d+)\)',stmt)
    if m:translated.append('gotoAndPlay(%s);'%m[1]);continue
    if re.fullmatch(r'var (played|movspeed) = -?[\d.]+',stmt):continue
    if stmt.startswith('_root._y '):continue # Camera offsets do not belong on the fighter.
    m=re.fullmatch(r'_root\.(shine|shake)\(([\d.,]*)\)',stmt)
    if m:translated.append('if(parent && parent.parent && parent.parent.$effect_ctrler) parent.parent.$effect_ctrler.%s(%s);'%m.groups());continue
    if stmt=='_parent._flowerHit = 2':translated.append('parent._flowerHit = 2;');continue
    if stmt=='_parent.gotoAndPlay("招22")':translated.append('if(parent && parent.parent && parent.parent.$mc_ctrler) parent.parent.$mc_ctrler.gotoAndPlay("招22");');continue
    warnings.append({'sprite':sid,'frame':f,'source':stmt})
   if translated:frames[str(f)]=' '.join(translated)
  if frames:nested[str(sid)]=frames
  for (frame,depth),clip in clips.items():
   warnings.append({'sprite':sid,'frame':frame,'depth':depth,'source':clip['handlers']})
 cfg['nestedFrameScripts']=nested
 cfg['nestedScriptWarnings']=warnings
 # Actual movement values live in the source root's load event.
 for script in (scripts/'frame_1').glob('PlaceObject*/*.as'):
  src=script.read_text()
  for source,target in [('spd','speed'),('jumpPower','jumpPower')]:
   m=re.search(r'var '+source+r' = ([\d.]+)',src)
   if m:cfg['stats'][target]=float(m[1])
 path.write_text(json.dumps(cfg,ensure_ascii=False,indent=2)+'\n')
 print(cfg['id'],'nested warnings',len(warnings))
