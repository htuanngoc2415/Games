#!/usr/bin/env python3
"""Đưa các fighter đã port vào cây file sẽ nén lại thành ZIP tài nguyên của BVN.

Đọc ports/*.json; nhân vật nào có SWF đầu ra thì chép SWF, ảnh mặt và thêm vào
fighter.xml/select.xml (sinh từ bản gốc BVN trong assets/config/bvn_original)."""
import glob
import json
import os
import re
import shutil
import sys
from xml.sax.saxutils import escape
from selection_roster import configure

project_dir, zip_root = sys.argv[1], sys.argv[2]
config_src = os.path.join(project_dir, 'assets/config/bvn_original')
fighter_xml = open(os.path.join(config_src, 'fighter.xml'), encoding='utf-8', newline='').read()
select_xml = open(os.path.join(config_src, 'select.xml'), encoding='utf-8', newline='').read()
added = []

for path in sorted(glob.glob(os.path.join(project_dir, 'ports/*.json'))):
    cfg = json.load(open(path, encoding='utf-8'))
    swf = os.path.join(project_dir, cfg['output'])
    reg = cfg.get('register')
    if not reg or not os.path.exists(swf):
        continue
    fid = cfg['id']
    os.makedirs(os.path.join(zip_root, 'assets/fighter'), exist_ok=True)
    os.makedirs(os.path.join(zip_root, 'assets/face'), exist_ok=True)
    shutil.copy(swf, os.path.join(zip_root, 'assets/fighter/%s.swf' % fid))
    for suffix in ('', '_b', '_m', '_w'):
        shutil.copy(os.path.join(project_dir, reg['faces'] + suffix + '.png'),
                    os.path.join(zip_root, 'assets/face/%s%s.png' % (fid, suffix)))
    if reg['bgm'].get('file'):
        bgm_target = os.path.join(zip_root, 'assets', reg['bgm']['url'])
        os.makedirs(os.path.dirname(bgm_target), exist_ok=True)
        shutil.copy(os.path.join(project_dir, reg['bgm']['file']), bgm_target)
    says = ''.join('\n\t\t\t<say_item>%s</say_item>' % escape(s) for s in reg['says'])
    nl = '\r\n' if '\r\n' in fighter_xml else '\n'
    entry = ('\t<fighter id="{id}" name="{name}" comic_type="{ct}">\n'
             '\t\t<file url="fighter/{id}.swf" startFrame="1"/>\n'
             '\t\t<face url="face/{id}.png" big_url="face/{id}_b.png" bar_url="face/{id}_m.png" win_url="face/{id}_w.png"/>\n'
             '\t\t<contact>\n\t\t\t<friend></friend>\n\t\t\t<enemy></enemy>\n\t\t</contact>\n'
             '\t\t<says>{says}\n\t\t</says>\n'
             '\t\t<bgm url="{bgm}" rate="{rate}"/>\n\t</fighter>\n\t\n').format(
        id=fid, name=escape(reg['name']), ct=reg['comicType'], says=says,
        bgm=reg['bgm']['url'], rate=reg['bgm']['rate']).replace('\n', nl)
    fighter_xml = fighter_xml.replace('</fighter_config>', entry + '</fighter_config>')

    added.append(fid)

fighter_xml, select_xml = configure(project_dir, zip_root, fighter_xml, select_xml)

os.makedirs(os.path.join(zip_root, 'assets/config'), exist_ok=True)
open(os.path.join(zip_root, 'assets/config/fighter.xml'), 'w', encoding='utf-8', newline='').write(fighter_xml)
open(os.path.join(zip_root, 'assets/config/select.xml'), 'w', encoding='utf-8', newline='').write(select_xml)
print('registered: %s' % (', '.join(added) or 'none'))
