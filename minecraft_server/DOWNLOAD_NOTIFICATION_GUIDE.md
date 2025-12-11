# 📦 ระบบแจ้งเตือนดาวน์โหลด Resource Pack และ Shader

## 🎯 ภาพรวม

ผมได้สร้างระบบแจ้งเตือนที่ครบถ้วนเพื่อให้ผู้เล่นดาวน์โหลด Resource Pack และ Shader:

### ✅ สิ่งที่ได้สร้าง:

1. **ข้อความต้อนรับ (MOTD)** - แจ้งเตือนตั้งแต่เข้า Server
2. **ข้อความเมื่อ Join** - แจ้งเตือนทุกครั้งที่ผู้เล่นเข้าเกม
3. **เว็บไซต์ดาวน์โหลด** - หน้าเว็บสวยงามสำหรับดาวน์โหลด
4. **เมนูในเกม** - เมนู GUI สำหรับดูข้อมูลและลิงก์
5. **Auto Broadcast** - แจ้งเตือนอัตโนมัติทุก 10 นาที
6. **คำสั่งพิเศษ** - `/downloads` สำหรับดูข้อมูล

---

## 📋 ไฟล์ที่สร้าง

### 1. ข้อความต้อนรับและ Join
- `plugins/Essentials/messages/motd.txt` - ข้อความต้อนรับ
- `plugins/Essentials/messages/join.txt` - ข้อความเมื่อเข้าเกม

### 2. เว็บไซต์ดาวน์โหลด
- `setup_download_server.sh` - สคริปต์ตั้งค่า Web Server
- จะสร้างเว็บไซต์ที่ http://192.168.1.13:8081

### 3. เมนูในเกม
- `downloads_menu.yml` - เมนู GUI (ใช้กับ DeluxeMenus)

### 4. Auto Broadcast
- `autobroadcast_downloads.yml` - ข้อความแจ้งเตือนอัตโนมัติ

---

## 🚀 วิธีการติดตั้ง

### ขั้นตอนที่ 1: ติดตั้ง Plugin ที่จำเป็น

```bash
cd /root/MC-Server/minecraft_server/plugins

# ดาวน์โหลด DeluxeMenus (สำหรับเมนู GUI)
curl -L -o DeluxeMenus.jar "https://ci.extendedclip.com/job/DeluxeMenus/lastSuccessfulBuild/artifact/target/DeluxeMenus-1.14.1.jar"

# ดาวน์โหลด AutoMessage (สำหรับ Auto Broadcast)
curl -L -o AutoMessage.jar "https://github.com/MrMicky-FR/AutoMessage/releases/download/v2.5.0/AutoMessage-2.5.0.jar"
```

### ขั้นตอนที่ 2: ตั้งค่าเว็บไซต์ดาวน์โหลด

```bash
cd /root/MC-Server/minecraft_server
chmod +x setup_download_server.sh
bash setup_download_server.sh
```

**หมายเหตุ:** แก้ไข `192.168.1.13` ในไฟล์ต่างๆ ให้เป็น IP จริงของ Server

### ขั้นตอนที่ 3: คัดลอกไฟล์ Config

```bash
# คัดลอก MOTD และ Join Message (ทำแล้ว)
# ไฟล์อยู่ใน plugins/Essentials/messages/

# คัดลอก Downloads Menu
cp downloads_menu.yml plugins/DeluxeMenus/gui_menus/

# คัดลอก Auto Broadcast Config
cp autobroadcast_downloads.yml plugins/AutoMessage/
```

### ขั้นตอนที่ 4: แก้ไข Config

แก้ไข IP Address ในไฟล์ทั้งหมด:
```bash
# แทนที่ 192.168.1.13 ด้วย IP จริง
find /root/MC-Server/minecraft_server -type f -name "*.txt" -o -name "*.yml" | \
xargs sed -i 's/192.168.1.13/YOUR_ACTUAL_IP/g'
```

### ขั้นตอนที่ 5: เปิด Port

```bash
# เปิด Port 8080 สำหรับ Download Server
ufw allow 8080/tcp
```

### ขั้นตอนที่ 6: รีสตาร์ท Server

```bash
# รีสตาร์ท Minecraft Server
cd /root/MC-Server
pm2 restart minecraft-server
```

---

## 📱 ฟีเจอร์ที่ผู้เล่นจะเห็น

### 1. เมื่อเข้า Server ครั้งแรก
ผู้เล่นจะเห็น MOTD ที่บอกให้ดาวน์โหลด Resource Pack และ Shader

### 2. เมื่อ Join เกม
ผู้เล่นจะได้รับข้อความต้อนรับพร้อมลิงก์ดาวน์โหลด

### 3. ทุกๆ 10 นาที
Server จะแจ้งเตือนให้ดาวน์โหลดอัตโนมัติ

### 4. คำสั่งที่ใช้ได้
- `/downloads` - เปิดเมนู GUI
- `/downloads resourcepack` - ดูข้อมูล Resource Pack
- `/downloads shader` - ดูข้อมูล Shader

---

## 🌐 เว็บไซต์ดาวน์โหลด

### URL
```
http://192.168.1.13:8081
```

### ฟีเจอร์
- ✅ หน้าเว็บสวยงาม responsive
- ✅ ดาวน์โหลดได้ทันที
- ✅ มีคำแนะนำการติดตั้ง
- ✅ แสดงข้อมูล Server

### ไฟล์ที่ให้ดาวน์โหลด
1. **Faithful-64x.zip** (16 MB)
   - Resource Pack ความละเอียดสูง
   
2. **Sildurs-Vibrant-Shaders-Lite.zip** (145 KB)
   - Shader Pack แสงเงาสมจริง

---

## 🎨 ตัวอย่างข้อความแจ้งเตือน

### MOTD (Message of the Day)
```
╔════════════════════════════════════════════════════════╗
║          ยินดีต้อนรับสู่ Ovenx Shop Server!           ║
╚════════════════════════════════════════════════════════╝

✨ ฟีเจอร์พิเศษของ Server:
• ระบบ RPG (mcMMO)
• ระบบอาชีพ (Jobs)
• ร้านค้าและประมูล

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📦 แนะนำให้ดาวน์โหลด Resource Pack และ Shader!

🎨 Resource Pack: Faithful 64x
✨ Shader Pack: Sildur's Vibrant Shaders

ดาวน์โหลด: http://192.168.1.13:8081
```

### Join Message
```
╔════════════════════════════════════════════════════════╗
║        ยินดีต้อนรับ PlayerName สู่ Server!            ║
╚════════════════════════════════════════════════════════╝

⚠️  แนะนำให้ดาวน์โหลดเพื่อประสบการณ์ที่ดีที่สุด!

📦 Resource Pack: Faithful 64x
   ดาวน์โหลด: http://192.168.1.13:8081

✨ Shader Pack: Sildur's Vibrant Shaders
   ดาวน์โหลด: http://192.168.1.13:8081
```

### Auto Broadcast (ทุก 10 นาที)
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📦 แนะนำให้ดาวน์โหลด Resource Pack และ Shader!

✨ Resource Pack: Faithful 64x (กราฟิกสวยขึ้น 4 เท่า!)
✨ Shader Pack: Sildur's Vibrant (แสงเงาสมจริง!)

ดาวน์โหลด: http://192.168.1.13:8081
หรือพิมพ์: /downloads
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 🔧 การปรับแต่ง

### เปลี่ยนความถี่ของ Auto Broadcast
แก้ไขใน `autobroadcast_downloads.yml`:
```yaml
interval: 600  # เปลี่ยนเป็นวินาทีที่ต้องการ (600 = 10 นาที)
```

### เปลี่ยนข้อความ
แก้ไขไฟล์:
- `plugins/Essentials/messages/motd.txt`
- `plugins/Essentials/messages/join.txt`
- `autobroadcast_downloads.yml`

### เปลี่ยนหน้าเว็บ
แก้ไขไฟล์ HTML ที่:
```
/var/www/html/minecraft-downloads/index.html
```

---

## 📊 สถิติและการติดตาม

### ดูจำนวนผู้ดาวน์โหลด
```bash
# ดู nginx access log
tail -f /var/log/nginx/access.log | grep -E "(Faithful|Sildurs)"
```

### ดูจำนวนผู้เข้าชมเว็บ
```bash
# นับจำนวนการเข้าชม
grep "GET / " /var/log/nginx/access.log | wc -l
```

---

## 🎯 เป้าหมาย

ระบบนี้จะช่วยให้:
- ✅ ผู้เล่นรู้ว่ามี Resource Pack และ Shader ให้ดาวน์โหลด
- ✅ ผู้เล่นสามารถดาวน์โหลดได้ง่าย
- ✅ ผู้เล่นมีคำแนะนำการติดตั้งที่ชัดเจน
- ✅ เพิ่มประสบการณ์การเล่นที่ดีขึ้น
- ✅ Server ดูมืออาชีพและน่าเชื่อถือ

---

## 🚨 ปัญหาที่อาจเจอ

### ปัญหา: ผู้เล่นไม่เห็นข้อความ
**แก้ไข:**
1. ตรวจสอบว่า EssentialsX ติดตั้งแล้ว
2. ตรวจสอบว่าไฟล์อยู่ในโฟลเดอร์ที่ถูกต้อง
3. รีสตาร์ท Server

### ปัญหา: เว็บไซต์เข้าไม่ได้
**แก้ไข:**
1. ตรวจสอบว่า nginx ทำงาน: `systemctl status nginx`
2. ตรวจสอบว่าเปิด Port 8080: `ufw status`
3. ตรวจสอบ Firewall ของ VPS

### ปัญหา: Auto Broadcast ไม่ทำงาน
**แก้ไข:**
1. ตรวจสอบว่าติดตั้ง AutoMessage plugin
2. ตรวจสอบ config ใน `plugins/AutoMessage/`
3. ดู log ว่ามี error หรือไม่

---

## 📝 Checklist การติดตั้ง

- [ ] ติดตั้ง DeluxeMenus plugin
- [ ] ติดตั้ง AutoMessage plugin
- [ ] รัน setup_download_server.sh
- [ ] แก้ไข 192.168.1.13 ทุกที่
- [ ] เปิด Port 8080
- [ ] คัดลอกไฟล์ config ทั้งหมด
- [ ] รีสตาร์ท Server
- [ ] ทดสอบเข้าเว็บไซต์
- [ ] ทดสอบคำสั่ง /downloads
- [ ] ตรวจสอบ Auto Broadcast

---

## 🎉 สรุป

ตอนนี้ Server ของคุณมีระบบแจ้งเตือนที่ครบถ้วน:

1. **แจ้งเตือนตั้งแต่เข้า Server** (MOTD)
2. **แจ้งเตือนเมื่อ Join** (Join Message)
3. **แจ้งเตือนทุก 10 นาที** (Auto Broadcast)
4. **เว็บไซต์ดาวน์โหลดสวยงาม** (Port 8080)
5. **เมนูในเกม** (คำสั่ง /downloads)

ผู้เล่นจะไม่มีทางพลาดที่จะรู้ว่ามี Resource Pack และ Shader ให้ดาวน์โหลด! 🎮

---

**หมายเหตุ:** อย่าลืมแก้ไข `192.168.1.13` ให้เป็น IP จริงของ Server ครับ!
