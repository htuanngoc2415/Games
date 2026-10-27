#!/usr/bin/env python3
"""Package converted assets separately from the original games and test harness."""
import hashlib
import json
from pathlib import Path
import zipfile
from prepare_roster import PROJECT
verification=json.loads((PROJECT/'analysis/roster_verification.json').read_text())
checks={r['id']:r['sha256'] for r in verification}
output=PROJECT/'dist/ftop_bvn_as3_roster_preview.zip'
output.parent.mkdir(exist_ok=True)
with zipfile.ZipFile(output,'w',zipfile.ZIP_DEFLATED,compresslevel=6) as z:
 added=set()
 def add(source,target):
  if target not in added:
   z.write(source,target);added.add(target)
 for path in sorted((PROJECT/'ports').glob('*.json')):
  cfg=json.loads(path.read_text());fid=cfg['id'];reg=cfg['register']
  swf=PROJECT/cfg['output']
  assert hashlib.sha256(swf.read_bytes()).hexdigest()==checks[fid],fid+' is not the verified build'
  add(swf,'assets/fighter/'+fid+'.swf')
  add(path,'ports/'+path.name)
  for suffix in ('','_b','_m','_w'):
   add(PROJECT/(reg['faces']+suffix+'.png'),'assets/face/'+fid+suffix+'.png')
  for face in cfg.get('bishaFaces',{}).values():add(PROJECT/face,'cutins/'+Path(face).name)
  if reg['bgm'].get('file'):add(PROJECT/reg['bgm']['file'],'assets/'+reg['bgm']['url'])
 for fid in ('random_fairy_tail','random_one_piece'):add(PROJECT/('assets/face/ported/'+fid+'.png'),'assets/face/'+fid+'.png')
 add(PROJECT/'assets/config/crossover_select.json','config_source/crossover_select.json')
 for cls in ('data/FighterModel.as','ctrl/GameLogic.as'):add(PROJECT/'extracted/scripts/net/play5d/game/bvn'/cls,'patches/scripts/net/play5d/game/bvn/'+cls)
 for name in ('fighter.xml','select.xml'):add(PROJECT/'build/ziproot/assets/config'/name,'assets/config/'+name)
 add(PROJECT/'extracted/scripts/net/play5d/game/bvn/fighter/FighterMC.as','patches/scripts/net/play5d/game/bvn/fighter/FighterMC.as')
 add(PROJECT/'analysis/roster_verification.json','analysis/roster_verification.json')
 for name in ('selection_random_status_vi.md','selection_random_verification.json','random_icons_prompts.json'):
  if (PROJECT/'analysis'/name).exists():add(PROJECT/'analysis'/name,'analysis/'+name)
 if (PROJECT/'analysis/roster_runtime_verification.json').exists():add(PROJECT/'analysis/roster_runtime_verification.json','analysis/roster_runtime_verification.json')
 add(PROJECT/'analysis/roster_port_status_vi.md','analysis/roster_port_status_vi.md')
 z.writestr('README_VI.txt','''BỘ FTOP -> BVN 3.5 AS3 (BẢN TÍCH HỢP ĐỂ KIỂM THỬ)

25 nhân vật: Natsu + 24 bản mới. SWF đã là AVM2; không dùng SWF AS2 nguồn.
assets/ chứa fighter, portrait, nhạc và hai XML roster kết hợp với BVN 3.5.
Cần import cả ba class trong patches/scripts/ vào engine BVN. FighterModel và
GameLogic sửa nhóm random/biến thể. FighterMC cập nhật
hitbox động và stop/loop timeline con FTOP. Không áp dụng nhánh mới cho fighter
BVN gốc. build_gameplay.sh trong workspace tự nhúng cả adapter này.

Các file này cần được nhúng vào ZIP tài nguyên của game BVN; chép cạnh file
SWF chính không đủ. Trong workspace dùng build_gameplay.sh để nhúng.

Gói này không chứa engine, stage hay fighter BVN gốc và không tự chạy độc lập.
Config/XML dành cho đúng bộ BVN 3.5 của dự án; với mod khác cần merge theo ID,
không thay mù roster khác. Cut-in đã nhúng trong từng SWF, cutins/ chỉ là nguồn.

Bố cục 7 hàng x 12 cột: BVN ở 4 hàng đầu, Fairy Tail + Kenshin hàng 5,
One Piece hàng 6-7. Năm ô random ở bên phải hàng 7. Random chung
có đủ 90 fighter/biến thể của bốn truyện; không bốc NPC hoặc ô random.

Còn bốn callback wankai nguồn chưa nối với biến hình BVN. Các form riêng vẫn
chọn được. Kiểm tra cấu trúc và smoke test không thay thế nghiệm thu mọi chiêu,
AI, KO/reset và cân bằng sát thương. Xem analysis/roster_port_status_vi.md.
''')
print(output)
print('sha256',hashlib.sha256(output.read_bytes()).hexdigest())
