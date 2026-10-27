"""Translate a restricted subset of stateful AS2 frame scripts without splitting branches.
Return None for unsupported code, keeping it visible in the conversion report.
"""
import re

def translate_stateful(src):
    # Limit this path to known stateful gameplay statements; simple scripts use the normal translator.
    if not any(x in src for x in ('_root.game[', '_flyN', '_flowerHit', '._name =', '.gotoAndPlay(', '._x = zzz._x')):
        return None
    code=src
    code=re.sub(r'ql \+= (\d+);', r'c.addQi(\1);', code)
    code=re.sub(r'\b(?:jump|jumped|动作|bs) = -?\d+;', '', code)
    enemy=r'_root\.game\["p" \+ pn\]'
    code=re.sub(enemy+r'\.mc\.动作\s*==\s*-1', '(fc.getTargetState() >= 21 && fc.getTargetState() <= 24)',code)
    code=re.sub(enemy+r'\.mc\.动作\s*!=\s*-1', '!(fc.getTargetState() >= 21 && fc.getTargetState() <= 24)',code)
    code=re.sub(enemy+r'\.mc\.hp', 'fc.getTargetSP().hp',code)
    code=re.sub(enemy+r'\._([xy])',r'fc.target.\1',code)
    # Source facing uses percentages; Flash AS3 uses a signed unit scale.
    code=re.sub(r'_parent\._xscale = (-?)100',r'fc.self.scaleX = \g<1>1',code)
    code=code.replace('_parent._xscale','fc.self.scaleX').replace('_parent._x','fc.self.x').replace('_parent._y','fc.self.y')
    # Child timeline properties persist on the action MovieClip, including combo counters.
    code=re.sub(r'\b(\w+)\._(x|y|name|currentframe)\b',lambda m:'this.'+m[1]+'.'+{'x':'x','y':'y','name':'name','currentframe':'currentFrame'}[m[2]],code)
    code=re.sub(r'\b(\w+)\.gotoAndPlay\(',r'this.\1.gotoAndPlay(',code)
    code=re.sub(r'\bvar (_flyN|_flowerHit|kihit) =',r'this.\1 =',code)
    code=re.sub(r'(?<![.\w])(_flyN|_flowerHit|kihit)\b',r'this.\1',code)
    code=code.replace('updateDirect();','fc.setDirectToTarget();')
    code=re.sub(r'(?<!\.)gotoAndStop\("(站立|落2?)"\);','c.idle();',code)
    code=re.sub(r'(?<!\.)gotoAndStop\("([^"]+)"\);',r'c.loop("\1");',code)
    code=re.sub(r'(?<!\.)play\(\);','',code)
    code=re.sub(r'_root\.showFace\([^;]+;','',code)
    code=re.sub(r'_root\.(shine|shake)\(',r'fx.\1(',code)
    code=re.sub(r'this\.(\w+)\.name = "(\w+)";', r'this.\2 = this.\1; this.\2.name = "\2";', code)
    code=re.sub(r'this\.(\w+)\.gotoAndPlay\(', r'this.\1.ftopStopped = false; this.\1.gotoAndPlay(', code)
    # Fail closed: don't quietly strip statements that still rely on the old engine.
    if '_root' in code or '_parent' in code or 'gjl1' in code or re.search(r'\bvar (?!_px\b|_tx\b)',code):return None
    allowed={'if','else','true','false','fc','this','c','fx','return','var','_px','_tx'}
    # Remaining bare identifiers must be control words or a supported object root.
    without_strings=re.sub(r'"[^"]*"','""',code)
    bare=set(re.findall(r'(?<![.\w])([A-Za-z_]\w*)',without_strings))
    if not bare<=allowed:return None
    return 'if(fc.target) { '+code+' }'
