#!/usr/bin/env python3
"""Prepare reproducible per-fighter ports from the exported source inventory.
Natsu's reviewed config is never overwritten. Generated aliases require visual QA.
"""
import concurrent.futures
import json
from pathlib import Path
import re
import subprocess
import sys
from analyze_timeline import parse_sprite, read_scripts

ROOT = Path(__file__).resolve().parents[2]
PROJECT = ROOT / 'games/anime_crossover_bvn'
SOURCE = ROOT / 'games/fairy_tail_vs_one_piece_2.0'
FFDEC = ['java', '-Xmx2g', '-Djava.awt.headless=true', '-Duser.home='+str(ROOT/'tools/ffdec-home'), '-jar', '/usr/share/java/ffdec/ffdec-cli.jar']


def prepare(name, entry):
    if name == 'natsu':
        return
    fid = 'ftop_' + name
    work = PROJECT / 'build/port' / fid
    work.mkdir(parents=True, exist_ok=True)
    dump = work / 'dump.txt'
    if not dump.exists():
        with dump.open('w') as out:
            subprocess.run(FFDEC + ['-dumpSWF', str(PROJECT / 'assets/fighter/ftop' / (name + '.swf'))], stdout=out, check=True)
    scripts = SOURCE / 'extracted/downloaded_fighter_scripts' / (name + '.swf') / 'scripts'
    action = int(re.search(r'Symbol (\d+)\.xml', entry['main_timeline'])[1])
    subprocess.run([sys.executable, str(Path(__file__).with_name('analyze_timeline.py')), str(dump), str(scripts), str(action), str(work / 'timeline.json')], check=True, stdout=subprocess.DEVNULL)
    tl = json.loads((work / 'timeline.json').read_text())
    labels = {x['name']: x['frame'] for x in tl['labels']}
    fs = {int(k): v for k, v in tl['frameScripts'].items()}
    template = json.loads((PROJECT / 'ports/ftop_natsu.json').read_text())
    cfg = {k: template[k] for k in ('stats', 'engineSections', 'hitTypes')}
    jump, land, fly, down = [labels[k] for k in ('跳', '落地', '击飞', '击落地')]
    fall = next((f + 1 for f, src in sorted(fs.items()) if fly <= f < down and 'beidaStop(true)' in src), fly + 5)
    rise = next((f - 5 for f, src in sorted(fs.items()) if down < f < labels['起身'] and 'gotoAndStop("站立")' in src), labels['起身'])
    cfg.update(id=fid, displayName=name, source=f'assets/fighter/ftop/{name}.swf', output=f'assets/fighter/ported/{fid}.swf', actionSprite=action, package=fid+'_fla', sounds={},
        labels={'remove': ['跳', '落地'], 'add': {'起跳': jump, '跳': jump+2, '跳中': jump+10, '落地': land+1, '击飞_落': fall, '击飞_弹': down+1, '击飞_倒': down+7, '击飞_起': rise, '防御恢复': labels['防住']}},
        idle={'label': '站立', 'loopFrame': next(f for f, src in sorted(fs.items()) if f < labels['走'] and 'gotoAndStop("站立")' in src)},
        walk={'label': '走', 'loopFrame': next(f for f, src in sorted(fs.items()) if labels['走'] <= f < labels['瞬步'] and 'gotoAndStop("站立")' in src)},
        bullets=[], stopAtLastFrame=[], provenance={'aliases': 'source labels + beidaStop/onHitDown recovery script anchors; visual QA pending'})
    lines = dump.read_text().splitlines()
    # Preserve stop/loop semantics for child effects with simple frame scripts.
    nested = {}
    for folder in scripts.glob('DefineSprite_*'):
        sid = int(folder.name.split('_')[-1])
        if sid == action:
            continue
        child_fs, _ = read_scripts(str(scripts), sid)
        simple = {}
        for frame, src in child_fs.items():
            if src.strip() == 'stop();':
                simple[str(frame)] = 'stop();'
            elif re.fullmatch(r'\s*gotoAndPlay\((\d+)\);\s*', src):
                simple[str(frame)] = src.strip()
        if simple:
            nested[str(sid)] = simple
    cfg['nestedFrameScripts'] = nested
    # Detached linear projectiles: source movement, impact frame and hit area.
    for clip in tl['clips']:
        body = clip['handlers'].get('enterFrame', '')
        if 'movspeed' not in body or 'hitTest' not in body:
            continue
        sid = clip['chid']
        child_fs, _ = read_scripts(str(scripts), sid)
        joined = '\n'.join(child_fs.values())
        speed = re.search(r'(?:var )?movspeed = (-?[\d.]+)', joined)
        hitname = re.search(r'_name = "(\w+atm)"', joined)
        hitframe = re.search(r'gotoAndPlay\((\d+)\)', body)
        total, events = parse_sprite(lines, sid)
        area = next((e for e in events if e.get('nm') in ('mian', 'main', 'hit')), None)
        if not (speed and hitname and hitframe and area):
            continue
        impact = int(hitframe[1])
        loops = [f for f, src in child_fs.items() if f < impact and 'stop();' in src]
        cfg['bullets'].append({'frame': clip['start'], 'depth': clip['depth'], 'sprite': sid, 'name': hitname[1], 'params': {'x': float(speed[1]), 'hold': 1.5, 'hits': 1, 'hp': 100}, 'labels': {'loop': max(loops, default=1), 'hit': impact, 'remove': total}, 'hitArea': {'frame': area['frame'], 'depth': area['dpt']}})
        cfg['nestedFrameScripts'].pop(str(sid), None)
    path = PROJECT / 'ports' / (fid+'.json')
    if not path.exists():
        path.write_text(json.dumps(cfg, ensure_ascii=False, indent=2)+'\n')
    print(fid, 'prepared', len(cfg['bullets']), 'projectiles', flush=True)


if __name__ == '__main__':
    inventory = json.loads((PROJECT/'analysis/xfl_inventory.json').read_text())['fighters']
    with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:
        list(pool.map(lambda item: prepare(*item), inventory.items()))
