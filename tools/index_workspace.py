from pathlib import Path
import json,hashlib,re,collections
r=(Path(__file__).resolve().parents[1] / 'games/bleach_vs_naruto_3.5');a=r/'analysis';s=r/'extracted/scripts';b=s/'net/play5d/game/bvn'
def files(p):return sorted(x for x in p.rglob('*') if x.is_file())
def tree(p,depth=20,prefix=''):
 out=[str(p.relative_to(r))+'/']
 def walk(d,level):
  for x in sorted(d.iterdir()):
   if x.is_dir():
    out.append('  '*level+x.name+'/')
    if level<depth:walk(x,level+1)
   elif p==b or (p==r and level==1):out.append('  '*level+x.name)
 walk(p,1);return '\n'.join(out)+'\n'
(a/'scripts_tree.txt').write_text(tree(b))
(a/'bvn_script_files.txt').write_text(''.join(str(p.relative_to(s))+'\n' for p in sorted(b.rglob('*.as'))))
(a/'all_script_files.txt').write_text(''.join(str(p.relative_to(s))+'\n' for p in sorted(s.rglob('*.as'))))
sections={'Core Game Logic':['ctrl','ctrl/game_ctrls','factory','events','interfaces'],'Fighter / Combat':['fighter','fighter/ctrler','fighter/models','fighter/events','fighter/utils','fighter/vos'],'AI':['fighter/ctrler/ai'],'Character Data':['data','data/mosou'],'Input':['input'],'Game State':['state'],'UI':['ui','ui/fight','views'],'Map / Stage':['map','ui/bigmap','ctrl/game_stage_loader']}
text='# Important paths\n\nAll paths are relative to the workspace root.\n'
for title,paths in sections.items():
 text+='\n# '+title+'\n\n'+''.join('- `'+str((b/p).relative_to(r))+'/`\n' for p in paths if (b/p).is_dir())
text+='\n# Assets\n\n- `extracted/binary/unpacked/assets/`: archive contents with original paths, including character/stage SWFs, audio and configuration.\n- `extracted/binary/*.bin`: untouched embedded payloads (12 SWFs and one ZIP).\n- `extracted/{images,sprites,shapes,morphshapes,sounds,fonts,texts,videos,frames}/`: top-level exports and `embedded/` exports.\n- `analysis/embedded_exports.json`: embedded SWF input-to-output mapping.\n\n# Unknown / Obfuscated Packages\n\nSee `analysis/obfuscated_content.txt`. Unicode identifiers are preserved.\n'
(a/'important_paths.md').write_text(text)
susp=[]
for d in sorted(s.iterdir()):
 if d.is_dir() and (len(d.name)==1 or not d.name.isascii()):
  fs=list(d.rglob('*.as'));susp.append(f'{d.relative_to(r)}: {len(fs)} files; examples: '+', '.join(str(p.relative_to(s)) for p in fs[:3]))
generated=[]
for p in s.rglob('*.as'):
 if not p.is_relative_to(s/'embedded') and (re.search(r'script_\d+',p.name,re.I) or 'ByteArray' in p.name or '$' in p.name):generated.append(str(p.relative_to(s)))
(a/'obfuscated_content.txt').write_text('Suspicious top-level packages (heuristic, no renaming):\n'+'\n'.join(susp)+'\n\nUnicode packages may be obfuscated support/game code; role is unconfirmed.\n\nGenerated/embedded-resource name candidates: '+str(len(generated))+'\n'+'\n'.join(generated)+'\n\nByteArray and hashed names appear to represent embedded assets. Single-character Unicode packages suggest obfuscation; no deep gameplay analysis performed.\n')
(a/'search_terms.txt').write_text('\n'.join('hp health maxHp damage attack defence defense hit hurt energy chakra power skill cooldown combo stun knockback speed move jump round timer win lose gameOver death ai fighter player'.split())+'\n')
stats={}
for d in sorted((r/'extracted').iterdir()):
 if d.is_dir():
  fs=files(d);stats[d.name]={'files':len(fs),'bytes':sum(p.stat().st_size for p in fs)}
(a/'statistics.json').write_text(json.dumps(stats,indent=2))
results=json.loads((a/'export_results.json').read_text());embedded=json.loads((a/'embedded_exports.json').read_text())
report='# Export report\n\nJPEXS FFDec 26.3.0; Java 21. Source: Flash v19 with DoABC2 tags (ActionScript 3).\n\n## Main SWF exports\n\n| Category | Exit | Files at export | Notes |\n|---|---:|---:|---|\n'
for row in results:
 note='Headless retry succeeded; see frame_retry.log.' if row['category']=='frame' else ('No matching resources in main SWF.' if row['files']==0 else 'Export completed.')
 report+=f"| {row['category']} | {row['exit_code']} | {row['files']} | {note} |\n"
report+='\n## Embedded assets\n\nThe ZIP is retained byte-for-byte in binary/ and unpacked with original filenames under binary/unpacked/. Its inventory is archive_files.txt. Embedded SWFs are exported separately; mapping and individual exit codes are in embedded_exports.json. Sprite and frame exports use SVG to preserve vector detail and avoid unnecessary raster expansion.\n\n'
report+=f'Embedded SWFs attempted: {len(embedded)}; nonzero exits: {sum(x["exit_code"]!=0 for x in embedded)}.\n\n## Final directory statistics\n\n| Directory | Files | Bytes |\n|---|---:|---:|\n'
for d,v in stats.items():report+=f'| {d} | {v["files"]} | {v["bytes"]} |\n'
issues=[]
for log in sorted((a/'logs').glob('*.log')):
 lines=[line.strip() for line in log.read_text(errors='replace').splitlines() if re.search(r'\b(?:error|exception|failed|timeout|uncaughtException)\b',line,re.I)]
 if lines: issues.append(str(log.relative_to(r))+': '+ ' | '.join(lines[:8]))
(a/'export_warnings.txt').write_text('\n'.join(issues)+'\n')
report+='\nWarnings/error indicators are inventoried in export_warnings.txt; these include the initial X11 frame failure.\n'
report+='\nBinary resources directly embedded in the main SWF: 13. Binary directory file statistics also include unpacked archive members. Sprite file counts count rendered SVG timeline frames, not unique sprite symbols.\n'
report+='\nNo unsupported requested categories. Empty categories reflect missing matching tags. Logs are retained under analysis/logs; ignore-on-error permits subsequent resources to export, so warnings in these logs remain relevant. Root SWF is retained in addition to verified original and working copies. The preexisting script export is preserved in extracted/misc/preexisting_script_export. No gameplay code was patched.\n'
(a/'export_report.md').write_text(report)
(a/'notes.md').write_text('# Notes\n\nScope: extraction, organization and indexing only. No identifier renaming, deobfuscation, SWF modification or gameplay patching.\n\nThe main export contains 413 AS3 files with package structure preserved. Embedded scripts are separated by resource ID under scripts/embedded/. Exported assets are representations, not a buildable original Flash project. Raw embedded SWFs and the asset ZIP remain available for future inspection.\n\nFFDec uses a writable project-local user.home; headless mode resolves the unavailable X11 display. Initial frame failure and successful retry logs are retained. Existing exports and installer were preserved.\n')
structure='Workspace directories (assets limited to three levels):\n'+tree(r,3)+'\nMain BVN package (all files):\n'+tree(b)
(a/'structure.txt').write_text(structure)
warning='The files under extracted/scripts are decompiled ActionScript reconstructed from the SWF. They should be treated as reverse-engineered source, not as the original development project.'
(r/'README.md').write_text('# Bleach vs Naruto 3.5 reverse-engineering workspace\n\nUntouched game: `original/bleach_vs_naruto_3.5.swf`. Separate editable copy: `working/bleach_vs_naruto_3.5.swf`. The root input is also retained. SHA256 records and verification are in `analysis/`.\n\nDecompiled AS3: `extracted/scripts/`; core package: `extracted/scripts/net/play5d/game/bvn/`. Visual/audio exports have separate category directories; embedded SWF exports are under their `embedded/` subdirectories. Original embedded payloads and unpacked archive contents are in `extracted/binary/`.\n\nReports, path guides, inventories, statistics and logs: `analysis/`. Future patches: `patches/`. Export/index utilities and the existing FFDec installer: `../../tools/`.\n\n'+warning+'\n\nOpen the working SWF in JPEXS on a machine with a graphical display:\n\n```bash\nffdec working/bleach_vs_naruto_3.5.swf\n```\n\nBasic CLI export (FFDec adds its own scripts directory):\n\n```bash\njava -Djava.awt.headless=true -Duser.home="$PWD/../../tools/ffdec-home" -jar /usr/share/java/ffdec/ffdec-cli.jar -onerror ignore -export script /tmp/bvn-export original/bleach_vs_naruto_3.5.swf\n```\n\n`../../tools/export_workspace.py` and `../../tools/export_embedded.py` record the commands used; these first-run extraction tools deliberately reject collisions and should not be rerun over existing exports. `python3 ../../tools/index_workspace.py` refreshes indexes after extraction.\n')
name='bleach_vs_naruto_3.5.swf'
def sha(p):return hashlib.file_digest(p.open('rb'),'sha256').hexdigest()
expected=(a/'original_sha256_before.txt').read_text().split()[0]
checks={str(p.relative_to(r)):sha(p) for p in [r/name,r/'original'/name,r/'working'/name]}
assert all(h==expected for h in checks.values())
assert len(list(b.rglob('*.as')))>0
assert all(p.stat().st_size>0 for p in s.rglob('*.as'))
assert all((r/'extracted'/d).is_dir() for d in ['scripts','images','sprites','shapes','morphshapes','sounds','fonts','texts','videos','binary','frames','misc'])
(a/'verification.json').write_text(json.dumps({'sha256_before':expected,'sha256_after':checks,'scripts_nonempty':True,'major_directories_exist':True},indent=2))
print(json.dumps(stats,indent=2));print('Verified SHA256:',expected)
