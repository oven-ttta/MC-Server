
import socket
import struct
import time
import sys

def create_packet(id, type, body):
    body = body.encode('utf-8')
    size = len(body) + 10
    return struct.pack('<iii', size, id, type) + body + b'\x00\x00'

def read_packet(sock):
    try:
        data = sock.recv(4096)
        if len(data) < 14: return None
        size, id, type = struct.unpack('<iii', data[:12])
        body = data[12:-2]
        return body.decode('utf-8')
    except:
        return None

def send_command(host, port, password, command):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((host, port))
    
    # Login
    s.send(create_packet(1, 3, password))
    read_packet(s) # Response
    
    # Command
    s.send(create_packet(2, 2, command))
    response = read_packet(s)
    print(f"Sent: {command} -> Response: {response}")
    s.close()
    time.sleep(0.5)

host = "127.0.0.1"
port = 25575
password = "gemini_rcon_pass_123"

# Wait for server to be up with retry
print("Waiting for RCON...")
for i in range(24): # Try for 2 minutes
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((host, port))
        s.close()
        print("RCON Port Open!")
        break
    except ConnectionRefusedError:
        print(f"Waiting for server... {i*5}s")
        time.sleep(5)

print("Injecting Global Rules...")
time.sleep(2) 

commands = [
    "gamerule keepInventory true",
    "gamerule doFireTick false",
    "gamerule drowningDamage false",
    "gamerule fallDamage false",
    "gamerule fireDamage false",
    "rg flag __global__ invincible allow",
    "rg flag __global__ pvp deny",
    "save-all"
]

for cmd in commands:
    try:
        send_command(host, port, password, cmd)
    except Exception as e:
        print(f"Failed {cmd}: {e}")
