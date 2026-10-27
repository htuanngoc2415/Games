import asyncio
import glob
import json
import hashlib
from pathlib import Path
from playwright.async_api import async_playwright
ROOT=Path(__file__).resolve().parents[2]
P=ROOT/'games/anime_crossover_bvn'
OUT=P/'build/selection_runtime'
OUT.mkdir(exist_ok=True)
async def main():
 async with async_playwright() as p:
  exe=glob.glob('/home/admin1/.cache/ms-playwright/chromium_headless_shell-*/*/chrome-headless-shell')[0]
  browser=await p.chromium.launch(executable_path=exe,args=['--no-sandbox','--enable-unsafe-swiftshader','--use-gl=swiftshader','--autoplay-policy=no-user-gesture-required'])
  page=await browser.new_page(viewport={'width':800,'height':600})
  await page.route('**/index.html*',lambda route:route.fulfill(body=(ROOT/'tools/ruffle_test/www/index.html').read_text().replace('preferredRenderer:"webgl"','preferredRenderer:"wgpu-webgl"'),content_type='text/html'))
  ready=asyncio.Event();pools={}
  with (OUT/'console.log').open('w') as log:
   def message(m):
    log.write(m.text+'\n');log.flush()
    if 'SELECTION_POOL ' in m.text:
     parts=m.text.split('SELECTION_POOL ')[1].split()
     pools[parts[0]]=parts[1].split(',')
    if 'SELECTION_READY' in m.text:ready.set()
   page.on('console',message)
   page.on('pageerror',lambda e:log.write('PAGEERROR '+str(e)+'\n'))
   await page.mouse.move(790,20)
   await page.goto('http://127.0.0.1:8765/index.html?swf=selection_test.swf')
   await asyncio.wait_for(ready.wait(),240)
   await page.wait_for_timeout(3000)
   await page.mouse.click(755,22)
   await page.screenshot(path=str(OUT/'grid.png'))
   for name,x in [('random_fairy_tail',634),('random_one_piece',699),('random_all',765)]:
    await page.mouse.move(x,475)
    await page.wait_for_timeout(2000)
    await page.screenshot(path=str(OUT/(name+'.png')))
   (OUT/'pools.json').write_text(json.dumps({'game_sha256':hashlib.sha256((P/'working/anime_crossover_bvn.swf').read_bytes()).hexdigest(),'pools':pools},indent=2)+'\n')
  await browser.close()
  print({g:len(ids) for g,ids in pools.items()})
asyncio.run(main())
