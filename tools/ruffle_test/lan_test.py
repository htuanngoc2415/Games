#!/usr/bin/env python3
"""Thử chơi LAN giữa hai Ruffle (Chromium ngầm) trên cùng máy: relay + cầu nối ws->tcp + hai trang.
Chuẩn bị: make_test_swf.sh <game.swf> www/test.swf lan_test_patch   (bản test hiệp 10 giây, máu 1%)
Dùng: lan_test.py OUT_DIR [lobby|fight|stress|rematch]   (HUNT=1 HOST_MOVE_PRESSES=40 cho P1 chủ động đánh)"""
import asyncio, glob, os, re, subprocess, sys, time
from pathlib import Path
from playwright.async_api import async_playwright

HERE = Path(__file__).resolve().parent
OUT = Path(sys.argv[1]); OUT.mkdir(parents=True, exist_ok=True)
MODE = sys.argv[2] if len(sys.argv) > 2 else 'lobby'
RELAY = HERE.parent / 'package_game/build/relay-test'
logs = {'A': [], 'B': []}

async def key(pg, k, hold=110, wait=700):
    await pg.keyboard.down(k); await pg.wait_for_timeout(hold); await pg.keyboard.up(k); await pg.wait_for_timeout(wait)

async def shot(pages, name):
    for n, pg in pages.items():
        await pg.screenshot(path=str(OUT / f'{name}_{n}.png'))

def wait_for(pat, who=None, timeout=60):
    async def inner():
        t0 = time.time()
        while time.time() - t0 < timeout:
            for n in ('A', 'B') if who is None else (who,):
                if any(re.search(pat, l) for l in logs[n]): return True
            await asyncio.sleep(0.5)
        return False
    return inner()

async def main():
    relay_log = open(OUT / 'relay.log', 'w')
    procs = [subprocess.Popen([str(RELAY), '47800', '47801'], stderr=relay_log),
             subprocess.Popen([str(HERE / '.venv/bin/python'), str(HERE / 'ws_tcp_proxy.py'), '9100:47800', '9101:47801'])]
    time.sleep(1.5)
    exe = glob.glob(os.path.expanduser('~/.cache/ms-playwright/chromium_headless_shell-*/*/chrome-headless-shell'))[0]
    try:
        async with async_playwright() as p:
            b = await p.chromium.launch(executable_path=exe, args=['--enable-unsafe-swiftshader', '--use-gl=swiftshader'])
            pages = {}
            for n in ('A', 'B'):
                ctx = await b.new_context(viewport={'width': 800, 'height': 600})
                pg = await ctx.new_page()
                pg.on('console', lambda m, n=n: logs[n].append(m.text))
                pg.on('pageerror', lambda e, n=n: logs[n].append('PAGEERROR ' + str(e)))
                pages[n] = pg
                await pg.goto('http://127.0.0.1:8765/net.html')
            await asyncio.sleep(100)
            A, B = pages['A'], pages['B']
            for pg in (A, B): await pg.mouse.click(5, 595)
            presses = int(os.environ.get('HOST_DAMAGE_PRESSES', '0'))
            mpress = int(os.environ.get('HOST_MOVE_PRESSES', '0'))
            if presses or mpress:                          # chủ phòng chỉnh sát thương / tốc độ qua màn Cài đặt nhân vật
                for k in 'ssss': await key(A, k)
                await key(A, 'j', wait=2500); await key(A, 'j')
                for _ in range(presses): await key(A, 'd', hold=60, wait=120)
                if mpress:
                    await key(A, 's')
                    for _ in range(mpress): await key(A, 'd', hold=60, wait=120)
                await shot({'A': A}, '0_editor')
                await key(A, 'Escape'); await key(A, 'Escape', wait=1500)
                for k in 'wwww': await key(A, k, wait=300)
            for pg in (A, B):
                for k in 'sss': await key(pg, k)
                await key(pg, 'j', wait=2500)
            await shot(pages, '1_lobby_menu')
            await key(A, 'j', wait=3000)                      # Tạo phòng
            await shot(pages, '2_host')
            await key(B, 's'); await key(B, 'j', wait=1500)    # Tham gia phòng
            await B.keyboard.type('127.0.0.1', delay=80)
            await shot(pages, '3_join_input')
            await key(B, 'Enter', wait=3000)
            await shot(pages, '4_connected')
            if MODE != 'lobby':
                await key(A, 'j', wait=3000)                  # Bắt đầu chọn nhân vật
                await shot(pages, '5_select')
                for pg in (A, B):                              # nhân vật, trợ chiến
                    await key(pg, 'j', wait=3500); await key(pg, 'j', wait=3500)
                await key(A, 'j', wait=3000)                  # bản đồ (chủ phòng)
                await shot(pages, '6_loading')
                ok = await wait_for(r'NET_LOCKSTEP_BEGIN', None, 120)
                print('lockstep begin:', ok)
                await asyncio.sleep(8)
                await shot(pages, '7_fight')
                if MODE == 'stress':
                    import random
                    rnd = random.Random(7)
                    keys = ['w','a','s','d','j','k','l','u','i','o']
                    async def mash(pg, seed):
                        r = random.Random(seed)
                        t0 = time.time()
                        while time.time() - t0 < float(os.environ.get('STRESS_SECONDS', '240')):
                            if any(re.search('NET_MATCH_FINISHED', l) for l in logs['A']): break
                            k = r.choice(keys)
                            if r.random() < 0.5: k = r.choice(['d', 'a', 'j'])
                            await pg.keyboard.down(k); await asyncio.sleep(r.uniform(0.05, 0.4)); await pg.keyboard.up(k)
                            await asyncio.sleep(r.uniform(0.0, 0.15))
                    async def hunter(pg):                       # P1 chạy sang phải một lúc rồi đánh
                        t0 = time.time()
                        while time.time() - t0 < float(os.environ.get('STRESS_SECONDS', '240')):
                            if any(re.search('NET_MATCH_FINISHED', l) for l in logs['A']): break
                            await pg.keyboard.down('d'); await asyncio.sleep(float(os.environ.get('RUN_SECONDS', '8'))); await pg.keyboard.up('d')
                            for _ in range(25):
                                await pg.keyboard.down('j'); await asyncio.sleep(0.09); await pg.keyboard.up('j'); await asyncio.sleep(0.15)
                    await asyncio.gather(hunter(A) if os.environ.get('HUNT') else mash(A, 1), (asyncio.sleep(0) if os.environ.get('HUNT') else mash(B, 2)))
                    await shot(pages, '8_after_stress')
                    await asyncio.sleep(15)
                    await shot(pages, '9_end')
                if MODE == 'rematch':
                    async def hunter2(pg):
                        t0 = time.time()
                        while time.time() - t0 < 420:
                            if any(re.search('NET_MATCH_FINISHED', l) for l in logs['A']): return True
                            await pg.keyboard.down('d'); await asyncio.sleep(8); await pg.keyboard.up('d')
                            for _ in range(25):
                                await pg.keyboard.down('j'); await asyncio.sleep(0.09); await pg.keyboard.up('j'); await asyncio.sleep(0.15)
                        return False
                    print('match 1 finished:', await hunter2(A))
                    await asyncio.sleep(6); await shot(pages, '8_lobby_after')
                    n_before = sum(1 for l in logs['A'] if 'NET_LOCKSTEP_BEGIN' in l)
                    await key(A, 'j', wait=3500)                       # chơi tiếp
                    await shot(pages, '9_select_again')
                    for pg in (A, B):
                        await key(pg, 'j', wait=3500); await key(pg, 'j', wait=3500)
                    await key(A, 'j', wait=3000)
                    t0 = time.time()
                    while time.time() - t0 < 150 and sum(1 for l in logs['A'] if 'NET_LOCKSTEP_BEGIN' in l) <= n_before: await asyncio.sleep(1)
                    print('match 2 started:', sum(1 for l in logs['A'] if 'NET_LOCKSTEP_BEGIN' in l) > n_before)
                    await asyncio.sleep(15); await shot(pages, '10_match2')
                    await key(A, 'Escape', wait=4000)                  # chủ phòng thoát giữa trận
                    await shot(pages, '11_after_escape')
                    await asyncio.sleep(3)
                if MODE == 'desync' or MODE == 'fight':
                    # P1 (A) đi phải + đánh, P2 (B) nhảy rồi đánh
                    await A.keyboard.down('d'); await asyncio.sleep(1.2); await A.keyboard.up('d')
                    for _ in range(5):
                        await key(A, 'j', wait=250); await key(B, 'k', wait=250); await key(B, 'j', wait=250); await key(A, 'u', wait=300)
                    await asyncio.sleep(20)
                    await shot(pages, '8_fight_later')
                    await asyncio.sleep(40)
            await asyncio.sleep(1)
            await b.close()
    finally:
        for pr in procs: pr.terminate()
        for n in ('A', 'B'):
            (OUT / f'console_{n}.log').write_text('\n'.join(logs[n]))
asyncio.run(main())
