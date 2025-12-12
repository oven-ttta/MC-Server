#!/bin/bash

# สคริปต์สำหรับ Restart Minecraft Server ด้วยการตั้งค่าใหม่
# Performance Optimized + Resource Pack Auto-Download

echo "🔄 กำลัง Restart Minecraft Server..."
echo ""

# หา process ID ของ server
SERVER_PID=$(ps aux | grep -i "java.*server.jar" | grep -v grep | awk '{print $2}')

if [ -z "$SERVER_PID" ]; then
    echo "⚠️  Server ไม่ได้ทำงานอยู่"
    echo "📝 กำลังเริ่ม server ใหม่..."
else
    echo "🛑 กำลังหยุด server (PID: $SERVER_PID)..."
    
    # ส่งคำสั่ง stop ไปยัง server
    screen -S minecraft -X stuff "say §cServer กำลัง restart ใน 10 วินาที!$(printf '\r')"
    sleep 5
    screen -S minecraft -X stuff "say §eกำลัง restart... 5 วินาที!$(printf '\r')"
    sleep 5
    screen -S minecraft -X stuff "stop$(printf '\r')"
    
    # รอให้ server หยุดทำงาน
    echo "⏳ รอให้ server หยุดทำงาน..."
    for i in {1..30}; do
        if ! ps -p $SERVER_PID > /dev/null 2>&1; then
            echo "✅ Server หยุดทำงานแล้ว"
            break
        fi
        sleep 1
        echo -n "."
    done
    echo ""
    
    # ถ้ายังทำงานอยู่ ให้ force kill
    if ps -p $SERVER_PID > /dev/null 2>&1; then
        echo "⚠️  Force killing server..."
        kill -9 $SERVER_PID
        sleep 2
    fi
fi

echo ""
echo "🚀 กำลังเริ่ม server ด้วยการตั้งค่าใหม่..."
echo ""
echo "📊 การตั้งค่า:"
echo "   • RAM: 6GB (Xms6G -Xmx6G)"
echo "   • CPU Cores: 6"
echo "   • View Distance: 8 chunks"
echo "   • Simulation Distance: 6 chunks"
echo "   • Resource Pack: Faithful 64x (Auto-download)"
echo ""

# เข้าไปยัง directory ของ server
cd /root/MC-Server/minecraft_server

# ตรวจสอบว่ามี screen session เก่าอยู่หรือไม่
if screen -list | grep -q "minecraft"; then
    echo "🧹 ลบ screen session เก่า..."
    screen -S minecraft -X quit 2>/dev/null
fi

# เริ่ม server ใน screen session
echo "🎮 Starting server in screen session 'minecraft'..."
screen -dmS minecraft bash -c './start.sh; exec bash'

# รอให้ server เริ่มทำงาน
echo "⏳ รอให้ server เริ่มทำงาน..."
sleep 5

# ตรวจสอบว่า server ทำงานหรือไม่
NEW_PID=$(ps aux | grep -i "java.*server.jar" | grep -v grep | awk '{print $2}')

if [ -z "$NEW_PID" ]; then
    echo ""
    echo "❌ Server ไม่สามารถเริ่มทำงานได้!"
    echo "📝 กรุณาตรวจสอบ logs:"
    echo "   tail -f /root/MC-Server/minecraft_server/logs/latest.log"
    exit 1
else
    echo ""
    echo "✅ Server เริ่มทำงานสำเร็จ! (PID: $NEW_PID)"
    echo ""
    echo "📝 คำสั่งที่เป็นประโยชน์:"
    echo "   • ดู console: screen -r minecraft"
    echo "   • ออกจาก screen: กด Ctrl+A แล้วกด D"
    echo "   • ดู logs: tail -f logs/latest.log"
    echo "   • ตรวจสอบ RAM: free -h"
    echo "   • ตรวจสอบ CPU: top"
    echo ""
    echo "🌐 Resource Pack Download:"
    echo "   • URL: http://192.168.1.13:8080"
    echo "   • Faithful 64x จะดาวน์โหลดอัตโนมัติเมื่อผู้เล่นเข้าเซิร์ฟเวอร์"
    echo ""
    echo "🎯 Server พร้อมใช้งานแล้ว!"
fi
