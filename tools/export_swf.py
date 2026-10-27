"""Export a SWF to a fresh directory; preserve input and retain diagnostics."""
from pathlib import Path
import argparse, hashlib, json, subprocess, time
p = argparse.ArgumentParser(description=__doc__)
p.add_argument('input', type=Path)
p.add_argument('output', type=Path)
a = p.parse_args()
src = a.input.resolve()
if not src.is_file():
    p.error('Input file does not exist')
if a.output.exists():
    p.error('Output must not exist; existing exports are preserved')
a.output.mkdir(parents=True)
def sha():
    return hashlib.sha256(src.read_bytes()).hexdigest()
before = sha()
home = Path(__file__).resolve().parent / 'ffdec-home'
cmd = ['java', '-Xmx4g', '-Djava.awt.headless=true', f'-Duser.home={home}', '-jar', '/usr/share/java/ffdec/ffdec-cli.jar', '-onerror', 'ignore', '-format', 'sprite:svg,frame:svg,button:svg', '-export', 'all', str(a.output / 'extracted'), str(src)]
start = time.time()
with (a.output / 'export.log').open('w') as log:
    result = subprocess.run(cmd, stdout=log, stderr=subprocess.STDOUT)
after = sha()
(a.output / 'export.json').write_text(json.dumps({'command': cmd, 'exit_code': result.returncode, 'seconds': time.time()-start, 'sha256_before': before, 'sha256_after': after, 'input_unchanged': before == after}, indent=2))
if before != after:
    raise RuntimeError('Input changed during export')
raise SystemExit(result.returncode)
