#!/bin/bash

# ตรวจสอบว่าอยู่ใน Session screen หรือไม่
if [ -z "$STY" ]; then
    echo "แนะนำให้รันใน screen เพื่อให้เซิร์ฟเวอร์ทำงานต่อเมื่อปิด Terminal"
    echo "ใช้คำสั่ง: screen -S minecraft ./start_server.sh"
    echo "หรือกด Enter เพื่อรันแบบปกติ..."
    read
fi

cd minecraft_server
./start.sh
