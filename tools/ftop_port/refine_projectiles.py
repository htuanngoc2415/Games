#!/usr/bin/env python3
"""Infer linear and diagonal projectile placements from source clip handlers."""
import json
import re
from prepare_roster import PROJECT, SOURCE
from analyze_timeline import parse_sprite, read_scripts
for path in sorted((PROJECT/'ports').glob('*.json')):
    if path.stem=='ftop_natsu': continue
    cfg=json.loads(path.read_text())
    work=PROJECT/'build/port'/cfg['id']
    tl=json.loads((work/'timeline.json').read_text())
    lines=(work/'dump.txt').read_text().splitlines()
    scripts=SOURCE/'extracted/downloaded_fighter_scripts'/(cfg['source'].split('/')[-1])/'scripts'
    bullets=[]
    for clip in tl['clips']:
        body=clip['handlers'].get('enterFrame','')
        if '_X =' not in body or '_parent.gotoAndPlay' in body: continue
        sid=clip['chid']
        fs,_=read_scripts(str(scripts),sid)
        joined='\n'.join(fs.values())
        total,events=parse_sprite(lines,sid)
        area=next((e for e in events if e.get('nm') in ('mian','main','hit','hitmc')),None)
        if not area and 'if(hitTest(' in body:
            area=next((e for e in events if e['tag'].startswith('PlaceObject') and e['frame']==1 and 'chid' in e),None)
        if not area: continue
        names=[n['name'] for n in tl['named'] if n['frame']==clip['start'] and n['depth']==clip['depth'] and n['name'].endswith('atm')]
        names+=re.findall(r'_name = "(\w+atm)"',joined)
        if not names: continue
        source_speed=re.search(r'movspeed = (-?[\d.]+)',joined)
        def velocity(axis):
            m=re.search(r'_'+axis+r' = _'+axis+r' ([+-]) (movspeed|[\d.]+)',body)
            if not m:return 0
            value=float(source_speed[1]) if m[2]=='movspeed' and source_speed else float(m[2])
            return value * (-1 if m[1]=='-' else 1)
        impact=re.search(r'gotoAndPlay\((\d+)\)',body)
        impact=int(impact[1]) if impact else next((f for f,s in sorted(fs.items()) if '_name =' in s),total)
        loop=max([f for f,s in fs.items() if f<impact and 'stop();' in s],default=1)
        name=names[0][:-3]+f'_{clip["start"]}_{clip["depth"]}atm'
        bullets.append({'frame':clip['start'],'depth':clip['depth'],'sprite':sid,'name':name,'params':{'x':velocity('X'),'y':velocity('Y'),'hold':1.5,'hits':1,'hp':100},'labels':{'loop':loop,'hit':impact,'remove':total},'hitArea':{'frame':area['frame'],'depth':area['dpt']}})
        cfg['nestedFrameScripts'].pop(str(sid),None)
    cfg['bullets']=bullets
    path.write_text(json.dumps(cfg,ensure_ascii=False,indent=2)+'\n')
    print(cfg['id'],len(bullets))
