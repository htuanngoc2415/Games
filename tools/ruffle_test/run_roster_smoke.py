import asyncio
import glob
import json
import hashlib
from pathlib import Path
from playwright.async_api import async_playwright
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'games/anime_crossover_bvn/build/roster_runtime_final'
OUT.mkdir(exist_ok=True)
async def main():
 project=ROOT/'games/anime_crossover_bvn'
 manifest={'game_sha256':hashlib.sha256((project/'working/anime_crossover_bvn.swf').read_bytes()).hexdigest(),'test_swf_sha256':hashlib.sha256((ROOT/'tools/ruffle_test/www/roster_smoke.swf').read_bytes()).hexdigest(),'fighters':json.loads((project/'analysis/roster_verification.json').read_text())}
 (OUT/'build_manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
 async with async_playwright() as p:
  exe=glob.glob('/home/admin1/.cache/ms-playwright/chromium_headless_shell-*/*/chrome-headless-shell')[0]
  browser=await p.chromium.launch(executable_path=exe,args=['--no-sandbox','--enable-unsafe-swiftshader','--use-gl=swiftshader','--autoplay-policy=no-user-gesture-required'])
  page=await browser.new_page(viewport={'width':800,'height':600})
  await page.route('**/index.html*', lambda route: route.fulfill(body=(ROOT/'tools/ruffle_test/www/index.html').read_text().replace('preferredRenderer:"webgl"','preferredRenderer:"wgpu-webgl"'), content_type='text/html'))
  done=asyncio.Event()
  with (OUT/'console.log').open('w') as log:
   def message(m):
    log.write(m.text+'\n');log.flush()
    if 'ROSTER_' in m.text:print(m.text,flush=True)
    if 'ROSTER_SMOKE_DONE' in m.text:done.set()
    if 'ROSTER_ACTIONS_COMPLETED' in m.text:
     name=m.text.split('ROSTER_ACTIONS_COMPLETED ')[1].split()[0]
     asyncio.create_task(page.screenshot(path=str(OUT/(name+'.png'))))
   page.on('console',message)
   page.on('pageerror',lambda e:log.write('PAGEERROR '+str(e)+'\n'))
   await page.goto('http://127.0.0.1:8765/index.html?swf=roster_smoke.swf')
   for i in range(120):
    await page.wait_for_timeout(10000)
    if i in (2,5,11) or i%6==0:await page.screenshot(path=str(OUT/f'shot_{i:03}.png'))
    if done.is_set():break
   await page.screenshot(path=str(OUT/'last.png'))
  await browser.close()
asyncio.run(main())
