#!/usr/bin/env python3
"""Extract original portraits/cut-ins and assign portraits to the crossover selection grid."""
import base64
import io
import json
import re
from PIL import Image, ImageOps
from prepare_roster import PROJECT, SOURCE
from analyze_timeline import parse_sprite

lines = (PROJECT/'build/ftop_main_dump.txt').read_text().splitlines()
labels = {}
for sid in (1306, 1386, 1570):
    _, events = parse_sprite(lines, sid)
    labels[sid] = {e['name']: e['frame'] for e in events if e['tag']=='FrameLabel'}

def bitmap(sid, label):
    frame = labels[sid][label]
    svg = (SOURCE/f'extracted/sprites/DefineSprite_{sid}/{frame}.svg').read_text()
    payload = re.search(r'data:image/[^;]+;base64,([^"\s]+)', svg)[1]
    return Image.open(io.BytesIO(base64.b64decode(payload))).convert('RGBA')

groups = [ ['natsu','gray','lucy','gajeel','wendy','juvia','makarov'], ['luffy','luffy2','sanji','sanji2','robin2','nami'], ['zoro','zoro2','jinbei','law'], ['ace','buggy','crocodile','hancock','doflamingo'], ['ersa','mirajane','lasasi'] ]
layout = json.loads((PROJECT/'assets/config/crossover_select.json').read_text())
positions = {fid:{'row':i+1,'slot':j+1} for i,row in enumerate(layout['rows']) for j,fid in enumerate(row) if fid}
source_data = (SOURCE/'extracted/scripts/frame_8/DoAction.as').read_text()
for group in groups:
    for name in group:
        if name=='natsu': continue
        path = PROJECT/'ports'/f'ftop_{name}.json'
        cfg=json.loads(path.read_text())
        source_line = next(l for l in source_data.splitlines() if f'url:"{name}.swf"' in l)
        label=re.search(r'addFighterData\("([^"]+)"',source_line)[1]
        display=re.search(r'name:"([^"]+)"',source_line)[1]
        cfg['displayName']=display
        prefix=f'assets/face/ported/ftop_{name}'
        small, big = bitmap(1386,label),bitmap(1306,label)
        for suffix, size, im in [('',(50,48),small),('_m',(102,64),big),('_b',(245,62),big),('_w',(300,250),big)]:
            # Fit UI portraits; retain the full original portrait for the win screen.
            result = ImageOps.pad(im,size,method=Image.Resampling.LANCZOS,color=(0,0,0,0)) if suffix=='_w' else ImageOps.fit(im,size,method=Image.Resampling.LANCZOS,centering=(.5,.25))
            result.save(PROJECT/(prefix+suffix+'.png'))
        music_match=re.search(r'music:"([^"]+)"',source_line)
        music=music_match[1] if music_match else ('fairytail.mp3' if 'is_fairy:true' in source_line else 'onepiece.mp3')
        says=json.loads('['+re.search(r'says:\[(.*)\]',source_line)[1]+']')
        reg={'name':label,'comicType':1,'faces':prefix,'bgm':{'file':'assets/music/ftop/'+music,'url':'bgm/ftop/'+music,'rate':70},'says':says}
        reg['select']=positions['ftop_'+name]
        cfg['register']=reg
        faces={}
        scriptroot=SOURCE/'extracted/downloaded_fighter_scripts'/f'{name}.swf'/'scripts'
        refs=set()
        for script in scriptroot.rglob('DoAction.as'):
            refs.update(re.findall(r'_root\.showFace\(pn,"([^"]+)"\)',script.read_text()))
        for i, ref in enumerate(sorted(refs),1):
            if ref not in labels[1570]: continue
            out=prefix+f'_bs{i}.png'
            bitmap(1570,ref).save(PROJECT/out)
            faces[ref]=out
        cfg['bishaFaces']=faces
        path.write_text(json.dumps(cfg,ensure_ascii=False,indent=2)+'\n')
print('Portraits, cut-ins and selection metadata prepared for 24 fighters.')
