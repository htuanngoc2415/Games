#!/usr/bin/env python3
"""Build configured FTOP fighters, reusing source exports; record every failure."""
import concurrent.futures
import json
from pathlib import Path
import subprocess
import sys
from prepare_roster import ROOT, PROJECT, SOURCE
TOOL = Path(__file__).resolve().parent
CP = ':'.join(str(p) for p in sorted(Path('/usr/share/java/ffdec/lib').glob('*.jar')))

def build(path):
    cfg = json.loads(path.read_text())
    fid = cfg['id']
    work = PROJECT/'build/port'/fid
    scripts = SOURCE/'extracted/downloaded_fighter_scripts'/Path(cfg['source']).name/'scripts'
    try:
        with (work/'build.log').open('w') as log:
            subprocess.run([sys.executable, str(TOOL/'gen_fighter.py'), str(path), str(work/'timeline.json'), str(scripts/'frame_1/DoAction.as'), str(work/'dump.txt'), str(PROJECT), str(work/'as3')], stdout=log, stderr=subprocess.STDOUT, check=True)
            subprocess.run(['java', '-Xmx2g', '-Djava.awt.headless=true', '-cp', CP+':'+str(TOOL/'build'), 'SwfAs2ToAs3', str(work/'as3/plan.json')], stdout=log, stderr=subprocess.STDOUT, check=True)
        result = {'id': fid, 'compiled': True, 'report': str((work/'as3/report.txt').relative_to(PROJECT)), 'runtime_verified': False}
    except subprocess.CalledProcessError:
        result = {'id': fid, 'compiled': False, 'log': str((work/'build.log').relative_to(PROJECT))}
    print(result, flush=True)
    return result

if __name__ == '__main__':
    subprocess.run(['javac', '-d', str(TOOL/'build'), '-cp', CP, str(TOOL/'SwfAs2ToAs3.java')], check=True)
    paths = [p for p in sorted((PROJECT/'ports').glob('*.json')) if p.stem != 'ftop_natsu']
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        results = list(pool.map(build, paths))
    (PROJECT/'analysis/roster_build.json').write_text(json.dumps(results, indent=2)+'\n')
    sys.exit(any(not r['compiled'] for r in results))
