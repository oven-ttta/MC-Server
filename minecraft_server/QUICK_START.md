# 🎯 Quick Start Guide - Minecraft Server

## ✅ สิ่งที่ตั้งค่าเสร็จแล้ว

### 1. 📦 Resource Pack Auto-Download
- ✅ Faithful 64x จะดาวน์โหลดอัตโนมัติเมื่อผู้เล่นเข้าเซิร์ฟเวอร์
- ✅ Web Server พร้อมใช้งานที่: http://192.168.1.13:8080
- ✅ SHA1 Hash ตรวจสอบความถูกต้องของไฟล์

### 2. ⚡ Performance Optimization
- ✅ RAM: 6GB (เพิ่มจาก 4GB)
- ✅ CPU: ใช้ทั้ง 6 cores
- ✅ View Distance: 8 chunks (ลดจาก 10)
- ✅ Simulation Distance: 6 chunks (ลดจาก 10)
- ✅ Entity Optimization: ลด 25-40%
- ✅ Item Despawn: เร็วขึ้น 50%
- ✅ Aikar's JVM Flags: ลด lag spike

### 3. 🎮 ประมาณการ
- **รองรับผู้เล่น:** 20-25 คน (เพิ่มจาก 10-12 คน)
- **TPS:** 19.5-20 (คงที่)
- **Ping:** ลดลง 20-30%

---

## 🚀 วิธี Restart Server (สำคัญ!)

**ต้อง restart เพื่อให้การตั้งค่าใหม่มีผล:**

```bash
cd /root/MC-Server/minecraft_server
./restart_server.sh
```

สคริปต์นี้จะ:
1. แจ้งเตือนผู้เล่นก่อน restart 10 วินาที
2. หยุด server อย่างปลอดภัย
3. เริ่ม server ใหม่ด้วยการตั้งค่า 6GB RAM
4. เปิดใช้งาน Resource Pack auto-download

---

## 📊 ตรวจสอบสถานะ Server

```bash
cd /root/MC-Server/minecraft_server
./check_status.sh
```

จะแสดง:
- สถานะ server (online/offline)
- การใช้ RAM และ CPU
- Web server status
- Latest logs

---

## 🎨 Resource Pack & Shader

### Resource Pack (Auto-Download ✅)
- **Faithful 64x** จะดาวน์โหลดอัตโนมัติเมื่อเข้าเซิร์ฟเวอร์
- ผู้เล่นจะเห็นป๊อปอัพถามว่าต้องการดาวน์โหลดหรือไม่
- กดยอมรับแล้วจะติดตั้งทันที

### Shader (Manual Download ❌)
- **Sildur's Vibrant Shaders** ต้องดาวน์โหลดและติดตั้งเอง
- ดาวน์โหลดได้จาก: http://192.168.1.13:8080
- ต้องติดตั้ง OptiFine หรือ Iris ก่อน

---

## 🔧 คำสั่งที่เป็นประโยชน์

### ดู Server Console
```bash
screen -r minecraft
```
**ออกจาก screen:** กด `Ctrl+A` แล้วกด `D`

### ดู Logs แบบ Real-time
```bash
cd /root/MC-Server/minecraft_server
tail -f logs/latest.log
```

### ตรวจสอบ TPS (ใน game)
```
/tps
```
ควรได้ 19.5-20 TPS

### ตรวจสอบ RAM
```bash
free -h
```

### ตรวจสอบ CPU
```bash
top
# หรือ
htop
```

---

## 📁 ไฟล์สำคัญ

### การตั้งค่า
- `server.properties` - การตั้งค่าหลัก + Resource Pack
- `spigot.yml` - Performance optimization
- `bukkit.yml` - Spawn limits
- `start.sh` - JVM flags (6GB RAM)

### สคริปต์
- `restart_server.sh` - Restart server อย่างปลอดภัย
- `check_status.sh` - ตรวจสอบสถานะ

### เอกสาร
- `PERFORMANCE_AND_RESOURCEPACK_SETUP.md` - เอกสารฉบับเต็ม

---

## ⚠️ สิ่งที่ต้องทำหลัง Restart

1. **ตรวจสอบว่า server ทำงาน:**
   ```bash
   ./check_status.sh
   ```

2. **ทดสอบ Resource Pack:**
   - เข้าเซิร์ฟเวอร์ด้วย Minecraft client
   - ควรเห็นป๊อปอัพให้ดาวน์โหลด Faithful 64x
   - กด "Yes" เพื่อดาวน์โหลด

3. **ตรวจสอบ TPS:**
   ```
   /tps
   ```
   ควรได้ประมาณ 19.5-20

4. **ตรวจสอบ RAM usage:**
   ```bash
   free -h
   ```
   ควรใช้ประมาณ 5-5.5GB

---

## 🌐 URLs สำคัญ

- **Web Server:** http://192.168.1.13:8080
- **Faithful 64x:** http://192.168.1.13:8080/Faithful-64x.zip
- **Sildur's Shaders:** http://192.168.1.13:8080/Sildurs-Vibrant-Shaders-Lite.zip
- **Server IP:** 192.168.1.13:25565

---

## 💡 Tips

### ถ้า TPS ต่ำกว่า 19:
1. ตรวจสอบ CPU usage: `top`
2. ตรวจสอบ entity count ใน game: `/minecraft:kill @e[type=!player]`
3. ลด view-distance เป็น 6-7

### ถ้า RAM เต็ม:
1. ตรวจสอบ memory leak: `./check_status.sh`
2. Restart server: `./restart_server.sh`

### ถ้า Resource Pack ไม่ดาวน์โหลด:
1. ตรวจสอบ nginx: `systemctl status nginx`
2. ตรวจสอบไฟล์: `ls -lh /var/www/html/minecraft-downloads/`
3. ทดสอบ URL: `curl -I http://192.168.1.13:8080/Faithful-64x.zip`

---

## 📞 การแก้ปัญหา

### Server ไม่เริ่มทำงาน
```bash
# ดู logs
tail -50 logs/latest.log

# ตรวจสอบว่า port ถูกใช้งานอยู่หรือไม่
netstat -tuln | grep 25565
```

### RAM ไม่เพียงพอ
```bash
# ลด RAM allocation ใน start.sh
# แก้จาก -Xms6G -Xmx6G เป็น -Xms5G -Xmx5G
nano start.sh
```

### Web Server ไม่ทำงาน
```bash
# Restart nginx
sudo systemctl restart nginx

# ตรวจสอบ status
sudo systemctl status nginx
```

---

**สร้างเมื่อ:** 2025-12-12  
**สถานะ:** ✅ พร้อม Restart  
**ขั้นตอนถัดไป:** รัน `./restart_server.sh`
