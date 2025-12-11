# 🎮 คู่มือ Plugin สำหรับ Ovenx Shop Server

## 📦 Plugin ที่ติดตั้งแล้ว

### 🔐 ระบบความปลอดภัย
1. **AuthMe** - ระบบ Login/Register
   - คำสั่ง: `/register <password> <confirm>`, `/login <password>`
   - ป้องกันการเข้าถึงบัญชีผู้เล่นโดยไม่ได้รับอนุญาต

2. **LuckPerms** - จัดการสิทธิ์และกลุ่ม
   - คำสั่ง: `/lp user <player> permission set <permission>`
   - เว็บแก้ไข: `/lp editor`

3. **GriefPrevention** - ป้องกันการทำลาย
   - คำสั่ง: `/claim` (ใช้ Golden Shovel คลิกมุม)
   - `/trust <player>` - ให้สิทธิ์ผู้เล่นอื่น

### 💰 ระบบเศรษฐกิจ
1. **Vault** - ระบบเงินหลัก
   - ใช้ร่วมกับ plugin อื่นๆ

2. **ChestShop** - ร้านค้าอัตโนมัติ
   - สร้างป้าย: `[ชื่อผู้เล่น]` / `จำนวน` / `B ราคาซื้อ:S ราคาขาย` / `ชื่อไอเทม`

3. **AuctionHouse** - ระบบประมูล
   - คำสั่ง: `/ah sell <price>` - ขายของในมือ
   - `/ah` - เปิดหน้าต่างประมูล

4. **Jobs Reborn** - ระบบอาชีพ
   - คำสั่ง: `/jobs browse` - เลือกอาชีพ
   - `/jobs join <job>` - เข้าร่วมอาชีพ
   - อาชีพ: Miner, Builder, Woodcutter, Farmer, Hunter, Fisherman

### ⚔️ ระบบ RPG
1. **mcMMO** - ระบบสกิลและเลเวล
   - คำสั่ง: `/mcstats` - ดูสถิติ
   - `/mctop` - ดูอันดับ
   - สกิล: Mining, Woodcutting, Herbalism, Excavation, Fishing, Unarmed, Archery, Swords, Axes, Taming, Repair, Acrobatics

2. **VeinMiner** - ขุดแร่เป็นกลุ่ม
   - กด Sneak + ขุด = ขุดเส้นแร่ทั้งหมด

### 🛠️ ระบบยูทิลิตี้
1. **EssentialsX** - คำสั่งพื้นฐาน
   - `/home` - กลับบ้าน
   - `/sethome <name>` - ตั้งบ้าน
   - `/spawn` - กลับจุดเกิด
   - `/tpa <player>` - ขอวาร์ป
   - `/warp <name>` - วาร์ปไปยังจุดต่างๆ

2. **WorldEdit** - แก้ไขโลก (Admin)
   - `//wand` - เอาไม้วาง
   - `//set <block>` - เปลี่ยนบลอก
   - `//copy`, `//paste` - คัดลอกและวาง

3. **WorldGuard** - ป้องกันพื้นที่
   - `/rg define <name>` - สร้างเขต
   - `/rg flag <region> <flag> <value>` - ตั้งค่า

### 🎨 ระบบตกแต่ง
1. **SkinsRestorer** - เปลี่ยน Skin
   - คำสั่ง: `/skin set <name>` - เปลี่ยน skin
   - `/skin clear` - ลบ skin

2. **DecentHolograms** - ข้อความลอย
   - คำสั่ง: `/dh create <name> <text>` - สร้าง hologram
   - `/dh delete <name>` - ลบ hologram
   - `/dh addline <name> <text>` - เพิ่มบรรทัด

3. **TAB** - แสดงข้อมูลบน Tablist และ Scoreboard
   - แก้ไขไฟล์ config ใน `/plugins/TAB/`

### 🌍 ระบบโลก
1. **Multiverse-Core** - จัดการหลายโลก
   - `/mv create <name> <type>` - สร้างโลกใหม่
   - `/mv tp <world>` - วาร์ปไปโลก
   - `/mv list` - ดูรายการโลก

2. **Geyser & Floodgate** - รองรับ Bedrock Edition
   - ผู้เล่น Bedrock สามารถเข้าเล่นได้โดยไม่ต้อง Java Edition

### 💬 ระบบสื่อสาร
1. **DiscordSRV** - เชื่อมต่อกับ Discord
   - ตั้งค่าใน `/plugins/DiscordSRV/config.yml`
   - ต้องใส่ Bot Token จาก Discord Developer Portal

2. **EssentialsXChat** - ระบบแชท
   - รองรับ Chat Format และ Nickname Colors

### 👥 ระบบ NPC
1. **Citizens** - สร้าง NPC
   - คำสั่ง: `/npc create <name>` - สร้าง NPC
   - `/npc select` - เลือก NPC
   - `/npc skin <name>` - เปลี่ยน skin NPC

### 📊 ระบบอื่นๆ
1. **PlaceholderAPI** - ตัวแปรสำหรับ plugin อื่น
   - `/papi ecloud download <expansion>` - ดาวน์โหลด expansion
   - `/papi parse <player> <placeholder>` - ทดสอบ placeholder

## 🎯 คำแนะนำการตั้งค่าให้น่าเล่น

### 1. ตั้งค่าระบบเศรษฐกิจ
```bash
# ให้เงินเริ่มต้นกับผู้เล่นใหม่
# แก้ไขใน /plugins/Essentials/config.yml
starting-balance: 1000

# ตั้งค่าอาชีพให้ได้เงินเยอะขึ้น
# แก้ไขใน /plugins/Jobs/generalConfig.yml
```

### 2. สร้างเควสและภารกิจ
- ใช้ Citizens สร้าง NPC ให้เควส
- ใช้ mcMMO สร้างความท้าทายในการเลเวลสกิล
- ใช้ Jobs ให้ผู้เล่นมีรายได้จากการทำงาน

### 3. ตกแต่ง Spawn
- ใช้ WorldEdit สร้างสิ่งก่อสร้างสวยๆ
- ใช้ DecentHolograms ใส่ข้อความแนะนำ
- ใช้ Citizens วาง NPC ให้ข้อมูล

### 4. สร้างระบบ PvP/PvE
- ใช้ WorldGuard สร้างเขต PvP และ Safe Zone
- ใช้ mcMMO ให้การต่อสู้มีความท้าทาย
- ใช้ GriefPrevention ป้องกันการทำลายในเขต Safe

### 5. เชื่อมต่อ Discord
```yaml
# แก้ไขใน /plugins/DiscordSRV/config.yml
BotToken: "YOUR_BOT_TOKEN_HERE"
Channels:
  global: "CHANNEL_ID"
```

### 6. ตั้งค่า TAB และ Scoreboard
```yaml
# แก้ไขใน /plugins/TAB/config.yml
# แสดงข้อมูล: ชื่อ, เงิน, เลเวล, อาชีพ
```

### 7. สร้างแผนที่ออนไลน์ (ถ้า Dynmap ทำงาน)
```bash
# เข้าดูแผนที่ได้ที่ http://192.168.1.13:8123
```

## 🚀 Plugin เพิ่มเติมที่แนะนำ

### ดาวน์โหลดด้วยตนเอง:
1. **MythicMobs** - มอนสเตอร์พิเศษ (https://mythiccraft.io/)
2. **Quests** - ระบบเควส (https://github.com/PikaMug/Quests)
3. **MyPet** - เลี้ยงสัตว์เลี้ยง (https://mypet-plugin.de/)
4. **CoreProtect** - บันทึกการเปลี่ยนแปลง (https://coreprotect.net/)
5. **Dynmap** - แผนที่ออนไลน์ (https://www.spigotmc.org/resources/dynmap.274/)
6. **CratesPlus** - กล่องสุ่มของรางวัล
7. **LevelledMobs** - มอนสเตอร์มีเลเวล
8. **CustomCrafting** - สูตรคราฟท์พิเศษ
9. **HeadDatabase** - หัวตกแต่ง
10. **SimpleClans** - ระบบแคลน

## 📝 คำสั่งสำคัญสำหรับ Admin

```bash
# จัดการ Plugin
/plugins - ดูรายการ plugin
/reload confirm - รีโหลด server (ไม่แนะนำ)

# จัดการผู้เล่น
/op <player> - ให้สิทธิ์ admin
/deop <player> - ถอดสิทธิ์ admin
/kick <player> - เตะผู้เล่น
/ban <player> - แบนผู้เล่น

# จัดการโลก
/mv create <name> normal - สร้างโลก Overworld
/mv create <name> nether - สร้างโลก Nether
/mv create <name> end - สร้างโลก End

# จัดการเงิน
/eco give <player> <amount> - ให้เงิน
/eco take <player> <amount> - เอาเงิน
/eco set <player> <amount> - ตั้งเงิน

# จัดการสิทธิ์
/lp user <player> parent add <group> - เพิ่มกลุ่ม
/lp creategroup <name> - สร้างกลุ่มใหม่
/lp group <group> permission set <permission> - ให้สิทธิ์กลุ่ม
```

## 🎨 ไอเดียทำให้ Server น่าเล่น

1. **สร้างระบบอันดับ**
   - ใช้ mcMMO Power Level
   - ใช้ Jobs Total Level
   - ใช้ Vault Balance

2. **จัดอีเวนต์**
   - PvP Tournament
   - Building Contest
   - Treasure Hunt
   - Boss Fight Event

3. **สร้างเมืองและร้านค้า**
   - ให้ผู้เล่นสร้างร้านด้วย ChestShop
   - สร้าง Shopping District
   - ใช้ WorldGuard ป้องกันพื้นที่

4. **ระบบรางวัล**
   - Daily Login Rewards
   - Vote Rewards
   - Achievement Rewards

5. **Custom Items**
   - ใช้ WorldEdit สร้างของพิเศษ
   - ใช้ Enchantments พิเศษ

## 🔧 การแก้ปัญหา

### Plugin ไม่ทำงาน
1. ตรวจสอบ log ใน `/logs/latest.log`
2. ตรวจสอบเวอร์ชัน Minecraft และ Plugin ว่าตรงกัน
3. ตรวจสอบ dependencies (plugin ที่ต้องใช้ร่วม)

### Server ช้า
1. ใช้ `/spark profiler` ตรวจสอบ performance
2. ลด render distance ใน server.properties
3. ใช้ Paper แทน Spigot (เร็วกว่า)

### ผู้เล่นเข้าไม่ได้
1. ตรวจสอบ Port Forwarding
2. ตรวจสอบ Firewall
3. ตรวจสอบ whitelist.json

## 📞 ติดต่อและสนับสนุน

- Discord: สร้าง Discord Server เพื่อสื่อสารกับผู้เล่น
- Website: สร้างเว็บไซต์แนะนำ Server
- Vote Sites: ลงทะเบียนใน Server List เพื่อให้ผู้เล่นโหวต

---

**สนุกกับการเล่น Minecraft! 🎮**
