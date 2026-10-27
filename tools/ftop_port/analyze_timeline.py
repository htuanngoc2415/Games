#!/usr/bin/env python3
"""Đọc dump JPEXS (-dumpSWF) và script AS2 đã export của một fighter FTOP,
xuất JSON mô tả timeline của sprite hành động: nhãn, frame script, clip action
cùng khoảng frame mà clip đó tồn tại."""
import json
import os
import re
import sys

TAG_RE = re.compile(r'^[0-9a-f]{8}:(\s+\d+)\. (\w+)(?: \((.*?)\))?')


def parse_sprite(dump_lines, chid):
    start = next(i for i, l in enumerate(dump_lines) if re.search(r'DefineSprite \(chid: %s\)' % chid, l))
    frame = 1
    events = []
    for line in dump_lines[start + 1:]:
        m = TAG_RE.match(line)
        if not m:
            continue
        if len(m.group(1)) <= 5:
            break
        tag, args = m.group(2), m.group(3) or ''
        if tag == 'ShowFrame':
            frame += 1
            continue
        ev = {'frame': frame, 'tag': tag}
        for key, val in re.findall(r'(\w+): ("[^"]*"|-?\d+)', args):
            ev[key] = val.strip('"') if val.startswith('"') else int(val)
        events.append(ev)
    return frame - 1, events


def read_scripts(script_dir, chid):
    base = os.path.join(script_dir, 'DefineSprite_%s' % chid)
    frame_scripts, clip_actions = {}, {}
    if not os.path.isdir(base):
        return frame_scripts, clip_actions
    for name in os.listdir(base):
        frame = int(name.split('_')[1])
        fdir = os.path.join(base, name)
        for entry in os.listdir(fdir):
            path = os.path.join(fdir, entry)
            if entry == 'DoAction.as':
                frame_scripts[frame] = open(path, encoding='utf-8').read()
            elif os.path.isdir(path):
                m = re.match(r'PlaceObject\d?_(\d+)_(\d+)', entry)
                handlers = {}
                for h in os.listdir(path):
                    ev = re.search(r'onClipEvent\((\w+)\)', h).group(1)
                    handlers[ev] = open(os.path.join(path, h), encoding='utf-8').read()
                clip_actions[(frame, int(m.group(2)))] = {'chid': int(m.group(1)), 'handlers': handlers}
    return frame_scripts, clip_actions


def main():
    dump_path, script_dir, chid, out = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]
    lines = open(dump_path, encoding='utf-8', errors='replace').read().split('\n')
    total, events = parse_sprite(lines, chid)
    frame_scripts, clip_actions = read_scripts(script_dir, chid)
    labels = [{'frame': e['frame'], 'name': e['name']} for e in events if e['tag'] == 'FrameLabel']

    # Khoảng tồn tại của mỗi clip có clip action: tới khi depth bị xoá hoặc bị đặt character khác.
    clips = []
    for (frame, depth), info in sorted(clip_actions.items()):
        end = total + 1
        for e in events:
            if e['frame'] <= frame or e.get('dpt') != depth:
                continue
            if e['tag'] == 'RemoveObject2' or (e['tag'].startswith('PlaceObject') and 'chid' in e):
                end = e['frame']
                break
        clips.append({'start': frame, 'end': end, 'depth': depth, **info})

    named = [{'frame': e['frame'], 'depth': e['dpt'], 'chid': e.get('chid'), 'name': e['nm']}
             for e in events if e['tag'].startswith('PlaceObject') and 'nm' in e]
    json.dump({'sprite': int(chid), 'totalFrames': total, 'labels': labels,
               'frameScripts': {str(k): v for k, v in sorted(frame_scripts.items())},
               'clips': clips, 'named': named}, open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    print('frames=%d labels=%d scripts=%d clips=%d named=%d' % (total, len(labels), len(frame_scripts), len(clips), len(named)))


if __name__ == '__main__':
    main()
