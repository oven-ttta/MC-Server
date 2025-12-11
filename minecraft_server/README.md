# 🎮 Ovenx Shop Server - คู่มือฉบับสมบูรณ์

## 📖 สารบัญ

1. [ภาพรวม](#ภาพรวม)
2. [Plugin ที่ติดตั้ง](#plugin-ที่ติดตั้ง)
3. [ระบบแจ้งเตือน Resource Pack และ Shader](#ระบบแจ้งเตือน-resource-pack-และ-shader)
4. [การติดตั้งและตั้งค่า](#การติดตั้งและตั้งค่า)
5. [คู่มือการใช้งาน](#คู่มือการใช้งาน)
6. [คำสั่งสำคัญ](#คำสั่งสำคัญ)

---

## 🎯 ภาพรวม

**Ovenx Shop Server** เป็น Minecraft Server แบบ Survival ที่มีระบบครบครัน:

### ✨ ฟีเจอร์หลัก
- 🎮 **ระบบ RPG** - mcMMO พร้อม 13 สกิล
- 💼 **ระบบอาชีพ** - Jobs Reborn หาเงินจากการทำงาน
- 🏪 **ระบบเศรษฐกิจ** - ร้านค้า, ประมูล, เงินเริ่มต้น 5,000
- 🛡️ **ป้องกันการทำลาย** - GriefPrevention, WorldGuard
- 🔐 **ระบบความปลอดภัย** - AuthMe Login
- 🌍 **รองรับ Bedrock** - เล่นได้ทั้ง Java และ Bedrock Edition
- 🎨 **Resource Pack & Shader** - Faithful 64x + Sildur's Vibrant

### 📊 ข้อมูล Server
- **Version:** 1.21.x (Paper/Spigot)
- **Port:** 25565 (Java), 19132 (Bedrock)
- **เงินเริ่มต้น:** 5,000 เหรียญ
- **โบนัส:** EXP x2, เงิน x2

---

## 📦 Plugin ที่ติดตั้ง

### ระบบพื้นฐาน (15 Plugin)
1. **AuthMe** - ระบบ Login/Register
2. **EssentialsX** - คำสั่งพื้นฐาน
3. **EssentialsXChat** - ระบบแชท
4. **EssentialsXSpawn** - จัดการ Spawn
5. **LuckPerms** - จัดการสิทธิ์
6. **Vault** - ระบบเศรษฐกิจ
7. **WorldEdit** - แก้ไขโลก
8. **WorldGuard** - ป้องกันพื้นที่
9. **Geyser-Spigot** - รองรับ Bedrock
10. **Floodgate** - Bedrock Authentication
11. **CMILib** - Library
12. **PlaceholderAPI** - ตัวแปร
13. **Multiverse-Core** - หลายโลก
14. **Citizens** - NPC
15. **Spark** - Performance Monitor

### ระบบเกม (10 Plugin)
16. **mcMMO** - ระบบ RPG และสกิล
17. **Jobs Reborn** - ระบบอาชีพ
18. **ChestShop** - ร้านค้าอัตโนมัติ
19. **AuctionHouse** - ระบบประมูล
20. **VeinMiner** - ขุดแร่เป็นกลุ่ม
21. **GriefPrevention** - ป้องกันการทำลาย
22. **SkinsRestorer** - เปลี่ยน Skin
23. **DecentHolograms** - ข้อความลอย
24. **TAB** - Scoreboard สวยงาม
25. **DiscordSRV** - เชื่อมต่อ Discord

---

## 🎨 ระบบแจ้งเตือน Resource Pack และ Shader

### 📦 ไฟล์ที่มีให้ดาวน์โหลด

1. **Faithful 64x Resource Pack** (16 MB)
   - ความละเอียด 64x64 (สูงกว่าปกติ 4 เท่า)
   - รักษาสไตล์ Minecraft ดั้งเดิม
   - ไม่หนักมาก เล่นได้ลื่น

2. **Sildur's Vibrant Shaders Lite** (145 KB)
   - แสงเงาสมจริง
   - น้ำสะท้อน
   - ท้องฟ้าสวยงาม
   - เวอร์ชัน Lite ไม่หนัก

### 🔔 ระบบแจ้งเตือน

ผู้เล่นจะได้รับการแจ้งเตือนผ่าน:

1. **MOTD** - ข้อความต้อนรับเมื่อเข้า Server
2. **Join Message** - ข้อความเมื่อเข้าเกม
3. **Auto Broadcast** - แจ้งเตือนทุก 10 นาที
4. **คำสั่ง /downloads** - เปิดเมนูดาวน์โหลด
5. **เว็บไซต์** - http://YOUR_SERVER_IP:8080

---

## 🚀 การติดตั้งและตั้งค่า

### ขั้นตอนที่ 1: ติดตั้ง Plugin เพิ่มเติม (ถ้าต้องการ)

```bash
cd /root/MC-Server/minecraft_server
chmod +x download_more_plugins.sh
bash download_more_plugins.sh
```

### ขั้นตอนที่ 2: ตั้งค่า Plugin อัตโนมัติ

```bash
chmod +x setup_plugins_config.sh
bash setup_plugins_config.sh
```

สิ่งที่จะตั้งค่า:
- ✅ เงินเริ่มต้น 5,000 เหรียญ
- ✅ EXP rate x2
- ✅ เงินจากงาน x2
- ✅ Claim blocks เพิ่มขึ้น
- ✅ MOTD และ Rules

### ขั้นตอนที่ 3: ตั้งค่า Download Server

```bash
chmod +x setup_download_server.sh
bash setup_download_server.sh
```

จากนั้นแก้ไข IP:
```bash
# หา IP ของ Server
curl ifconfig.me

# แทนที่ YOUR_SERVER_IP
find /root/MC-Server/minecraft_server -type f \( -name "*.txt" -o -name "*.yml" -o -name "*.html" \) \
  -exec sed -i 's/your-server-ip/YOUR_ACTUAL_IP/g' {} +
```

### ขั้นตอนที่ 4: เปิด Ports

```bash
ufw allow 25565/tcp  # Minecraft Java
ufw allow 19132/udp  # Minecraft Bedrock
ufw allow 8080/tcp   # Download Server
```

### ขั้นตอนที่ 5: รีสตาร์ท Server

```bash
cd /root/MC-Server
pm2 restart minecraft-server
```

---

## 📚 คู่มือการใช้งาน

### สำหรับผู้เล่น

#### เริ่มต้นเล่น
1. เข้า Server: `your-server-ip:25565`
2. สมัครสมาชิก: `/register <password> <confirm>`
3. เข้าสู่ระบบ: `/login <password>`
4. เลือกอาชีพ: `/jobs browse`
5. สร้างพื้นที่: `/claim` (ใช้ Golden Shovel)

#### ดาวน์โหลด Resource Pack และ Shader
1. พิมพ์ `/downloads` ในเกม
2. หรือเข้า http://YOUR_SERVER_IP:8080
3. ดาวน์โหลดไฟล์ทั้งสอง
4. ติดตั้งตามคำแนะนำในเว็บ

#### หาเงิน
- ทำงานตามอาชีพที่เลือก
- ขายของใน `/ah` (Auction House)
- สร้างร้านด้วย ChestShop
- รับ Kit ประจำวัน: `/kit daily`

#### เลเวลสกิล (mcMMO)
- ขุดแร่ → Mining
- ตัดไม้ → Woodcutting
- เก็บพืช → Herbalism
- ต่อสู้ → Combat Skills
- ดูสถิติ: `/mcstats`

### สำหรับ Admin

#### จัดการผู้เล่น
```bash
/op <player>              # ให้สิทธิ์ admin
/deop <player>            # ถอดสิทธิ์ admin
/lp user <player> parent add vip  # เพิ่มกลุ่ม
```

#### จัดการเงิน
```bash
/eco give <player> <amount>   # ให้เงิน
/eco take <player> <amount>   # เอาเงิน
/eco set <player> <amount>    # ตั้งเงิน
```

#### จัดการโลก
```bash
/setwarp <name>           # สร้างจุดวาร์ป
/warp <name>              # วาร์ปไป
/rg define <name>         # สร้างเขต
/rg flag <region> <flag>  # ตั้งค่าเขต
```

#### สร้าง NPC และ Hologram
```bash
/npc create <name>        # สร้าง NPC
/npc skin <name>          # เปลี่ยน skin NPC
/dh create <name> <text>  # สร้าง Hologram
/dh addline <name> <text> # เพิ่มบรรทัด
```

---

## 💻 คำสั่งสำคัญ

### คำสั่งทั่วไป
| คำสั่ง | คำอธิบาย |
|--------|----------|
| `/help` | ดูคำสั่งทั้งหมด |
| `/rules` | ดูกฎของ Server |
| `/downloads` | ดาวน์โหลด Resource Pack |
| `/spawn` | กลับจุดเกิด |
| `/home` | กลับบ้าน |
| `/sethome <name>` | ตั้งบ้าน |
| `/warp <name>` | วาร์ปไปยังจุดต่างๆ |
| `/tpa <player>` | ขอวาร์ปหาผู้เล่น |

### คำสั่งเศรษฐกิจ
| คำสั่ง | คำอธิบาย |
|--------|----------|
| `/bal` | ดูเงิน |
| `/baltop` | ดูอันดับคนรวย |
| `/pay <player> <amount>` | โอนเงิน |
| `/ah` | เปิดตลาดประมูล |
| `/ah sell <price>` | ขายของในมือ |

### คำสั่งอาชีพ
| คำสั่ง | คำอธิบาย |
|--------|----------|
| `/jobs browse` | เลือกอาชีพ |
| `/jobs join <job>` | เข้าร่วมอาชีพ |
| `/jobs leave <job>` | ออกจากอาชีพ |
| `/jobs info <job>` | ดูข้อมูลอาชีพ |
| `/jobs stats` | ดูสถิติ |

### คำสั่ง mcMMO
| คำสั่ง | คำอธิบาย |
|--------|----------|
| `/mcstats` | ดูสถิติสกิล |
| `/mctop` | ดูอันดับ |
| `/mcrank` | ดูอันดับของตัวเอง |
| `/<skill>` | ดูข้อมูลสกิล |

### คำสั่งพื้นที่
| คำสั่ง | คำอธิบาย |
|--------|----------|
| `/claim` | สร้างพื้นที่ (ใช้ Golden Shovel) |
| `/abandonclaim` | ลบพื้นที่ |
| `/trust <player>` | ให้สิทธิ์ผู้เล่น |
| `/untrust <player>` | ถอดสิทธิ์ผู้เล่น |
| `/claimslist` | ดูรายการพื้นที่ |

---

## 📁 ไฟล์คู่มือทั้งหมด

1. **README.md** (ไฟล์นี้) - คู่มือหลัก
2. **SETUP_SUMMARY.md** - สรุปการติดตั้งและตั้งค่า
3. **PLUGINS_GUIDE.md** - คู่มือการใช้งาน Plugin ทั้งหมด
4. **SERVER_ENHANCEMENT_IDEAS.md** - ไอเดียทำให้ Server น่าเล่น
5. **DOWNLOAD_NOTIFICATION_GUIDE.md** - คู่มือระบบแจ้งเตือนดาวน์โหลด

---

## 🛠️ สคริปต์ที่มีให้ใช้

1. **download_more_plugins.sh** - ดาวน์โหลด Plugin เพิ่มเติม
2. **setup_plugins_config.sh** - ตั้งค่า Plugin อัตโนมัติ
3. **setup_download_server.sh** - ตั้งค่า Web Server สำหรับดาวน์โหลด

---

## 🎯 Quick Start

### สำหรับผู้เล่น
```
1. เข้า Server: your-server-ip:25565
2. สมัคร: /register <password> <confirm>
3. ดาวน์โหลด: /downloads
4. เลือกอาชีพ: /jobs browse
5. สร้างพื้นที่: /claim
6. เริ่มเล่น!
```

### สำหรับ Admin
```bash
# ตั้งค่าครั้งแรก
cd /root/MC-Server/minecraft_server
bash setup_plugins_config.sh
bash setup_download_server.sh

# แก้ไข IP
sed -i 's/your-server-ip/YOUR_IP/g' plugins/Essentials/messages/*.txt

# รีสตาร์ท
pm2 restart minecraft-server
```

---

## 📞 ติดต่อและสนับสนุน

- **Discord:** discord.gg/yourserver
- **Website:** your-website.com
- **Downloads:** http://YOUR_SERVER_IP:8080

---

## ⚠️ หมายเหตุสำคัญ

1. **แก้ไข IP Address** ในไฟล์ทั้งหมดให้เป็น IP จริงของ Server
2. **เปิด Ports** ที่จำเป็น (25565, 19132, 8080)
3. **ตั้งค่า DiscordSRV** ถ้าต้องการเชื่อมต่อ Discord
4. **Backup** ข้อมูลสม่ำเสมอ
5. **อัพเดท Plugin** เป็นประจำ

---

## 🎉 สนุกกับการเล่น!

Server พร้อมใช้งานแล้ว! หากมีปัญหาหรือข้อสงสัย ให้อ่านคู่มือใน `PLUGINS_GUIDE.md` หรือ `SETUP_SUMMARY.md`

**ขอให้โชคดีกับ Server! 🚀**
