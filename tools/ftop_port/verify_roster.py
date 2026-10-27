#!/usr/bin/env python3
"""Validate actual SWF tags and packaged roster; runtime quality is reported separately."""
import hashlib
import json
from pathlib import Path
import struct
import zlib
import zipfile
import xml.etree.ElementTree as ET
from collections import Counter
from prepare_roster import PROJECT

def tags(raw):
    if raw[:3]==b'CWS':raw=raw[:8]+zlib.decompress(raw[8:])
    assert raw[:3] in (b'FWS',b'CWS')
    assert len(raw)==struct.unpack_from('<I',raw,4)[0]
    nbits=raw[8]>>3
    pos=8+(5+4*nbits+7)//8+4
    return parse(raw[pos:])

def parse(data):
    pos=0; out=[]
    while pos<len(data):
        header=struct.unpack_from('<H',data,pos)[0];pos+=2
        typ,size=header>>6,header&63
        if size==63:size=struct.unpack_from('<I',data,pos)[0];pos+=4
        body=data[pos:pos+size];assert len(body)==size;pos+=size
        out.append((typ,body))
        if typ==0:break
    return out

def walk(ts):
    for typ,body in ts:
        yield typ,body
        if typ==39:yield from walk(parse(body[4:]))

def immutable(ts):
    return Counter((t,hashlib.sha256(b).hexdigest()) for t,b in walk(ts) if t in (2,22,32,83,6,21,35,90,20,36,14,18,19,45,46,84))

results=[]
for cfgpath in sorted((PROJECT/'ports').glob('*.json')):
    cfg=json.loads(cfgpath.read_text()); raw=(PROJECT/cfg['output']).read_bytes(); out=tags(raw)
    src=tags((PROJECT/cfg['source']).read_bytes())
    assert not any(t in (12,59) for t,b in walk(out)), cfg['id']+' contains AVM1 actions'
    assert not any(t in (26,70) and b[0]&128 for t,b in walk(out)), cfg['id']+' contains AVM1 clip actions'
    assert any(t==69 and struct.unpack('<I',b)[0]&8 for t,b in out), 'missing AS3 flag'
    assert any(t==82 for t,b in out), 'missing ABC'
    assert not (immutable(src)-immutable(out)), cfg['id']+' lost art or sound tags'
    actions=next(b for t,b in out if t==39 and struct.unpack_from('<H',b)[0]==cfg['actionSprite'])
    actual_labels={b.split(b'\0')[0].decode() for t,b in parse(actions[4:]) if t==43}
    required={'站立','走','起跳','跳','跳中','落','落地','砍1','防御','被打','击飞','击飞_落','击飞_弹','击飞_倒','击飞_起','胜利','失败'}
    assert required<=actual_labels,(cfg['id'],required-actual_labels)
    report=(PROJECT/'build/port'/cfg['id']/'as3/report.txt').read_text().splitlines()
    results.append({'id':cfg['id'],'sha256':hashlib.sha256(raw).hexdigest(),'avm2':True,'source_art_and_audio_preserved':True,'required_labels':True,'translation_warnings':[l for l in report[2:] if l.strip()]})
with zipfile.ZipFile(PROJECT/'build/assets_with_gameplay.zip') as z:
    fighters=ET.fromstring(z.read('assets/config/fighter.xml'))
    select=ET.fromstring(z.read('assets/config/select.xml'))
    ids={f.attrib['id'] for f in fighters}
    original=ET.parse(PROJECT/'assets/config/bvn_original/fighter.xml').getroot()
    assert {f.attrib['id'] for f in original}<=ids
    access=set()
    for item in select.findall('./char_list/row/item'):
        if item.text:access.add(item.text)
        variants=list(filter(None,item.get('moreFighter','').split(',')))
        assert len(variants)<=8, 'BVN only has eight variant positions'
        access.update(variants)
    for r in results:
        assert r['id'] in access,r['id']+' not selectable'
        assert hashlib.sha256(z.read('assets/fighter/'+r['id']+'.swf')).hexdigest()==r['sha256']
    for path in (PROJECT/'assets/fighter/bvn').rglob('*.swf'):
        assert z.read('assets/fighter/'+path.relative_to(PROJECT/'assets/fighter/bvn').as_posix())==path.read_bytes()
(PROJECT/'analysis/roster_verification.json').write_text(json.dumps(results,ensure_ascii=False,indent=2)+'\n')
print('PASS: 25 AVM2 fighters; required action labels; original art/audio; select reachability; packaged hashes; original BVN fighters intact.')
print('Translation warnings:',sum(len(r['translation_warnings']) for r in results))
