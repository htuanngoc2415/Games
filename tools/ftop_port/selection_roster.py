"""Compose the crossover grid and random franchise metadata without changing combat types."""
import json
from pathlib import Path
import shutil
import xml.etree.ElementTree as ET

RANDOMS = {'random_fairy_tail': (2, 'Random Fairy Tail'), 'random_one_piece': (3, 'Random One Piece')}

def configure(project_dir, zip_root, fighter_xml, select_xml):
    project, target = Path(project_dir), Path(zip_root)
    layout = json.loads((project/'assets/config/crossover_select.json').read_text())
    fighters, select = ET.fromstring(fighter_xml), ET.fromstring(select_xml)
    by_id = {f.get('id'): f for f in fighters}
    for group, ids in layout['groups'].items():
        for fid in ids:
            by_id[fid].set('roster_group', group)
    for fid, (group, title) in RANDOMS.items():
        node = ET.SubElement(fighters, 'fighter', {'id':fid, 'name':title, 'comic_type':str(group), 'roster_group':str(group)})
        by_id[fid] = node
        ET.SubElement(node, 'face', {'url':f'face/{fid}.png'})
        shutil.copyfile(project/f'assets/face/ported/{fid}.png', target/f'assets/face/{fid}.png')
    original_items = {(n.text or '').strip(): n for n in select.findall('./char_list/row/item') if (n.text or '').strip()}
    char_list = select.find('char_list')
    char_list.clear()
    used = set()
    for index, row in enumerate(layout['rows']):
        row_node = ET.SubElement(char_list,'row',{'offset':','.join(map(str,layout['row_offsets'][index]))})
        for fid in row:
            attrs = {}
            if fid:
                if fid in used or fid not in by_id:
                    raise ValueError('Duplicate or unknown grid fighter: '+fid)
                used.add(fid)
                old = original_items.get(fid)
                if old is not None and old.get('moreFighter'):
                    attrs['moreFighter'] = old.get('moreFighter')
            ET.SubElement(row_node,'item',attrs).text = fid
    expected = set(original_items) | {fid for ids in layout['groups'].values() for fid in ids} | set(RANDOMS)
    if not expected <= used:
        raise ValueError('Grid omitted existing fighters: '+str(expected-used))
    for tree in (fighters, select): ET.indent(tree, space='\t')
    return tuple('<?xml version="1.0" encoding="utf-8"?>\n'+ET.tostring(t,encoding='unicode')+'\n' for t in (fighters,select))
