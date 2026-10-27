import asyncio,glob
from pathlib import Path
from playwright.async_api import async_playwright
root=Path(__file__).resolve().parents[2];out=root/'games/anime_crossover_bvn/build/menu_preview';out.mkdir(exist_ok=True)
async def main():
 async with async_playwright() as p:
  b=await p.chromium.launch(executable_path=glob.glob('/home/admin1/.cache/ms-playwright/chromium_headless_shell-*/*/chrome-headless-shell')[0],args=['--no-sandbox','--enable-unsafe-swiftshader','--use-gl=swiftshader'])
  page=await b.new_page(viewport={'width':800,'height':600});logs=[]
  page.on('console',lambda m:logs.append(m.text));page.on('pageerror',lambda e:logs.append('PAGEERROR '+str(e)))
  await page.route('**/index.html*',lambda r:r.fulfill(body=(root/'tools/ruffle_test/www/index.html').read_text().replace('preferredRenderer:"webgl"','preferredRenderer:"wgpu-webgl"'),content_type='text/html'))
  await page.goto('http://127.0.0.1:8766/index.html?swf=test.swf')
  await page.wait_for_timeout(6000);await page.screenshot(path=str(out/'loading.png'))
  await page.wait_for_timeout(40000);await page.mouse.click(755,22);await page.screenshot(path=str(out/'menu.png'))
  await page.mouse.click(625,185);await page.wait_for_timeout(1000);await page.screenshot(path=str(out/'submenu.png'))
  await page.keyboard.down('Escape');await page.wait_for_timeout(150);await page.keyboard.up('Escape');await page.wait_for_timeout(500)
  await page.mouse.click(625,345);await page.wait_for_timeout(1800);await page.screenshot(path=str(out/'settings.png'))
  await page.mouse.click(220,45);await page.wait_for_timeout(800);await page.screenshot(path=str(out/'keys.png'))
  await page.mouse.click(150,275);await page.wait_for_timeout(700)
  await page.keyboard.down('w');await page.wait_for_timeout(120);await page.keyboard.up('w');await page.wait_for_timeout(350)
  await page.keyboard.down('j');await page.wait_for_timeout(120);await page.keyboard.up('j');await page.wait_for_timeout(2000)
  await page.mouse.click(625,185);await page.wait_for_timeout(600)
  await page.mouse.click(625,232);await page.wait_for_timeout(2000);await page.screenshot(path=str(out/'instructions.png'))
  await page.mouse.click(400,555);await page.wait_for_timeout(5000);await page.screenshot(path=str(out/'selection.png'))
  (out/'console.log').write_text('\n'.join(logs));await b.close()
asyncio.run(main())
