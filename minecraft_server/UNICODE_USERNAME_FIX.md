# 🌏 การแก้ไขปัญหารองรับชื่อผู้เล่นภาษาไทยและ Unicode

## 📋 สรุปปัญหา
เมื่อผู้เล่นพยายามเข้าเกมด้วยชื่อที่มีตัวอักษรภาษาไทยหรืออักขระพิเศษ จะได้รับข้อความ error:
```
Your username contains illegal characters. Allowed chars: [a-zN-Z0-9_]
```

## ✅ การแก้ไขที่ทำไปแล้ว

### 1. แก้ไขการตั้งค่า AuthMe
ไฟล์: `/root/MC-Server/minecraft_server/plugins/AuthMe/config.yml`

**เปลี่ยนจาก:**
```yaml
allowedNicknameCharacters: '[a-zA-Z0-9_]*'
```

**เป็น:**
```yaml
allowedNicknameCharacters: '.*'
```

การเปลี่ยนแปลงนี้จะ:
- ✅ รองรับตัวอักษรภาษาไทย (ก-ฮ, ะ-ฺ)
- ✅ รองรับตัวอักษร Unicode ทุกภาษา (จีน, ญี่ปุ่น, เกาหลี, อารบิก, ฯลฯ)
- ✅ รองรับอักขระพิเศษ (emoji, สัญลักษณ์ต่างๆ)
- ✅ ยังคงรองรับชื่อภาษาอังกฤษแบบเดิม

### 2. Restart Server
ใช้คำสั่ง PM2 เพื่อ restart server:
```bash
pm2 restart minecraft
```

## 🎮 วิธีทดสอบ

ผู้เล่นสามารถเข้าเกมด้วยชื่อต่างๆ เช่น:
- ชื่อภาษาไทย: `ผู้เล่น`, `แอดมิน`, `โอเว่น`
- ชื่อผสม: `Player123`, `Admin_TH`, `โอเว่น2024`
- ชื่อภาษาอื่น: `玩家`, `プレイヤー`, `플레이어`

## ⚠️ ข้อควรระวัง

### ความยาวชื่อผู้เล่น
การตั้งค่าปัจจุบันใน AuthMe:
```yaml
minNicknameLength: 3      # ชื่อสั้นสุด 3 ตัวอักษร
maxNicknameLength: 16     # ชื่อยาวสุด 16 ตัวอักษร
```

**หมายเหตุ:** ตัวอักษรภาษาไทย 1 ตัว = 1 character ดังนั้นชื่อภาษาไทยยาวสุด 16 ตัวอักษร

### การลงทะเบียนต่อ IP
```yaml
maxRegPerIp: 1  # อนุญาตให้ลงทะเบียนได้ 1 account ต่อ IP
```

หากต้องการให้ผู้เล่นสามารถสร้างหลาย account จาก IP เดียวกัน ให้เปลี่ยนเป็น:
```yaml
maxRegPerIp: 0  # ไม่จำกัดจำนวน account ต่อ IP
```

## 🔧 การปรับแต่งเพิ่มเติม

### หากต้องการจำกัดเฉพาะบางอักขระ
แก้ไขไฟล์ `/root/MC-Server/minecraft_server/plugins/AuthMe/config.yml` บรรทัด 195:

**ภาษาไทย + ภาษาอังกฤษ + ตัวเลข:**
```yaml
allowedNicknameCharacters: '[a-zA-Z0-9_ก-๙]*'
```

**ภาษาไทย + ภาษาอังกฤษ + ตัวเลข + อักขระพิเศษบางตัว:**
```yaml
allowedNicknameCharacters: '[a-zA-Z0-9_ก-๙\-\.]*'
```

### Reload การตั้งค่าโดยไม่ต้อง restart server
หากต้องการแก้ไขการตั้งค่าและ reload โดยไม่ restart:

1. แก้ไขไฟล์ config.yml
2. ใช้คำสั่งใน game console (ต้องเป็น OP):
   ```
   /authme reload
   ```

หรือใช้ PM2:
```bash
pm2 restart minecraft
```

## 📊 สถานะปัจจุบัน

✅ **Server Status:** Online  
✅ **AuthMe Version:** 5.6.0-beta2-b2453  
✅ **Unicode Support:** Enabled  
✅ **Thai Language:** Supported  

## 🆘 การแก้ปัญหา

### ปัญหา: ยังคงไม่สามารถใช้ชื่อภาษาไทยได้
1. ตรวจสอบว่าไฟล์ config.yml ถูกแก้ไขแล้ว:
   ```bash
   grep "allowedNicknameCharacters" /root/MC-Server/minecraft_server/plugins/AuthMe/config.yml
   ```
   ควรแสดง: `allowedNicknameCharacters: '.*'`

2. ตรวจสอบว่า server restart แล้ว:
   ```bash
   pm2 logs minecraft --lines 20
   ```

3. Restart server อีกครั้ง:
   ```bash
   pm2 restart minecraft
   ```

### ปัญหา: ชื่อยาวเกินไป
แก้ไข `maxNicknameLength` ในไฟล์ config.yml:
```yaml
maxNicknameLength: 32  # เพิ่มจาก 16 เป็น 32
```

## 📝 หมายเหตุ

- การเปลี่ยนแปลงนี้จะมีผลกับผู้เล่นใหม่ที่ลงทะเบียนหลังจากการแก้ไข
- ผู้เล่นเก่าที่ลงทะเบียนด้วยชื่อภาษาอังกฤษแล้วยังคงใช้ชื่อเดิมได้ปกติ
- ระบบ authentication ยังคงทำงานเหมือนเดิม (login/register/password)

## 🔗 ข้อมูลเพิ่มเติม

- [AuthMe Documentation](https://github.com/AuthMe/AuthMeReloaded/wiki)
- [Regex Pattern Testing](https://regex101.com)
- [Unicode Character Ranges](https://en.wikipedia.org/wiki/List_of_Unicode_characters)

---

**อัพเดทล่าสุด:** 2025-12-14 01:10 UTC  
**ผู้ดำเนินการ:** Antigravity AI Assistant
