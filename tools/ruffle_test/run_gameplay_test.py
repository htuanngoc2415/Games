#!/usr/bin/env python3
"""Chạy gameplay_test.swf (make_gameplay_test.py) trong Chromium headless + Ruffle.

Ghi console vào OUT/console.log, chèn dòng "PY_ACTION <id> <tên>" trước mỗi lần bấm,
chụp ảnh từng chiêu và từng mốc của pha AI.
Dùng: run_gameplay_test.py OUT_DIR   (cần server: cd www && python3 -m http.server 8765)
"""
import asyncio
import glob
import sys
from pathlib import Path
from playwright.async_api import async_playwright

OUT = Path(sys.argv[1])
OUT.mkdir(parents=True, exist_ok=True)
ACTIONS = [
    ('J', [['j']]), ('JJJJ', [['j'], ['j'], ['j'], ['j']]), ('JMASH', [['j']] * 8), ('SJ', [['s', 'j']]), ('WJ', [['w', 'j']]),
    ('U', [['u']]), ('SU', [['s', 'u']]), ('WU', [['w', 'u']]),
    ('K', [['k']]), ('KJ', [['k'], ['j']]), ('KU', [['k'], ['u']]), ('L', [['l']]),
    ('KI', [['k'], ['i']]), ('I', [['i']]), ('WI', [['w', 'i']]), ('SI', [['s', 'i']]),
]
LONG = {'I', 'WI', 'SI', 'KI'}


async def press(page, combo):
    for k in combo[:-1]:
        await page.keyboard.down(k)
    await page.keyboard.down(combo[-1])
    await page.wait_for_timeout(70)
    await page.keyboard.up(combo[-1])
    for k in combo[:-1]:
        await page.keyboard.up(k)


async def main():
    exe = glob.glob(str(Path.home() / '.cache/ms-playwright/chromium_headless_shell-*/*/chrome-headless-shell'))[0]
    queue = asyncio.Queue()
    async with async_playwright() as p:
        browser = await p.chromium.launch(executable_path=exe, args=[
            '--no-sandbox', '--enable-unsafe-swiftshader', '--use-gl=swiftshader', '--autoplay-policy=no-user-gesture-required'])
        page = await browser.new_page(viewport={'width': 800, 'height': 600})
        log = (OUT / 'console.log').open('w')

        def on_console(m):
            log.write(m.text + '\n')
            if 'GT_READY' in m.text or 'GT_DONE' in m.text or 'GT_FAIL' in m.text:
                print(m.text.split('GT_')[1][:60], flush=True)
                queue.put_nowait(m.text)
        page.on('console', on_console)
        page.on('pageerror', lambda e: log.write('PAGEERROR %s\n' % e))
        await page.goto('http://127.0.0.1:8765/index.html?swf=gameplay_test.swf')
        await page.wait_for_timeout(20000)
        await page.mouse.click(755, 22)
        while True:
            try:
                msg = await asyncio.wait_for(queue.get(), timeout=400)
            except asyncio.TimeoutError:
                log.write('PY_TIMEOUT\n')
                await page.screenshot(path=str(OUT / 'timeout.png'))
                break
            if 'GT_DONE' in msg or 'GT_FAIL' in msg:
                break
            parts = msg.split('GT_READY ')[1].split()
            phase, fid = parts[0], parts[1]
            await page.mouse.click(400, 300)
            if phase == 'input':
                for name, seq in ACTIONS:
                    await page.keyboard.press('F9')
                    await page.wait_for_timeout(500)
                    log.write('PY_ACTION %s %s\n' % (fid, name))
                    for combo in seq:
                        await press(page, combo)
                        await page.wait_for_timeout(90 if name == 'JMASH' else 260)
                    await page.wait_for_timeout(350)
                    await page.screenshot(path=str(OUT / ('%s_%s.png' % (fid, name))))
                    await page.wait_for_timeout(6500 if name == 'SI' else 3600 if name in LONG else 1500)
                log.write('PY_ACTION %s END\n' % fid)
            else:
                log.write('PY_AI %s\n' % fid)
                for i in range(3):
                    await page.wait_for_timeout(5000)
                    await page.screenshot(path=str(OUT / ('%s_ai%d.png' % (fid, i))))
                log.write('PY_AI %s END\n' % fid)
            log.flush()
            await page.keyboard.press('F10')
        log.close()
        await browser.close()

asyncio.run(main())
