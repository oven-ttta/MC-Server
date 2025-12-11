# 🎮 คู่มือการรองรับ Minecraft หลายเวอร์ชัน

## 📋 ภาพรวม

เพื่อให้ผู้เล่นที่ใช้ Minecraft เวอร์ชันต่างๆ สามารถเล่นด้วยกันได้ คุณต้องติดตั้ง Plugin ชุด ViaVersion

### ✅ Plugin ที่ต้องติดตั้ง

1. **ViaVersion** - รองรับเวอร์ชันใหม่กว่า Server
2. **ViaBackwards** - รองรับเวอร์ชันเก่ากว่า Server  
3. **ViaRewind** - รองรับเวอร์ชันเก่ามากๆ (1.8-1.9)

### 📊 เวอร์ชันที่รองรับ

ถ้า Server ของคุณเป็น **1.21.4** และติดตั้ง Plugin ครบ:

| Plugin | รองรับเวอร์ชัน |
|--------|----------------|
| ไม่มี Plugin | 1.21.4 เท่านั้น |
| ViaVersion | 1.21.4 และใหม่กว่า |
| ViaVersion + ViaBackwards | 1.17 - 1.21.4+ |
| ViaVersion + ViaBackwards + ViaRewind | 1.8 - 1.21.4+ |

**สรุป: ติดตั้งครบทั้ง 3 ตัว = รองรับ Minecraft 1.8 ถึง 1.21.4+** 🎉

---

## 🚀 วิธีติดตั้ง

### วิธีที่ 1: ดาวน์โหลดด้วยตนเอง (แนะนำ)

#### 1. ดาวน์โหลดไฟล์

เข้าไปดาวน์โหลดจากเว็บไซต์:

**ViaVersion:**
- https://www.spigotmc.org/resources/viaversion.19254/
- หรือ https://modrinth.com/plugin/viaversion
- หรือ https://hangar.papermc.io/ViaVersion/ViaVersion

**ViaBackwards:**
- https://www.spigotmc.org/resources/viabackwards.27448/
- หรือ https://modrinth.com/plugin/viabackwards
- หรือ https://hangar.papermc.io/ViaVersion/ViaBackwards

**ViaRewind:**
- https://www.spigotmc.org/resources/viarewind.52109/
- หรือ https://github.com/ViaVersion/ViaRewind/releases

#### 2. อัพโหลดไฟล์

```bash
# วิธีที่ 1: ใช้ SCP/SFTP
# อัพโหลดไฟล์ .jar ทั้ง 3 ไปที่:
# /root/MC-Server/minecraft_server/plugins/

# วิธีที่ 2: ใช้ wget (ถ้ามี direct link)
cd /root/MC-Server/minecraft_server/plugins
wget YOUR_DIRECT_DOWNLOAD_LINK -O ViaVersion.jar
wget YOUR_DIRECT_DOWNLOAD_LINK -O ViaBackwards.jar
# ViaRewind ดาวน์โหลดสำเร็จแล้ว
```

#### 3. รีสตาร์ท Server

```bash
pm2 restart minecraft
```

### วิธีที่ 2: ใช้สคริปต์อัตโนมัติ

```bash
cd /root/MC-Server/minecraft_server
chmod +x install_viaversion.sh
bash install_viaversion.sh
```

---

## ✅ ตรวจสอบการติดตั้ง

### 1. ตรวจสอบไฟล์

```bash
ls -lh /root/MC-Server/minecraft_server/plugins/Via*.jar
```

ควรเห็น:
- ViaVersion.jar (ประมาณ 1-2 MB)
- ViaBackwards.jar (ประมาณ 1-2 MB)
- ViaRewind.jar (ประมาณ 300-400 KB) ✅ ติดตั้งแล้ว

### 2. ตรวจสอบใน Server

เข้าเกมแล้วพิมพ์:
```
/plugins
```

ควรเห็น:
- [✓] ViaVersion
- [✓] ViaBackwards
- [✓] ViaRewind

### 3. ตรวจสอบเวอร์ชันที่รองรับ

```
/viaversion
```

จะแสดงข้อมูลเวอร์ชันที่รองรับ

---

## 🎯 สถานะปัจจุบัน

### ✅ ติดตั้งแล้ว:
- **ViaRewind** (367 KB) - รองรับ 1.8-1.9

### ❌ ต้องติดตั้งเพิ่ม:
- **ViaVersion** - ดาวน์โหลดด้วยตนเอง
- **ViaBackwards** - ดาวน์โหลดด้วยตนเอง

---

## 📝 คำแนะนำ

### ลำดับการติดตั้ง (สำคัญ!)

1. ติดตั้ง **ViaVersion** ก่อน (ตัวหลัก)
2. ติดตั้ง **ViaBackwards** (ต้องมี ViaVersion)
3. ติดตั้ง **ViaRewind** (ต้องมี ViaVersion) ✅ มีแล้ว

### เวอร์ชันที่แนะนำ

สำหรับ Minecraft 1.21.4:
- ViaVersion 5.1.2+
- ViaBackwards 5.1.2+
- ViaRewind 4.0.3+ ✅ มีแล้ว

### การตั้งค่า

Plugin เหล่านี้ไม่ต้องตั้งค่าอะไร ติดตั้งแล้วใช้ได้เลย!

ถ้าต้องการปรับแต่ง:
```bash
nano /root/MC-Server/minecraft_server/plugins/ViaVersion/config.yml
nano /root/MC-Server/minecraft_server/plugins/ViaBackwards/config.yml
nano /root/MC-Server/minecraft_server/plugins/ViaRewind/config.yml
```

---

## 🔧 การแก้ปัญหา

### ปัญหา: Plugin ไม่ทำงาน

**แก้ไข:**
1. ตรวจสอบว่าติดตั้ง ViaVersion ก่อน
2. ตรวจสอบเวอร์ชัน Plugin ให้ตรงกับ Minecraft
3. ดู log: `pm2 logs minecraft`

### ปัญหา: ผู้เล่นเวอร์ชันเก่าเข้าไม่ได้

**แก้ไข:**
1. ตรวจสอบว่าติดตั้ง ViaBackwards และ ViaRewind แล้ว
2. รีสตาร์ท Server
3. ตรวจสอบ config ว่าเปิดใช้งาน

### ปัญหา: มี Bug หรือ Glitch

**หมายเหตุ:** 
- เวอร์ชันเก่าอาจมี Bug เล็กน้อย (เช่น บล็อกบางอย่างไม่แสดง)
- แนะนำให้ผู้เล่นใช้เวอร์ชันใหม่เพื่อประสบการณ์ที่ดีที่สุด

---

## 📦 ลิงก์ดาวน์โหลด

### ViaVersion
- **SpigotMC:** https://www.spigotmc.org/resources/viaversion.19254/
- **Modrinth:** https://modrinth.com/plugin/viaversion
- **Hangar:** https://hangar.papermc.io/ViaVersion/ViaVersion
- **GitHub:** https://github.com/ViaVersion/ViaVersion/releases

### ViaBackwards
- **SpigotMC:** https://www.spigotmc.org/resources/viabackwards.27448/
- **Modrinth:** https://modrinth.com/plugin/viabackwards
- **Hangar:** https://hangar.papermc.io/ViaVersion/ViaBackwards
- **GitHub:** https://github.com/ViaVersion/ViaBackwards/releases

### ViaRewind
- **SpigotMC:** https://www.spigotmc.org/resources/viarewind.52109/
- **GitHub:** https://github.com/ViaVersion/ViaRewind/releases ✅ ดาวน์โหลดแล้ว

---

## 🎉 ผลลัพธ์

เมื่อติดตั้งครบทั้ง 3 Plugin:

### ผู้เล่นสามารถเข้าเล่นได้ด้วย:
- ✅ Minecraft 1.8.x
- ✅ Minecraft 1.9.x - 1.12.x
- ✅ Minecraft 1.13.x - 1.16.x
- ✅ Minecraft 1.17.x - 1.20.x
- ✅ Minecraft 1.21.x
- ✅ Minecraft 1.21.4 (เวอร์ชัน Server)
- ✅ Minecraft เวอร์ชันใหม่กว่า (ถ้ามี)

### ข้อดี:
- ✅ ผู้เล่นไม่ต้องอัพเดทเกม
- ✅ เพื่อนเล่นด้วยกันได้ทุกเวอร์ชัน
- ✅ เพิ่มจำนวนผู้เล่นที่เข้าได้

### ข้อควรระวัง:
- ⚠️ เวอร์ชันเก่ามากอาจมี Bug เล็กน้อย
- ⚠️ ฟีเจอร์ใหม่อาจไม่แสดงในเวอร์ชันเก่า
- ⚠️ แนะนำให้ผู้เล่นใช้ 1.20+ เพื่อประสบการณ์ที่ดี

---

## 📋 Checklist

- [x] ดาวน์โหลด ViaRewind
- [ ] ดาวน์โหลด ViaVersion
- [ ] ดาวน์โหลด ViaBackwards
- [ ] อัพโหลดไฟล์ไปยัง plugins/
- [ ] รีสตาร์ท Server
- [ ] ทดสอบด้วยเวอร์ชันต่างๆ

---

## 🚀 Quick Start

```bash
# 1. ดาวน์โหลดไฟล์จากเว็บไซต์
# 2. อัพโหลดไปยัง /root/MC-Server/minecraft_server/plugins/
# 3. รีสตาร์ท
pm2 restart minecraft

# 4. ตรวจสอบ
pm2 logs minecraft | grep -i via
```

---

**หลังจากติดตั้งครบ Server จะรองรับ Minecraft 1.8 - 1.21.4+! 🎮**
