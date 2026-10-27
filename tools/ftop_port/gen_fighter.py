#!/usr/bin/env python3
"""Sinh class AS3 theo chuẩn fighter BVN và kế hoạch chuyển SWF cho một fighter FTOP.

Đầu vào: cấu hình port (ports/<id>.json), timeline.json của analyze_timeline.py,
script AS2 gốc của frame 1 (bảng gjl1) và dump JPEXS. Đầu ra: thư mục chứa file .as,
plan.json cho SwfAs2ToAs3 và report.txt liệt kê lệnh AS2 không dịch được.
"""
import json
import os
import re
import sys
from frame_translation import translate_stateful

INPUT_SETTERS = {
    'nornalhit': 'setAttack', 'skill1': 'setSkill1', 'skill2': 'setSkill2',
    'magichit1': 'setZhao1', 'magichit2': 'setZhao2', 'magichit3': 'setZhao3',
    'bisha': 'setBisha', 'bishaUP': 'setBishaUP', 'bishaSuper': 'setBishaSUPER',
    'bishaAir': 'setBishaAIR', 'airMagichit': 'setSkillAIR', 'airhit': 'setAttackAIR',
    'jump': 'setJump', 'rush': 'setDash', 'dohide': 'setDash', 'magichit': 'setZhao1',
}
# Hàm của engine FTOP; BVN tự xử lý các việc này.
ENGINE_CALLS = {'doAllAction', 'onJumping', 'beida', 'fangyu', 'fangyux', 'beidax', 'onDefence',
                'doStand', 'standup', 'defence', 'gameRunning'}
IGNORED_VARS = {'jump', 'jumped', 'khit', 'hits', 'bs', 'kcplayed', '动作', 'time', 'beida', 'hited'}


def parse_gjl(src):
    hits = {}
    for key, suffix, value in re.findall(r'gjl1\.(\w+?)(pw|zl|up|x|tm|dz) = ("?[^;"]*"?);', src):
        hits.setdefault(key, {})[suffix] = value.strip('"')
    return hits


def as3_literal(value):
    if isinstance(value, bool):
        return 'true' if value else 'false'
    if isinstance(value, (int, float)):
        return fmt(value)
    if isinstance(value, dict):
        return '{' + ','.join('"%s":%s' % (k, as3_literal(v)) for k, v in value.items()) + '}'
    return json.dumps(value, ensure_ascii=False)


def hit_vo(key, data, types):
    zl = float(data.get('zl', 0))
    heavy = zl >= types['heavyFrom']
    is_skill = not re.match(r'^(k\d|tk|tz)', key)
    if is_skill:
        hit_type = types['skillHeavy'] if heavy else types['skill']
    else:
        hit_type = types['normalHeavy'] if heavy else types['normal']
    return {
        'power': float(data.get('pw', 0)),
        'hitType': hit_type,
        'hitx': float(data.get('x', 0)),
        'hity': -float(data.get('up', 0)),
        'hurtTime': float(data.get('tm', 0)),
        'hurtType': 1 if data.get('dz') == '击飞' else 0,
        'isBreakDef': zl > 10,
    }


def eval_speed(expr, speed):
    expr = expr.strip()
    uses_speed = '_parent.speed' in expr
    value = eval(expr.replace('_parent.speed', str(speed)), {'__builtins__': {}})
    return float(value), uses_speed


class Generator:
    def __init__(self, cfg, timeline, gjl_src):
        self.cfg = cfg
        self.tl = timeline
        for rename in cfg.get('extraRenames', []):
            if rename['sprite'] == cfg['actionSprite']:
                self.tl['named'].append({'frame':rename['frame'], 'depth':rename['depth'], 'name':rename['name']})
        self.hits = parse_gjl(gjl_src)
        self.code = {}
        self.warnings = []
        labels = dict((l['name'], l['frame']) for l in timeline['labels'])
        for name in cfg['labels']['remove']:
            labels.pop(name, None)
        labels.update(cfg['labels']['add'])
        self.labels = sorted((f, n) for n, f in labels.items())

    def section(self, frame):
        current = None
        for f, name in self.labels:
            if f > frame:
                break
            current = name
        return current

    def emit(self, frame, line, first=False):
        lines = self.code.setdefault(frame, [])
        if line in lines:
            return
        lines.insert(0, line) if first else lines.append(line)

    def windows_at(self, frame):
        return [w for w in self.windows if w[0] <= frame < w[1]]

    def translate_frame_script(self, frame, src):
        sec = self.section(frame)
        if sec in self.cfg['engineSections']:
            return
        if '_parent.gjl1.zh1dz' in src:
            self.emit(frame, 'if(fc.hitModel.getHitVO("zh1")) fc.hitModel.getHitVO("zh1").hurtType = (fc.getTargetState() >= 21 && fc.getTargetState() <= 24) ? 1 : 0;')
            return
        stateful = translate_stateful(src)
        if stateful is not None:
            self.emit(frame, stateful)
            return
        m = re.search(r'_root\.showFace\(pn,"([^"]+)"\)', src)
        face = ',"%s"' % m.group(1) if m and m.group(1) in self.cfg.get('bishaFaces', {}) else ''
        for stmt in [s.strip() for s in re.split(r';\s*', ' '.join(src.split())) if s.strip()]:
            m = re.match(r'gotoAndStop\("([^"]+)"\)$', stmt)
            if m:
                target = m.group(1)
                if sec == self.cfg['walk']['label']:
                    continue
                if target == self.cfg['idle']['label'] and sec == self.cfg['idle']['label']:
                    self.emit(frame, 'c.loop("%s");' % target)
                elif target in (self.cfg['idle']['label'], '落', '落2'):
                    self.emit(frame, 'c.idle();')
                else:
                    self.emit(frame, 'c.loop("%s");' % target)
                continue
            if stmt == 'play()':
                continue
            if stmt == 'stop()':
                self.emit(frame, 'c.stop();')
                continue
            m = re.match(r'ql \+= (\d+)$', stmt)
            if m:
                self.emit(frame, 'c.addQi(%s);' % m.group(1))
                continue
            if re.match(r'ql -= \d+$', stmt):
                continue
            if stmt == '动作 = 0':
                self.end_act_frames.append(frame)
                continue
            m = re.fullmatch(r'var (_flyN|_flowerHit|kihit) = (false|true|\d+)', stmt)
            if m:
                self.emit(frame, 'this.%s = %s;' % m.groups())
                continue
            m = re.match(r'(\w+|动作) = ', stmt)
            if m and m.group(1) in IGNORED_VARS:
                continue
            m = re.fullmatch(r'_root\.(shine|shake)\(([^)]*)\)', stmt)
            if m:
                self.emit(frame, 'fx.%s(%s);' % (m.group(1), m.group(2)))
                continue
            m = re.fullmatch(r'_parent.moveX\((-?[\d.]+)\)', stmt)
            if m:
                self.emit(frame, 'p.$fighter_ctrler.moveOnce(%s,0);' % m.group(1))
                continue
            if stmt.startswith('_root.blackStg('):
                self.emit(frame, 'fx.bisha(false);')
                continue
            if stmt == '_root.resumeBlackStg()':
                self.emit(frame, 'fx.endBisha();')
                continue
            if re.fullmatch(r'_root.zhanting = (true|false)', stmt):
                continue  # Pausing belongs to the paired BVN bisha effect.
            if re.fullmatch(r'_root._y [+-]= \d+', stmt):
                self.emit(frame, 'fx.shake(0,2);')
                continue
            if stmt == 'updateDirect()':
                self.emit(frame, 'p.$fighter_ctrler.setDirectToTarget();')
                continue
            if re.match(r'_root\.(bsd)\(pn\)$', stmt):
                self.emit(frame, 'fx.bisha(false%s);' % face)
                continue
            if re.match(r'_root\.(cbsd)\(pn\)$', stmt):
                self.emit(frame, 'fx.bisha(true%s);' % face)
                continue
            if re.match(r'_root\.(bsw|cbsw)\(pn\)$', stmt):
                self.emit(frame, 'fx.endBisha();')
                continue
            if re.match(r'_root\.shunbuxg\(', stmt):
                self.emit(frame, 'fx.dash();')
                continue
            if re.match(r'_root\.(showFace|touchFloorEffect|yfgj)\(|_root\._y = ', stmt):
                continue
            if re.match(r'(onBeHit|onBeHit2|beidaStop|onHitDown|onDefence)\(', stmt):
                continue
            self.warnings.append('frame %d [%s] script: %s' % (frame, sec, stmt))

    def translate_clip(self, clip):
        start, end = clip['start'], clip['end']
        sec = self.section(start)
        body = clip['handlers'].get('enterFrame', '')
        flat = ' '.join(body.split())
        if sec in self.cfg['engineSections']:
            return
        named = next((n['name'] for n in self.tl['named'] if n['frame'] == start and n['depth'] == clip['depth']), None)
        if named and '_parent.kihit = true' in body:
            for frame in range(start, end):
                self.emit(frame, 'if(touches(fc,"%s")) this.kihit = true;' % named)
            return
        if not body and clip['handlers'].get('load'):
            load = clip['handlers']['load']
            if named and '_Y = ' in load and '> 250' in load and '< 30' in load:
                self.emit(start, 'if(fc.target && this.getChildByName("%s") && fc.self.y-fc.target.y >= 30) { var dx:Number = (fc.target.x-fc.self.x) * (fc.self.scaleX < 0 ? -1 : 1); if(dx >= -50 && dx <= 250) { this.getChildByName("%s").x = dx; this.getChildByName("%s").y = fc.target.y-fc.self.y; } }' % (named,named,named))
                return
            if named and '_X = ' in load and '_root.game' in load and '> 200' in load:
                self.emit(start, 'if(fc.target && this.getChildByName("%s") && Math.abs(fc.self.x-fc.target.x) <= 200) { this.getChildByName("%s").x = Math.abs(fc.self.x-fc.target.x); }' % (named, named))
                return
        if named and '_parent._flowerHit = 1' in body:
            for frame in range(start, end):
                self.emit(frame, 'if(touches(fc,"%s")) { this._flowerHit = 1; } if(this._flowerHit == 1 && this.zzz && this.zzz.currentFrame == 1) { this.zzz.ftopStopped = false; this.zzz.gotoAndPlay(2); }' % named)
            return
        proximity = re.search(r'Math.abs\([^;]+?\) < (\d+)\)\s*\{\s*_parent.gotoAndPlay\("([^"]+)"\)', flat)
        if proximity:
            for frame in range(start, end):
                self.emit(frame, 'if(fc.target && Math.abs(fc.self.x-fc.target.x) < %s) { c.gotoAndPlay("%s"); return; }' % proximity.groups())
        bare_hit = re.search(r'if\(hitTest\(.*?_parent.gotoAndPlay\("([^"]+)"\)', flat)
        if bare_hit and named:
            self.emit(start, 'c.setHitTarget("%s","%s");' % (named, bare_hit.group(1)))
            for axis, sign, value in re.findall(r'_([XY]) = _[XY] ([+-]) ([\d.]+);', flat):
                for frame in range(start, end):
                    self.emit(frame, 'if(this.getChildByName("%s")) this.getChildByName("%s").%s %s= %s;' % (named, named, axis.lower(), sign, value))
            return
        setters = re.findall(r'if\((\w+)\((?:true)?\)\)\s*\{\s*_parent\.gotoAndPlay\("([^"]+)"\);', flat)
        if setters:
            for func, label in setters:
                if func in INPUT_SETTERS:
                    self.emit(start, 'c.%s("%s");' % (INPUT_SETTERS[func], label))
                else:
                    self.warnings.append('frame %d [%s] input %s -> %s' % (start, sec, func, label))
            self.windows.append((start, end))
            return
        collision = re.search(r'_parent\.(\w+atm)\.hitTest\(.*?_parent.gotoAndPlay\("([^"]+)"\)', flat)
        if collision:
            self.emit(start, 'c.setHitTarget("%s","%s");' % collision.groups())
        release = re.search(r'if\(!hold([UJ])\(\)\)\s*\{\s*_parent.gotoAndPlay\("([^"]+)"\)', flat)
        if release:
            for frame in range(start, end):
                self.emit(frame, 'if(c.getActionCtrler() && !skillHeld(c,%s)) { c.gotoAndPlay("%s"); return; }' % ('true' if release.group(1) == 'J' else 'false', release.group(2)))
            return
        speed = self.cfg['stats']['speed']
        moves_x = re.findall(r'\bmoveX\(([^;]*?)\);', flat)
        moves_y = re.findall(r'\bmoveY\(([^;]*?)\);', flat)
        handled = False
        if moves_x or moves_y:
            vx = sum(eval_speed(e, speed)[0] for e in moves_x)
            vy = -sum(eval_speed(e, speed)[0] for e in moves_y)
            self.emit(start, 'c.move(%s,%s);' % (fmt(vx), fmt(vy)))
            self.emit(start, 'c.damping(0,0);')
            if vy:
                self.vertical_moves.append((start, end))
                self.emit(start, 'c.isApplyG(false);')
                self.emit(end, 'c.isApplyG(true);', first=True)
                self.emit(end, 'c.stopMove();', first=True)
            else:
                # Chỉ hãm trục X để không xoá vận tốc rơi khi đang trên không.
                self.emit(end, 'c.dampingPercent(0.5,0);', first=True)
            handled = True
        m = re.search(r'_parent\.touch == true\)\s*\{\s*_parent\.gotoAndPlay\("([^"]+)"\)', flat)
        if m:
            self.emit(start, 'c.setTouchFloor("%s");' % m.group(1))
            handled = True
        if 'showdow(' in flat:
            m = re.search(r'showdow\(\{R:(\d+)\}\)', flat)
            self.emit(start, 'fx.shadow(%s,0,0);' % (m.group(1) if m else '0'))
            self.emit(end, 'fx.endShadow();', first=True)
            handled = True
        m = re.search(r'onDashing\(([\d.]+)\)', flat)
        if m:
            self.emit(start, 'c.dash(%s);' % m.group(1))
            self.emit(end, 'c.dashStop();', first=True)
            handled = True
        calls = set(re.findall(r'(\w+)\(', flat)) - {'onClipEvent', 'if', 'moveX', 'moveY', 'showdow', 'onDashing', 'gotoAndPlay'}
        if proximity:
            calls.discard('abs')
            handled = True
        if collision:
            calls.discard('hitTest')
            handled = True
        if calls - ENGINE_CALLS or (not handled and not calls & ENGINE_CALLS):
            self.warnings.append('frame %d-%d [%s] clip: %s' % (start, end, sec, flat[:200]))

    def build(self):
        self.windows = []
        self.vertical_moves = []
        self.end_act_frames = []
        bullet_clips = {(b['frame'], b['depth'], b['sprite']) for b in self.cfg['bullets']}
        for clip in self.tl['clips']:
            if (clip['start'], clip['depth'], clip['chid']) in bullet_clips:
                continue
            self.translate_clip(clip)
        for frame, src in self.tl['frameScripts'].items():
            if int(frame) == 1:
                continue
            self.translate_frame_script(int(frame), src)
        for start, end in self.windows:
            if not any(l in self.code.get(end, []) for l in ('c.idle();',)):
                self.emit(end, 'c.endAct();', first=True)
        for frame in self.end_act_frames:
            if not self.windows_at(frame):
                self.emit(frame, 'c.endAct();', first=True)
        for b in self.cfg['bullets']:
            self.emit(b['frame'], 'c.fire("%s",%s);' % (b['name'], as3_literal(b['params'])))
        # Đòn kết thúc (idle) trong lúc clip bay dọc còn tồn tại: dừng lực dọc trước, nếu không
        # nhân vật trôi mãi trên không vì idle() chỉ chuyển sang rơi.
        for frame, lines in self.code.items():
            if 'c.idle();' in lines and any(s <= frame < e for s, e in self.vertical_moves):
                lines.insert(lines.index('c.idle();'), 'c.stopMove();')
        idle_label = self.cfg['idle']['label']
        idle_frame = next(f for f, n in self.labels if n == idle_label)
        self.emit(idle_frame, 'c.getFighterMc().resumeRenderMainAnimate();')
        self.emit(self.cfg['walk']['loopFrame'], 'c.loop("%s");' % self.cfg['walk']['label'])

    def timeline_class(self, name):
        frames = sorted(self.code)
        reg = ','.join('%d,this.f%d' % (f - 1, f) for f in frames)
        out = ['package %s' % self.cfg['package'], '{', '   import flash.display.MovieClip;', '   import flash.utils.getDefinitionByName;', '',
               '   public dynamic class %s extends MovieClip' % name, '   {', '',
               '      public var ftopDynamicHitAreas:Boolean = true;', '      public function %s()' % name, '      {', '         super();',
               '         addFrameScript(%s);' % reg, '      }', '']
        for f in frames:
            out += ['      internal function f%d() : *' % f, '      {',
                    '         var p:* = this.parent;', '         var c:* = p ? p.$mc_ctrler : null;',
                    '         if(!c)', '         {', '            return;', '         }',
                    '         var fx:* = p.$effect_ctrler;', '         var fc:* = p.$fighter_ctrler;']
            out += ['         ' + l for l in self.code[f]]
            out += ['      }', '']
        out += ['      private function touches(fc:*,name:String):Boolean { var box:* = fc.getHitCheckRect(name); var target:* = fc.getTargetSP(); var body:* = target ? target.getBodyArea() : null; return box && body && box.intersects(body); }', '      private function skillHeld(c:*,attack:Boolean = false):Boolean {',
                '         var input:* = c.getActionCtrler();',
                '         if(!input) return false;',
                '         if("inputType" in input) {',
                '            var keys:* = getDefinitionByName("net.play5d.game.bvn.input.GameInputer");',
                '            return attack ? keys.attack(input.inputType,0) : keys.skill(input.inputType,0);',
                '         }',
                '         return attack ? input.attack() : (input.zhao1() || input.zhao2() || input.zhao3());',
                '      }', '   }', '}', '']
        return '\n'.join(out)

    def main_class(self, sound_classes, face_classes):
        cfg = self.cfg
        out = ['package', '{', '   import flash.display.MovieClip;', '',
               '   public dynamic class main_mc extends MovieClip', '   {', '',
               '      public var mc:MovieClip;', '', '      public var $fighter_ctrler:*;', '',
               '      public var $mc_ctrler:*;', '', '      public var $effect_ctrler:*;', '',
               '      public function main_mc()', '      {', '         super();',
               '         addFrameScript(0,this.frame1,1,this.frame2);', '      }', '',
               '      public function initFighter(param1:Object) : void', '      {',
               '         this.$fighter_ctrler = param1.fighter_ctrler;',
               '         this.$mc_ctrler = param1.mc_ctrler;',
               '         this.$effect_ctrler = param1.effect_ctrler;', '      }', '',
               '      internal function frame1() : *', '      {', '         stop();', '      }', '',
               '      internal function frame2() : *', '      {', '         var fc:* = this.$fighter_ctrler;',
               '         if(!fc)', '         {', '            return;', '         }']
        names = set(n['name'][:-3] for n in self.tl['named'] if n['name'].endswith('atm'))
        names |= set(b['name'][:-3] for b in cfg['bullets'])
        for key in sorted(set(self.hits) | names):
            data = next((self.hits[key[:n]] for n in range(len(key), 0, -1) if key[:n] in self.hits), None)
            if not data:
                self.warnings.append('hitbox %satm has no gjl1 data' % key)
                continue
            out.append('         fc.defineAction("%s",%s);' % (key, as3_literal(hit_vo(key, data, cfg['hitTypes']))))
        for kind, method in (('hurt', 'defineHurtSound'), ('hurtFly', 'defineHurtFlySound'), ('die', 'defineDieSound')):
            ids = cfg['sounds'].get(kind, [])
            if ids:
                out.append('         fc.%s(%s);' % (method, ','.join(sound_classes[i] for i in ids)))
        for name, cls in face_classes.items():
            out.append('         fc.defineBishaFace("%s",%s);' % (name, cls))
        for key in ('speed', 'jumpPower', 'heavy', 'defenseType'):
            out.append('         fc.%s = %s;' % (key, cfg['stats'][key]))
        out += ['         fc.initMc(this.mc);', '      }', '   }', '}', '']
        return '\n'.join(out)


def fmt(v):
    return str(int(v)) if float(v).is_integer() else repr(round(v, 3))


def sprite_frame_count(dump_lines, chid):
    start = next(i for i, l in enumerate(dump_lines) if re.search(r'DefineSprite \(chid: %s\)' % chid, l))
    count = 0
    for line in dump_lines[start + 1:]:
        m = re.match(r'^[0-9a-f]{8}:(\s+\d+)\. (\w+)', line)
        if not m:
            continue
        if len(m.group(1)) <= 5:
            break
        if m.group(2) == 'ShowFrame':
            count += 1
    return count


def main():
    cfg_path, timeline_path, gjl_path, dump_path, project_dir, out_dir = sys.argv[1:7]
    cfg = json.load(open(cfg_path, encoding='utf-8'))
    timeline = json.load(open(timeline_path, encoding='utf-8'))
    gen = Generator(cfg, timeline, open(gjl_path, encoding='utf-8').read())
    gen.build()

    os.makedirs(os.path.join(out_dir, cfg['package']), exist_ok=True)
    scripts = []
    sound_classes = {}
    for kind in cfg['sounds'].values():
        for sid in kind:
            sound_classes[sid] = 'snd_%d' % sid
    for sid, cls in sorted(sound_classes.items()):
        path = os.path.join(out_dir, cls + '.as')
        open(path, 'w', encoding='utf-8').write(
            'package\n{\n   import flash.media.Sound;\n\n   public dynamic class %s extends Sound\n   {\n'
            '      public function %s()\n      {\n         super();\n      }\n   }\n}\n' % (cls, cls))
        scripts.append(path)
    face_classes, images = {}, []
    for i, (name, png) in enumerate(cfg.get('bishaFaces', {}).items(), 1):
        cls = 'bsface%d' % i
        face_classes[name] = cls
        images.append({'file': os.path.join(project_dir, png), 'class': cls})
        path = os.path.join(out_dir, cls + '.as')
        open(path, 'w', encoding='utf-8').write(
            'package\n{\n   import flash.display.BitmapData;\n\n   public dynamic class %s extends BitmapData\n   {\n'
            '      public function %s(param1:int = 0, param2:int = 0)\n      {\n         super(param1,param2);\n      }\n   }\n}\n'
            % (cls, cls))
        scripts.append(path)
    timeline_cls = 'ActionMC'
    path = os.path.join(out_dir, cfg['package'], timeline_cls + '.as')
    open(path, 'w', encoding='utf-8').write(gen.timeline_class(timeline_cls))
    scripts.append(path)
    path = os.path.join(out_dir, 'main_mc.as')
    open(path, 'w', encoding='utf-8').write(gen.main_class(sound_classes, face_classes))
    scripts.append(path)

    nested_classes = {}
    for sid, frames in cfg.get('nestedFrameScripts', {}).items():
        cls = 'Effect' + sid
        nested_classes[sid] = cfg['package'] + '.' + cls
        path = os.path.join(out_dir, cfg['package'], cls + '.as')
        methods = []
        for frame, code in sorted(frames.items(), key=lambda item: int(item[0])):
            if not isinstance(code, str):
                raise ValueError('Invalid nested frame script: ' + str(code))
            code = re.sub(r'(?<![.\w])stop\(\);', 'this.ftopStopped = true; stop();', code)
            code = re.sub(r'(?<![.\w])gotoAndPlay\(', 'this.ftopStopped = false; gotoAndPlay(', code)
            methods.append('internal function f%s():void {%s}' % (frame, code))
        registration = ','.join('%d,f%s' % (int(f)-1, f) for f in frames)
        with open(path, 'w', encoding='utf-8') as out:
            out.write('package %s { import flash.display.MovieClip; public dynamic class %s extends MovieClip { public var ftopManagedEffect:Boolean = true; public var ftopStopped:Boolean = false; private var portName:String; override public function get name():String { return portName != null ? portName : super.name; } override public function set name(value:String):void { portName = value; } public function %s() { super(); addFrameScript(%s); } %s }}' % (cfg['package'], cls, cls, registration, ' '.join(methods)))
        scripts.append(path)

    dump_lines = open(dump_path, encoding='utf-8', errors='replace').read().split('\n')
    action = cfg['actionSprite']
    labels = [{'sprite': action, 'name': n, 'remove': True} for n in cfg['labels']['remove']]
    labels += [{'sprite': action, 'name': n, 'frame': f} for n, f in cfg['labels']['add'].items()]
    renames = list(cfg.get('extraRenames', []))
    for b in cfg['bullets']:
        renames.append({'sprite': action, 'frame': b['frame'], 'depth': b['depth'], 'name': b['name']})
        renames.append({'sprite': b['sprite'], 'frame': b['hitArea']['frame'], 'depth': b['hitArea']['depth'], 'name': 'main'})
        labels += [{'sprite': b['sprite'], 'name': n, 'frame': f} for n, f in b['labels'].items()]
    for chid in cfg['stopAtLastFrame']:
        labels.append({'sprite': chid, 'name': 'stop', 'frame': sprite_frame_count(dump_lines, chid)})
    symbol_classes = {'main': 'main_mc', str(action): '%s.%s' % (cfg['package'], timeline_cls)}
    symbol_classes.update({str(k): v for k, v in sound_classes.items()})
    symbol_classes.update(nested_classes)
    labels = list({json.dumps(op, sort_keys=True): op for op in labels}.values())
    renames = list({json.dumps(op, sort_keys=True): op for op in renames}.values())
    plan = {
        'input': os.path.join(project_dir, cfg['source']),
        'output': os.path.join(project_dir, cfg['output']),
        'swfVersion': 10, 'mainFrames': 2,
        'labels': labels, 'renames': renames, 'scripts': scripts, 'symbolClasses': symbol_classes,
        'images': images,
    }
    json.dump(plan, open(os.path.join(out_dir, 'plan.json'), 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    with open(os.path.join(out_dir, 'report.txt'), 'w', encoding='utf-8') as rep:
        rep.write('frames with code: %d\nhit definitions: %d\n' % (len(gen.code), len(gen.hits)))
        rep.write('\n'.join(gen.warnings) + '\n')
        for warning in cfg.get('nestedScriptWarnings', []):
            rep.write('nested: ' + json.dumps(warning, ensure_ascii=False) + '\n')
    print('frames with code: %d, warnings: %d' % (len(gen.code), len(gen.warnings)))


if __name__ == '__main__':
    main()
