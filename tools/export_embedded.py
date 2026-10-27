from pathlib import Path
import subprocess,json,shutil,time
r=(Path(__file__).resolve().parents[1] / 'games/bleach_vs_naruto_3.5');binary=r/'extracted/binary'
retry=r/'extracted/misc/frame_retry'
if retry.exists():
 for p in retry.iterdir():shutil.move(str(p),r/'extracted/frames'/p.name)
 retry.rmdir()
inputs=[]
for p in sorted(binary.glob('*.bin')):
 with p.open('rb') as f:magic=f.read(3)
 if magic in [b'FWS',b'CWS',b'ZWS']:inputs.append(p)
inputs+=sorted((binary/'unpacked').rglob('*.swf'))
mapping={'scripts':'scripts','images':'images','shapes':'shapes','morphshapes':'morphshapes','fonts':'fonts','fonts4':'fonts','texts':'texts','sounds':'sounds','movies':'videos','binaryData':'binary','frames':'frames','sprites':'sprites','buttons':'misc/buttons','symbolClass':'misc/symbols'}
results=[]
for n,p in enumerate(inputs,1):
 ident=f'{n:03d}_{p.stem}'
 stage=r/'extracted/misc'/('_embedded_'+str(n));stage.mkdir()
 cmd=['java','-Xmx4g','-Djava.awt.headless=true',f'-Duser.home={r.parents[1]}/tools/ffdec-home','-jar','/usr/share/java/ffdec/ffdec-cli.jar','-onerror','ignore','-format','sprite:svg,frame:svg','-export','all',str(stage),str(p)]
 with (r/'analysis/logs'/f'embedded_{n:03d}.log').open('w') as log:
  run=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT)
 outputs=[]
 for item in list(stage.iterdir()):
  dest=r/'extracted'/mapping.get(item.name,'misc/other')/'embedded'/ident
  dest.mkdir(parents=True,exist_ok=True)
  if item.is_dir():
   for child in item.iterdir():shutil.move(str(child),dest/child.name)
   item.rmdir()
  else:shutil.move(str(item),dest/item.name)
  outputs.append(str(dest.relative_to(r)))
 stage.rmdir()
 results.append({'input':str(p.relative_to(r)),'id':ident,'exit_code':run.returncode,'outputs':outputs})
 (r/'analysis/embedded_exports.json').write_text(json.dumps(results,indent=2))
 print(f'{n}/{len(inputs)} {p.name}: exit {run.returncode}',flush=True)
