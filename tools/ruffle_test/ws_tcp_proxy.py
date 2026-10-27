#!/usr/bin/env python3
"""Cầu nối WebSocket -> TCP cho Ruffle bản web (chỉ dùng khi test): ws_tcp_proxy.py 9100:47800 9101:47801"""
import asyncio, sys
import websockets

async def handler(ws, target):
    host, port = target
    try:
        r, w = await asyncio.open_connection(host, port)
    except OSError:
        await ws.close(); return
    async def up():
        async for m in ws:
            w.write(m if isinstance(m, bytes) else m.encode()); await w.drain()
    async def down():
        while True:
            d = await r.read(65536)
            if not d: break
            await ws.send(d)
    t = [asyncio.create_task(up()), asyncio.create_task(down())]
    await asyncio.wait(t, return_when=asyncio.FIRST_COMPLETED)
    for x in t: x.cancel()
    w.close()

async def main():
    servers = []
    for spec in sys.argv[1:]:
        lp, tp = spec.split(':')
        servers.append(await websockets.serve(lambda ws, t=("127.0.0.1", int(tp)): handler(ws, t), "127.0.0.1", int(lp)))
    await asyncio.Future()
asyncio.run(main())
