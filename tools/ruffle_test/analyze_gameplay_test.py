#!/usr/bin/env python3
"""Tóm tắt console.log của run_gameplay_test.py thành bảng theo nhân vật/chiêu.

Mỗi chiêu: các nhãn frame P1 đã đi qua, máu P2 mất, P1 có về lại 站立 không, lỗi AS3.
Pha AI: các nhãn tấn công của máy, máu P1 mất. Dùng: analyze_gameplay_test.py OUT_DIR
"""
import json
import re
import sys
from pathlib import Path

EXPECT = {'J': '砍1', 'JJJJ': '砍2', 'JMASH': '砍2', 'SJ': '砍技1', 'WJ': '砍技2', 'U': '招1', 'SU': '招2', 'WU': '招3',
          'K': '跳', 'KJ': '跳砍', 'KU': '跳招', 'L': '瞬步', 'KI': '空中必杀', 'I': '必杀', 'WI': '上必杀', 'SI': '超必杀'}
IDLE = '站立'
ATTACK_STATES = {'10', '11', '12', '13'}
TICK = re.compile(r' GT (\S+) (\S+) a=(\S*)/(-?\d+) b=(\S*)/(-?\d+) ahp=(-?\d+) bhp=(-?\d+)')
ERR = re.compile(r'Error #(\d+)')

out = Path(sys.argv[1])
result = {}
cur = None
for raw in (out / 'console.log').read_text(errors='replace').split('\n'):
    line = re.sub(r'%c|color:.*', '', raw)
    if line.startswith('PY_ACTION'):
        _, fid, name = line.split()[:3]
        cur = None if name == 'END' else result.setdefault(fid, {'actions': {}, 'ai': None})['actions'].setdefault(
            name, {'labels': [], 'bhp': [], 'states': set(), 'errors': []})
        continue
    if line.startswith('PY_AI'):
        parts = line.split()
        cur = None if len(parts) > 2 else result.setdefault(parts[1], {'actions': {}, 'ai': None})
        if cur is not None:
            cur['ai'] = {'labels': [], 'ahp': [], 'states': set(), 'errors': []}
            cur = cur['ai']
        continue
    if cur is None:
        continue
    m = TICK.search(line)
    if m:
        a_label, a_state = m.group(3), m.group(4)
        if 'ahp' in cur:
            cur['labels'].append(m.group(5))
            cur['states'].add(m.group(6))
            cur['ahp'].append(int(m.group(7)))
        else:
            cur['labels'].append(a_label)
            cur['states'].add(a_state)
            cur['bhp'].append(int(m.group(8)))
        continue
    e = ERR.search(line)
    if e or 'ERROR' in line:
        cur['errors'].append(line.strip()[:160])


def uniq(seq):
    seen = []
    for x in seq:
        if not seen or seen[-1] != x:
            seen.append(x)
    return seen


summary = {}
for fid, data in result.items():
    rows = {}
    for name, a in data['actions'].items():
        labels = uniq(a['labels'])
        damage = (max(a['bhp']) - min(a['bhp'])) if a['bhp'] else 0
        rows[name] = {
            'labels': labels[:12],
            'expected_seen': any(l.startswith(EXPECT[name]) for l in labels),
            'damage': damage,
            'back_to_idle': bool(labels) and labels[-1] in (IDLE, '落地', '走'),
            'errors': [x for x in a['errors'] if '#1006' not in x][:3],
            'err1006': sum('#1006' in x for x in a['errors']),
        }
    ai = data['ai'] or {'labels': [], 'ahp': [], 'states': set(), 'errors': []}
    ai_labels = uniq(ai['labels'])
    summary[fid] = {'actions': rows, 'ai': {
        'attack_labels': sorted(set(l for l in ai_labels if l not in (IDLE, '走', '跳', '跳中', '落', '落地', '起跳', '防御', '被打'))),
        'p1_damage_taken': (max(ai['ahp']) - min(ai['ahp'])) if ai['ahp'] else 0,
        'attack_states_seen': bool(ai['states'] & ATTACK_STATES),
        'errors': [x for x in ai['errors'] if '#1006' not in x][:3]}}

(out / 'summary.json').write_text(json.dumps(summary, ensure_ascii=False, indent=1))
for fid, s in summary.items():
    bad = [n for n, r in s['actions'].items() if not r['expected_seen'] or not r['back_to_idle'] or r['errors']]
    print('%-16s ok=%2d/%d  ai_attacks=%d p1_dmg=%d  issues: %s' % (
        fid, len(s['actions']) - len(bad), len(s['actions']), len(s['ai']['attack_labels']), s['ai']['p1_damage_taken'],
        ', '.join('%s(%s%s%s)' % (n, '' if s['actions'][n]['expected_seen'] else 'noanim ',
                                   '' if s['actions'][n]['back_to_idle'] else 'stuck:' + s['actions'][n]['labels'][-1] + ' ' if s['actions'][n]['labels'] else 'nolog ',
                                   'err' if s['actions'][n]['errors'] else '') for n in bad)))
