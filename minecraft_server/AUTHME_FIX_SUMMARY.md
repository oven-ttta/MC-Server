# ✅ สรุปการแก้ไข AuthMe - รองรับภาษาไทยและไม่มี Timeout

## 🎯 ปัญหาที่แก้ไข

1. **ไม่สามารถใช้ชื่อภาษาไทยได้** - แสดง error "illegal characters"
2. **ถูก kick ออกก่อนพิมพ์เสร็จ** - มีเวลาแค่ 30 วินาทีในการ login/register

## ⚙️ การแก้ไข

### ไฟล์: `/root/MC-Server/minecraft_server/plugins/AuthMe/config.yml`

```yaml
# บรรทัด 196 - รองรับ Unicode ทุกภาษา
allowedNicknameCharacters: ".*"

# บรรทัด 193 - ปิดการ timeout (ไม่ kick ผู้เล่น)
timeout: 0
```

## 🚀 ผลลัพธ์

✅ **รองรับชื่อภาษาไทย** - ผู้เล่นสามารถใช้ชื่อภาษาไทยได้แล้ว  
✅ **ไม่มีการ timeout** - มีเวลาไม่จำกัดในการพิมพ์ `/register` หรือ `/login`  
✅ **ยังคงได้รับการเตือน** - ระบบจะแสดงข้อความเตือนทุกๆ 5 วินาที  
✅ **Server Online** - พร้อมใช้งานแล้ว

## 📝 วิธีใช้งาน

### สำหรับผู้เล่นใหม่:
```
/register <รหัสผ่าน> <รหัสผ่านอีกครั้ง>
```

### สำหรับผู้เล่นเก่า:
```
/login <รหัสผ่าน>
```

## 🔄 Restart Server

หากต้องการ restart server:
```bash
pm2 restart minecraft
```

หรือดู status:
```bash
pm2 list
pm2 logs minecraft
```

---

**อัพเดท:** 2025-12-14 01:22 UTC  
**Status:** ✅ Online และพร้อมใช้งาน
