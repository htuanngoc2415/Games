#!/usr/bin/env python3
"""Publish conservative status: compiled/packaged is not the same as gameplay complete."""
import json,re
from pathlib import Path
from prepare_roster import PROJECT
rows=json.loads((PROJECT/'analysis/roster_verification.json').read_text())
manifest_path=PROJECT/'analysis/port_manifest.json'
manifest=json.loads(manifest_path.read_text())
byid={r['id']:r for r in rows}
runtime_path=PROJECT/'analysis/roster_runtime_verification.json'
runtime=json.loads(runtime_path.read_text()) if runtime_path.exists() else {}
smoke={r['id']:r for r in runtime.get('fighters', [])}
body_count=sum(bool(r.get('body_present_at_idle')) for r in smoke.values())
for f in manifest['fighters']:
 r=byid[f['id']]
 f['target_swf']='assets/fighter/ported/'+f['id']+'.swf'
 f['status']='playable' if f['id']=='ftop_natsu' else 'timeline_ported'
 f['notes']='AVM2 compiled, source art/audio preserved, registered in BVN. Full gameplay acceptance pending; see roster_port_status_vi.md.'
 f['translation_warning_count']=len(r['translation_warnings'])
 f['build_verified']=True
 f['runtime_verified']=f['id']=='ftop_natsu'
 f['runtime_smoke_completed']=smoke.get(f['id'],{}).get('sweep_completed',False)
manifest_path.write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n')
lines=['# Bản chuyển toàn bộ roster FTOP sang BVN — 2026-10-26','',
'Đã tạo đủ 25 SWF AS3 (Natsu hiện có + 24 nhân vật mới), nhúng vào `working/anime_crossover_bvn.swf`. Đây là bản tích hợp để kiểm thử; 24 nhân vật mới chưa đạt đủ toàn bộ tiêu chí `playable` của bàn giao.','',
'## Kết quả đã kiểm chứng','',
'- Cờ AVM2, bytecode AS3 và nhãn hành động bắt buộc của đủ 25 SWF.',
'- Giữ nguyên byte của các tag hình ảnh, hình dạng, morph và âm thanh nguồn; không rasterize animation.',
'- Mỗi nhân vật có config riêng, HitVO từ `gjl1`, âm thanh trúng đòn/KO, portrait và cut-in gốc.',
'- Adapter `FighterMC.as` đọc hitbox động và quản lý stop/loop của timeline con FTOP. Các fighter không có cờ port dùng nhánh BVN cũ. Tên hitbox logic tránh Error #2078 của AS3.',
'- 25 nhân vật có đường chọn; 102 SWF BVN gốc còn nguyên byte trong ZIP.',
'- Năm kiểm thử chuyển đổi chạy qua, gồm hai viên đạn Gray cùng frame và giữ điều kiện của nhánh combo.','',
'## Cách chạy và chọn','',
'Chạy `bash games/anime_crossover_bvn/play.sh` từ thư mục workspace. Bản Ruffle dùng lớp vỏ kiểm thử để bỏ phụ thuộc host cũ. `working/anime_crossover_bvn.swf` vẫn dùng lớp vỏ phát hành ban đầu.','',
'Bố cục 7 hàng x 12 cột: Bleach/Naruto ở 4 hàng đầu, Fairy Tail và khách Kenshin hàng 5, One Piece hàng 6–7. Năm ô random ở phải hàng 7: Bleach, Naruto, Fairy Tail, One Piece, tất cả. 25 FTOP hiện trực tiếp; biến thể BVN giữ moreFighter. Xem `selection_random_status_vi.md`.','',
'## Mức độ hoàn thiện theo nhân vật','',
'Không có cảnh báo dịch không có nghĩa là đã kiểm chứng đủ gameplay. Các nhãn nhảy/ngã suy ra từ mốc source vẫn cần kiểm tra trực quan.','',
'| Nhân vật | ID | Cảnh báo dịch còn lại |','|---|---|---:|']
for r in rows:
 cfg=json.loads((PROJECT/'ports'/(r['id']+'.json')).read_text())
 lines.append(f"| {cfg['displayName']} | `{r['id']}` | {len(r['translation_warnings'])} |")
if runtime.get('done'):
 lines += ['', '## Runtime smoke test', '', f"Đã nạp {runtime['fighter_count']} nhân vật, mỗi nhân vật hai bản sao, và chạy chuỗi 15 nhãn hành động (bỏ qua nhãn nguồn không có). Ghi nhận vùng thân lúc đứng ở {body_count}/{runtime['fighter_count']} nhân vật. Các hướng được luân phiên. Chi tiết, hash bản thực sự đã chạy, hành động đã thử và lỗi theo từng nhân vật ở `roster_runtime_verification.json`.", '', 'Còn Error #1006 của Ruffle lúc dọn đối tượng. Bản sửa tên hitbox đã được chạy lại; không coi hoàn tất chuỗi hành động là xác nhận mọi chiêu đúng.']
lines += ['', '## Giới hạn cần xử lý tiếp','',
'- Những lệnh nguồn chưa ánh xạ được ghi trong `build/port/<id>/as3/report.txt`; chi tiết tổng hợp trong `roster_verification.json`.',
'- Đã bổ sung clip dò trúng và hiệu ứng bám đối thủ của Robin, cờ `kihit` của Luffy-2Y và clip đặt theo khoảng cách của Doflamingo. Các hành vi này vẫn cần kiểm chứng bằng trận đấu đầy đủ.',
'- Bốn callback `wankai` cũ chưa ánh xạ: Buggy, Crocodile, Luffy, Zoro. Đã kiểm tra: chính SWF nguồn của cả bốn chỉ có một frame gốc và không có nhãn `万解`; đây là callback engine cũ không có timeline đích trong bộ nguồn hiện tại. Các phiên bản Luffy/Zoro/Sanji vẫn chọn riêng được.',
'- Cần kiểm tra từng tuyệt chiêu đến hết animation, hồi trạng thái, AI, cooldown độc lập, KO/reset, lượng sát thương và hai hướng trên Flash Player/Ruffle. Smoke test cưỡng bức hành động không xác nhận các điều kiện này.',
'- Ruffle hiện có hạn chế `stopAllMovieClips()` gây Error #1006 lúc dọn fighter/đạn; Canvas thiếu BitmapData.draw, còn renderer GPU phần mềm có thể lỗi. Log runtime được giữ trong `build/roster_runtime*`.','',
'## Tái tạo','', '```bash',
'python3 tools/ftop_port/prepare_roster.py',
'python3 tools/ftop_port/register_roster_assets.py',
'python3 tools/ftop_port/refine_projectiles.py',
'python3 tools/ftop_port/refine_effects.py',
'python3 tools/ftop_port/build_roster.py',
'bash games/anime_crossover_bvn/build_gameplay.sh',
'python3 tools/ftop_port/test_conversion.py',
'python3 tools/ftop_port/verify_roster.py',
'python3 tools/ftop_port/update_status.py',
'```','',
'Không đánh dấu toàn bộ roster là `playable` chỉ dựa trên việc compile hoặc chạy smoke test.']
(PROJECT/'analysis/roster_port_status_vi.md').write_text('\n'.join(lines)+'\n')
print('Updated conservative port manifest and Vietnamese status report.')
