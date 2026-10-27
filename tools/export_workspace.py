from pathlib import Path
import subprocess, hashlib, json, shutil, time
root=(Path(__file__).resolve().parents[1] / 'games/bleach_vs_naruto_3.5')
name='bleach_vs_naruto_3.5.swf'
def sha(p):
 h=hashlib.sha256()
 with p.open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''): h.update(b)
 return h.hexdigest()
for d in ['original','working','patches','analysis/logs','extracted/misc','tools']:(root/d).mkdir(parents=True,exist_ok=True)
src=root/name
before=sha(src)
(root/'analysis/original_sha256_before.txt').write_text(f'{before}  {name}\n')
for d in ['original','working']:
 p=root/d/name
 if p.exists(): assert sha(p)==before, f'Existing copy differs: {p}'
 else: shutil.copy2(src,p)
 assert sha(p)==before
(root/'analysis/sha256sums.txt').write_text(''.join(f'{sha(root/d/name)}  {d}/{name}\n' for d in ['original','working']))
# Preserve the root original as requested; no deletion is necessary.
old=root/'extracted/scripts'
if old.exists() and any(old.iterdir()):
 backup=root/'extracted/misc/preexisting_script_export'
 assert not backup.exists()
 shutil.move(str(old),backup)
installer=root/'ffdec_26.3.0.deb'
if installer.exists(): shutil.move(str(installer),root/'tools'/installer.name)
java=['java','-Xmx4g',f'-Duser.home={root.parents[1]}/tools/ffdec-home','-jar','/usr/share/java/ffdec/ffdec-cli.jar']
for flag,file in [(['-help'],'ffdec_help.txt'),(['-help','-export'],'ffdec_export_help.txt'),(['-dumpSWF',str(root/'original'/name)],'swf_tags.txt')]:
 with (root/'analysis'/file).open('w') as f: subprocess.run(java+flag,stdout=f,stderr=subprocess.STDOUT)
results=[]
for category,directory in [('script','scripts'),('image','images'),('shape','shapes'),('morphshape','morphshapes'),('font','fonts'),('font4','fonts'),('text','texts'),('sound','sounds'),('movie','videos'),('binaryData','binary'),('symbolClass','misc/symbols'),('button','misc/buttons'),('frame','frames'),('sprite','sprites')]:
 dest=root/'extracted'/directory;dest.mkdir(parents=True,exist_ok=True)
 stage=root/'extracted/misc'/f'_stage_{category}';stage.mkdir()
 cmd=java+['-onerror','ignore','-export',category,str(stage),str(root/'original'/name)]
 start=time.time();print(f'Starting {category}',flush=True)
 with (root/'analysis/logs'/f'{category}.log').open('w') as log:
  run=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT)
 # FFDec adds category subdirectories. Remove that wrapper without flattening packages.
 for item in list(stage.iterdir()):
  if item.is_dir():
   for child in list(item.iterdir()):
    target=dest/child.name
    if target.exists(): raise RuntimeError(f'Export collision: {target}')
    shutil.move(str(child),target)
   item.rmdir()
  else:
   target=dest/item.name
   if target.exists(): raise RuntimeError(f'Export collision: {target}')
   shutil.move(str(item),target)
 stage.rmdir()
 result={'category':category,'directory':directory,'exit_code':run.returncode,'seconds':round(time.time()-start,2),'files':sum(p.is_file() for p in dest.rglob('*'))}
 results.append(result);(root/'analysis/export_results.json').write_text(json.dumps(results,indent=2))
 print(result,flush=True)
assert sha(src)==before
assert sha(root/'original'/name)==before==sha(root/'working'/name)
print('All categories attempted; original and working checksums verified.',flush=True)
