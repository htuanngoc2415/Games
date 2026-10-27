import asyncio, sys, json, time, glob, os
from playwright.async_api import async_playwright
# usage: run.py outprefix steps.json   steps: [["wait",ms],["shot",name],["key",key,holdms],["click",x,y],["down",key],["up",key]]
out, steps = sys.argv[1], json.load(open(sys.argv[2]))
exe = glob.glob(os.path.expanduser('~/.cache/ms-playwright/chromium_headless_shell-1243/*/chrome-headless-shell'))[0]
async def main():
    async with async_playwright() as p:
        b = await p.chromium.launch(executable_path=exe, args=["--enable-unsafe-swiftshader","--use-gl=swiftshader","--autoplay-policy=no-user-gesture-required"])
        pg = await b.new_page(viewport={"width":800,"height":600})
        logf = open(out+"_console.log","w")
        pg.on("console", lambda m: logf.write(f"[{m.type}] {m.text}\n"))
        pg.on("pageerror", lambda e: logf.write(f"[pageerror] {e}\n"))
        await pg.goto("http://127.0.0.1:8765/index.html"+(("?swf="+steps[0][1]) if steps and steps[0][0]=="swf" else ""))
        for s in steps:
            k=s[0]
            if k=="wait": await pg.wait_for_timeout(s[1])
            elif k=="shot": await pg.screenshot(path=f"{out}_{s[1]}.png")
            elif k=="key":
                await pg.keyboard.down(s[1]); await pg.wait_for_timeout(s[2] if len(s)>2 else 80); await pg.keyboard.up(s[1])
            elif k=="down": await pg.keyboard.down(s[1])
            elif k=="up": await pg.keyboard.up(s[1])
            elif k=="click": await pg.mouse.click(s[1],s[2])
            logf.flush()
        logf.close(); await b.close()
asyncio.run(main())
