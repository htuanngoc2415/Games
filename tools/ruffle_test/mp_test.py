"""Thử trận nhiều người (4 đấu sĩ, AI hoặc đầu vào giả) trên Ruffle ngầm, chụp ảnh theo mốc.
Dùng: mp_test.py OUT_DIR LAYOUT(1|2) [AI_MASK=15] [SECONDS=120]   (cần http.server cổng 8765 ở thư mục www)"""
import asyncio, glob, re, sys, time
from pathlib import Path
from playwright.async_api import async_playwright
OUT = Path(sys.argv[1]); OUT.mkdir(parents=True, exist_ok=True)
LAYOUT = sys.argv[2]; AI = sys.argv[3] if len(sys.argv) > 3 else '15'; SECS = int(sys.argv[4]) if len(sys.argv) > 4 else 120
F = 'ftop_natsu,ftop_luffy,ftop_zoro,ftop_gray'; Z = 'kon,orihime,yoruichi,uryuu'
async def main():
    logs = []
    async with async_playwright() as p:
        b = await p.chromium.launch(executable_path=glob.glob('/home/admin1/.cache/ms-playwright/chromium_headless_shell-*/*/chrome-headless-shell')[0],
                                    args=['--no-sandbox', '--enable-unsafe-swiftshader', '--use-gl=swiftshader'])
        pg = await b.new_page(viewport={'width': 800, 'height': 600})
        pg.on('console', lambda m: logs.append(m.text)); pg.on('pageerror', lambda e: logs.append('PAGEERROR ' + str(e)))
        await pg.goto(f'http://127.0.0.1:8765/mp.html?swf=test.swf&mp={LAYOUT}&ai={AI}&f={F}&z={Z}')
        t0 = time.time(); n = 0
        while time.time() - t0 < SECS:
            await asyncio.sleep(6); n += 1
            await pg.screenshot(path=str(OUT / f'{n:02d}.png'))
            if any('NET_' in l or 'time over' in l for l in logs[-5:]): pass
        (OUT / 'console.log').write_text('\n'.join(logs)); await b.close()
    errs = [l for l in logs if re.search('Error #|PAGEERROR|panicked', l)]
    print('errors:', len(errs)); [print(' ', e[:200]) for e in errs[:8]]
asyncio.run(main())
