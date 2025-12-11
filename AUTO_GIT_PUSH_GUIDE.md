# 🔄 Auto Git Push - คู่มือการใช้งาน

## 📋 ภาพรวม

ระบบ Auto Git Push จะตรวจสอบไฟล์ใหม่หรือการเปลี่ยนแปลงทุก 30 วินาที และ push ขึ้น GitHub อัตโนมัติ

### ✨ ฟีเจอร์
- ✅ ตรวจสอบทุก 30 วินาที
- ✅ Auto commit และ push
- ✅ บันทึก log ทุกการทำงาน
- ✅ รันเป็น daemon ด้วย PM2
- ✅ Auto restart ถ้าหยุดทำงาน

---

## 🚀 การติดตั้งและตั้งค่า

### ขั้นตอนที่ 1: ตั้งค่า Git

```bash
cd /root/MC-Server

# ตั้งค่า Git config (ถ้ายังไม่ได้ตั้ง)
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# ตรวจสอบว่ามี .git หรือไม่
if [ ! -d ".git" ]; then
    git init
    git branch -M main
fi
```

### ขั้นตอนที่ 2: เชื่อมต่อกับ GitHub

#### วิธีที่ 1: ใช้ Personal Access Token (แนะนำ)

1. **สร้าง Personal Access Token:**
   - ไปที่: https://github.com/settings/tokens
   - คลิก "Generate new token (classic)"
   - เลือก scope: `repo` (ทั้งหมด)
   - คัดลอก Token

2. **ตั้งค่า Remote:**
```bash
# แทนที่ YOUR_USERNAME และ YOUR_REPO
git remote add origin https://YOUR_TOKEN@github.com/YOUR_USERNAME/YOUR_REPO.git

# หรือถ้ามี remote อยู่แล้ว
git remote set-url origin https://YOUR_TOKEN@github.com/YOUR_USERNAME/YOUR_REPO.git
```

#### วิธีที่ 2: ใช้ SSH Key

1. **สร้าง SSH Key:**
```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
cat ~/.ssh/id_ed25519.pub
```

2. **เพิ่ม SSH Key ใน GitHub:**
   - ไปที่: https://github.com/settings/keys
   - คลิก "New SSH key"
   - วาง public key

3. **ตั้งค่า Remote:**
```bash
git remote add origin git@github.com:YOUR_USERNAME/YOUR_REPO.git
```

### ขั้นตอนที่ 3: Commit และ Push ครั้งแรก

```bash
cd /root/MC-Server

# เพิ่มไฟล์ทั้งหมด
git add .

# Commit
git commit -m "Initial commit"

# Push
git push -u origin main
```

### ขั้นตอนที่ 4: เริ่มใช้งาน Auto Git Push

```bash
cd /root/MC-Server

# ให้สิทธิ์ execute
chmod +x auto_git_push.sh
chmod +x auto_git_push_daemon.sh

# สร้างโฟลเดอร์ logs
mkdir -p logs

# เริ่มด้วย PM2
pm2 start ecosystem.auto-git.config.js

# ดูสถานะ
pm2 status

# ดู log
pm2 logs auto-git-push
```

---

## 📊 การใช้งาน

### คำสั่งพื้นฐาน

```bash
# ดูสถานะ
pm2 status auto-git-push

# ดู log แบบ real-time
pm2 logs auto-git-push

# ดู log ทั้งหมด
cat /root/MC-Server/auto_git_push.log

# หยุดการทำงาน
pm2 stop auto-git-push

# เริ่มใหม่
pm2 start auto-git-push

# รีสตาร์ท
pm2 restart auto-git-push

# ลบออกจาก PM2
pm2 delete auto-git-push
```

### ตรวจสอบการทำงาน

```bash
# ดู log ล่าสุด
tail -f /root/MC-Server/auto_git_push.log

# ดู log ของ PM2
pm2 logs auto-git-push --lines 50

# ตรวจสอบ Git status
cd /root/MC-Server
git status
```

---

## 🔧 การตั้งค่า

### เปลี่ยนความถี่ในการตรวจสอบ

แก้ไขไฟล์ `auto_git_push_daemon.sh`:

```bash
nano /root/MC-Server/auto_git_push_daemon.sh

# เปลี่ยนบรรทัด:
sleep 30  # 30 วินาที

# เป็น:
sleep 60  # 1 นาที
sleep 300 # 5 นาที
```

จากนั้นรีสตาร์ท:
```bash
pm2 restart auto-git-push
```

### เพิ่มไฟล์ที่ไม่ต้องการ push

สร้างหรือแก้ไขไฟล์ `.gitignore`:

```bash
nano /root/MC-Server/.gitignore
```

เพิ่ม:
```
# Minecraft Server
minecraft_server/logs/
minecraft_server/cache/
minecraft_server/world/
minecraft_server/world_nether/
minecraft_server/world_the_end/
minecraft_server/*.jar
minecraft_server/plugins/*.jar

# Auto Git Push
auto_git_push.log

# Temporary files
*.tmp
*.log
```

### ตั้งค่า Auto Start เมื่อ Reboot

```bash
# บันทึก PM2 process list
pm2 save

# ตั้งค่า startup script
pm2 startup

# รันคำสั่งที่ PM2 แนะนำ (จะขึ้นหลังจากรัน pm2 startup)
```

---

## 📝 ตัวอย่าง Log

```
[2025-12-11 01:35:00] 🚀 Auto Git Push เริ่มทำงาน...
[2025-12-11 01:35:00] ✓ ไม่มีไฟล์ใหม่หรือการเปลี่ยนแปลง
[2025-12-11 01:35:00] ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[2025-12-11 01:35:30] 🚀 Auto Git Push เริ่มทำงาน...
[2025-12-11 01:35:30] 📦 พบไฟล์ที่เปลี่ยนแปลง: 3 ไฟล์
[2025-12-11 01:35:30] 📄 ไฟล์ที่เปลี่ยนแปลง:
[2025-12-11 01:35:30]    - README.md
[2025-12-11 01:35:30]    - auto_git_push.sh
[2025-12-11 01:35:30]    - AUTO_GIT_PUSH_GUIDE.md
[2025-12-11 01:35:30] ✅ Commit สำเร็จ: Auto commit: 2025-12-11 01:35:30 - 3 files changed
[2025-12-11 01:35:30] 🚀 กำลัง Push ไปยัง GitHub...
[2025-12-11 01:35:32] ✅ Push สำเร็จ!
[2025-12-11 01:35:32] ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 🔍 การแก้ปัญหา

### ปัญหา: Push ล้มเหลว (Authentication failed)

**แก้ไข:**
```bash
# ตรวจสอบ remote URL
git remote -v

# ตั้งค่า remote ใหม่ด้วย Token
git remote set-url origin https://YOUR_TOKEN@github.com/YOUR_USERNAME/YOUR_REPO.git

# หรือใช้ SSH
git remote set-url origin git@github.com:YOUR_USERNAME/YOUR_REPO.git
```

### ปัญหา: ไม่มี remote repository

**แก้ไข:**
```bash
# เพิ่ม remote
git remote add origin https://YOUR_TOKEN@github.com/YOUR_USERNAME/YOUR_REPO.git

# ตรวจสอบ
git remote -v
```

### ปัญหา: Script ไม่ทำงาน

**แก้ไข:**
```bash
# ตรวจสอบสิทธิ์
chmod +x /root/MC-Server/auto_git_push.sh
chmod +x /root/MC-Server/auto_git_push_daemon.sh

# ทดสอบรันด้วยตนเอง
bash /root/MC-Server/auto_git_push.sh

# ดู log
pm2 logs auto-git-push
```

### ปัญหา: Commit ทุกครั้งแม้ไม่มีการเปลี่ยนแปลง

**แก้ไข:**
```bash
# ตรวจสอบ .gitignore
cat /root/MC-Server/.gitignore

# เพิ่มไฟล์ที่ไม่ต้องการ track
nano /root/MC-Server/.gitignore
```

---

## ⚠️ คำเตือน

1. **ไม่ควร push ไฟล์ขนาดใหญ่:**
   - ไฟล์ .jar (Plugin, Server)
   - โลก Minecraft (world/)
   - Log files

2. **ไม่ควร push ข้อมูลสำคัญ:**
   - Password
   - API Keys
   - Token
   - Database credentials

3. **GitHub มีขีดจำกัด:**
   - ไฟล์ต่อไฟล์: 100 MB
   - Repository: 1 GB (แนะนำ)
   - Push ต่อชั่วโมง: ไม่จำกัด (แต่ไม่ควรมากเกินไป)

---

## 📋 Checklist

- [ ] ตั้งค่า Git config (user.name, user.email)
- [ ] สร้าง GitHub repository
- [ ] ตั้งค่า remote (Token หรือ SSH)
- [ ] Commit และ Push ครั้งแรกสำเร็จ
- [ ] สร้าง .gitignore
- [ ] ให้สิทธิ์ execute scripts
- [ ] เริ่ม PM2 daemon
- [ ] ทดสอบการทำงาน
- [ ] ตั้งค่า PM2 startup

---

## 🎯 Quick Start

```bash
# 1. ตั้งค่า Git
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# 2. เชื่อมต่อ GitHub
cd /root/MC-Server
git remote add origin https://YOUR_TOKEN@github.com/YOUR_USERNAME/YOUR_REPO.git

# 3. Push ครั้งแรก
git add .
git commit -m "Initial commit"
git push -u origin main

# 4. เริ่ม Auto Git Push
chmod +x auto_git_push.sh auto_git_push_daemon.sh
mkdir -p logs
pm2 start ecosystem.auto-git.config.js
pm2 save

# 5. ตรวจสอบ
pm2 logs auto-git-push
```

---

## 📊 สรุป

### ไฟล์ที่สร้าง:
1. **auto_git_push.sh** - Script หลัก
2. **auto_git_push_daemon.sh** - Daemon wrapper
3. **ecosystem.auto-git.config.js** - PM2 config
4. **AUTO_GIT_PUSH_GUIDE.md** - คู่มือนี้

### การทำงาน:
- ✅ ตรวจสอบทุก 30 วินาที
- ✅ Auto commit ถ้ามีไฟล์ใหม่
- ✅ Auto push ขึ้น GitHub
- ✅ บันทึก log ทุกการทำงาน
- ✅ รันเป็น daemon ด้วย PM2

---

**ระบบพร้อมใช้งาน! ไฟล์ใหม่จะถูก push ขึ้น GitHub อัตโนมัติทุก 30 วินาที! 🚀**
