#!/bin/bash

# สคริปต์สำหรับตรวจสอบสถานะ Minecraft Server

echo "📊 Minecraft Server Status Check"
echo "=================================="
echo ""

# ตรวจสอบว่า server ทำงานอยู่หรือไม่
SERVER_PID=$(ps aux | grep -i "java.*server.jar" | grep -v grep | awk '{print $2}')

if [ -z "$SERVER_PID" ]; then
    echo "❌ Server Status: OFFLINE"
    echo ""
    echo "💡 เริ่ม server ด้วยคำสั่ง:"
    echo "   cd /root/MC-Server/minecraft_server"
    echo "   ./restart_server.sh"
    exit 1
fi

echo "✅ Server Status: ONLINE (PID: $SERVER_PID)"
echo ""

# ดูการใช้ RAM
echo "💾 Memory Usage:"
RAM_USAGE=$(ps -p $SERVER_PID -o rss= | awk '{printf "%.2f GB", $1/1024/1024}')
echo "   Server RAM: $RAM_USAGE"
free -h | grep "Mem:" | awk '{print "   Total RAM: " $2 " | Used: " $3 " | Free: " $4}'
echo ""

# ดูการใช้ CPU
echo "🔧 CPU Usage:"
CPU_USAGE=$(ps -p $SERVER_PID -o %cpu= | awk '{printf "%.1f%%", $1}')
echo "   Server CPU: $CPU_USAGE"
echo ""

# ดูจำนวน threads
THREAD_COUNT=$(ps -p $SERVER_PID -o nlwp= | tr -d ' ')
echo "🧵 Thread Count: $THREAD_COUNT"
echo ""

# ดูเวลาที่ server ทำงาน
echo "⏰ Uptime:"
ps -p $SERVER_PID -o etime= | awk '{print "   " $1}'
echo ""

# ตรวจสอบ nginx (web server สำหรับ resource pack)
echo "🌐 Web Server (nginx):"
if systemctl is-active --quiet nginx; then
    echo "   ✅ nginx: RUNNING"
    echo "   📦 Resource Pack URL: http://192.168.1.13:8080"
else
    echo "   ❌ nginx: STOPPED"
    echo "   💡 เริ่ม nginx: sudo systemctl start nginx"
fi
echo ""

# ดู port ที่เปิดอยู่
echo "🔌 Open Ports:"
netstat -tuln 2>/dev/null | grep -E ":(25565|8080)" | awk '{print "   " $4 " (" $1 ")"}' || ss -tuln | grep -E ":(25565|8080)" | awk '{print "   " $5 " (" $1 ")"}'
echo ""

# ดู disk usage
echo "💿 Disk Usage:"
df -h /root/MC-Server/minecraft_server | tail -1 | awk '{print "   Used: " $3 " / " $2 " (" $5 ")"}'
echo ""

# ดูขนาดของ world
echo "🗺️  World Size:"
WORLD_SIZE=$(du -sh /root/MC-Server/minecraft_server/world 2>/dev/null | awk '{print $1}')
echo "   Main World: $WORLD_SIZE"
echo ""

# ดู latest log (10 บรรทัดล่าสุด)
echo "📝 Latest Logs (last 10 lines):"
echo "=================================="
tail -10 /root/MC-Server/minecraft_server/logs/latest.log 2>/dev/null || echo "   ไม่พบ log file"
echo ""

echo "=================================="
echo "💡 Useful Commands:"
echo "   • View console: screen -r minecraft"
echo "   • Exit screen: Ctrl+A then D"
echo "   • Restart server: ./restart_server.sh"
echo "   • View full logs: tail -f logs/latest.log"
echo "   • Monitor resources: htop"
