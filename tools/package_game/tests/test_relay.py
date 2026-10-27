#!/usr/bin/env python3
"""Kiểm thử relay: python3 tests/test_relay.py build/relay-test"""
import socket, struct, subprocess, sys, time

exe = sys.argv[1]
p = subprocess.Popen([exe, '47900', '47901'])
time.sleep(0.5)

def conn(port):
    s = socket.create_connection(('127.0.0.1', port)); s.settimeout(2); return s
def send(s, payload): s.sendall(struct.pack('>H', len(payload)) + payload)
def recv(s):
    h = b''
    while len(h) < 2: h += s.recv(2 - len(h))
    n = struct.unpack('>H', h)[0]; d = b''
    while len(d) < n: d += s.recv(n - len(d))
    return d[0], d[1:]

try:
    a = conn(47900)
    f, m = recv(a); assert f == 255 and m[0] == 1 and m[1] == 0 and m[2] == 4, ('assign host', f, m)
    try: conn(47901); raise SystemExit('LAN port must be closed before OPEN_LAN')
    except ConnectionRefusedError: pass
    send(a, bytes([0xF0]))
    f, m = recv(a); assert f == 255 and m[0] == 4 and struct.unpack('>H', m[5:7])[0] == 47901, ('lan opened', m)
    print('LAN ip', '.'.join(str(x) for x in m[1:5]))
    b = conn(47901)
    f, m = recv(b); assert f == 255 and m[0] == 1 and m[1] == 1, ('assign client', m)
    f, m = recv(b); assert m[0] == 2 and m[1] == 0, ('join host', m)
    f, m = recv(a); assert m[0] == 2 and m[1] == 1, ('host sees join', m)
    send(a, bytes([0x20]) + b'hello from host'); f, m = recv(b); assert f == 0 and m == bytes([0x20]) + b'hello from host', (f, m)
    send(b, bytes([0xF0])); send(b, bytes([0x21, 1, 2, 3]))   # lệnh relay từ client LAN phải bị bỏ qua
    f, m = recv(a); assert f == 1 and m == bytes([0x21, 1, 2, 3]), ('client->host', f, m)
    # nhiều tin liền nhau + tin bị cắt đôi
    blob = b''.join(struct.pack('>H', 3) + bytes([0x30, i, i]) for i in range(5))
    b.sendall(blob[:7]); time.sleep(0.05); b.sendall(blob[7:])
    for i in range(5):
        f, m = recv(a); assert m == bytes([0x30, i, i]), (i, m)
    b.close(); f, m = recv(a); assert m[0] == 3 and m[1] == 1, ('leave', m)
    send(a, bytes([0xF1])); f, m = recv(a); assert m[0] == 5, ('closed', m)
    print('RELAY OK')
finally:
    p.terminate()
