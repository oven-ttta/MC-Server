#!/bin/bash

# สคริปต์ตั้งค่า Plugin อัตโนมัติเพื่อทำให้ Server น่าเล่น
# ใช้งาน: bash setup_plugins_config.sh

SERVER_DIR="/root/MC-Server/minecraft_server"
PLUGINS_DIR="$SERVER_DIR/plugins"

echo "🔧 กำลังตั้งค่า Plugin..."
echo ""

# สร้าง backup ก่อน
echo "📦 สร้าง Backup config เดิม..."
mkdir -p "$SERVER_DIR/config_backup_$(date +%Y%m%d_%H%M%S)"
cp -r "$PLUGINS_DIR"/*/*.yml "$SERVER_DIR/config_backup_$(date +%Y%m%d_%H%M%S)/" 2>/dev/null
echo "   ✅ Backup สำเร็จ"
echo ""

# ตั้งค่า Essentials
echo "⚙️  ตั้งค่า EssentialsX..."
if [ -f "$PLUGINS_DIR/Essentials/config.yml" ]; then
    # เพิ่มเงินเริ่มต้น
    sed -i 's/starting-balance: .*/starting-balance: 5000/' "$PLUGINS_DIR/Essentials/config.yml"
    
    # เพิ่มจำนวน home
    sed -i 's/sethome-multiple:.*/sethome-multiple:\n    default: 3\n    vip: 10\n    mvp: 20/' "$PLUGINS_DIR/Essentials/config.yml"
    
    echo "   ✅ ตั้งค่า EssentialsX สำเร็จ"
else
    echo "   ⚠️  ไม่พบไฟล์ config"
fi
echo ""

# ตั้งค่า mcMMO
echo "⚙️  ตั้งค่า mcMMO..."
if [ -f "$PLUGINS_DIR/mcMMO/config.yml" ]; then
    # เพิ่ม EXP rate
    sed -i 's/ExperienceGainMultiplier: .*/ExperienceGainMultiplier: 2.0/' "$PLUGINS_DIR/mcMMO/config.yml"
    
    echo "   ✅ ตั้งค่า mcMMO สำเร็จ"
else
    echo "   ⚠️  ไม่พบไฟล์ config"
fi
echo ""

# ตั้งค่า Jobs
echo "⚙️  ตั้งค่า Jobs Reborn..."
if [ -f "$PLUGINS_DIR/Jobs/generalConfig.yml" ]; then
    # เพิ่มเงินที่ได้
    sed -i 's/money-boost: .*/money-boost: 2.0/' "$PLUGINS_DIR/Jobs/generalConfig.yml"
    sed -i 's/exp-boost: .*/exp-boost: 1.5/' "$PLUGINS_DIR/Jobs/generalConfig.yml"
    
    echo "   ✅ ตั้งค่า Jobs สำเร็จ"
else
    echo "   ⚠️  ไม่พบไฟล์ config"
fi
echo ""

# ตั้งค่า GriefPrevention
echo "⚙️  ตั้งค่า GriefPrevention..."
if [ -f "$PLUGINS_DIR/GriefPreventionData/config.yml" ]; then
    # เพิ่ม claim blocks
    sed -i 's/InitialBlocks: .*/InitialBlocks: 500/' "$PLUGINS_DIR/GriefPreventionData/config.yml"
    sed -i 's/BlocksAccruedPerHour: .*/BlocksAccruedPerHour: 200/' "$PLUGINS_DIR/GriefPreventionData/config.yml"
    
    echo "   ✅ ตั้งค่า GriefPrevention สำเร็จ"
else
    echo "   ⚠️  ไม่พบไฟล์ config"
fi
echo ""

# ตั้งค่า AuctionHouse
echo "⚙️  ตั้งค่า AuctionHouse..."
if [ -f "$PLUGINS_DIR/AuctionHouse/config.yml" ]; then
    # ลดค่าธรรมเนียม
    sed -i 's/listing-fee: .*/listing-fee: 50/' "$PLUGINS_DIR/AuctionHouse/config.yml"
    sed -i 's/tax: .*/tax: 0.05/' "$PLUGINS_DIR/AuctionHouse/config.yml"
    
    echo "   ✅ ตั้งค่า AuctionHouse สำเร็จ"
else
    echo "   ⚠️  ไม่พบไฟล์ config"
fi
echo ""

# ตั้งค่า VeinMiner
echo "⚙️  ตั้งค่า VeinMiner..."
if [ -f "$PLUGINS_DIR/VeinMiner/config.yml" ]; then
    # เพิ่มจำนวนบลอกที่ขุดได้
    sed -i 's/max-vein-size: .*/max-vein-size: 100/' "$PLUGINS_DIR/VeinMiner/config.yml"
    
    echo "   ✅ ตั้งค่า VeinMiner สำเร็จ"
else
    echo "   ⚠️  ไม่พบไฟล์ config"
fi
echo ""

# สร้างไฟล์ MOTD
echo "📝 สร้าง MOTD..."
cat > "$SERVER_DIR/motd.txt" << 'EOF'
&6&l╔════════════════════════════════════╗
&e&l║  ยินดีต้อนรับสู่ Ovenx Shop Server  ║
&6&l╚════════════════════════════════════╝

&a✨ ฟีเจอร์พิเศษ:
&f• ระบบ RPG (mcMMO)
&f• ระบบอาชีพ (Jobs)
&f• ร้านค้าและประมูล
&f• ป้องกันการทำลาย
&f• รองรับ Bedrock Edition

&b📌 คำสั่งสำคัญ:
&f/help - ดูคำสั่งทั้งหมด
&f/jobs - เลือกอาชีพ
&f/ah - เปิดตลาดประมูล
&f/claim - สร้างพื้นที่ส่วนตัว

&c💰 เงินเริ่มต้น: 5,000 เหรียญ
&d🎁 โบนัส EXP x2 และเงิน x2!

&e&lสนุกกับการเล่น! 🎮
EOF

echo "   ✅ สร้าง MOTD สำเร็จ"
echo ""

# สร้างไฟล์ Rules
echo "📜 สร้างกฎของ Server..."
cat > "$SERVER_DIR/rules.txt" << 'EOF'
&c&l═══════════════════════════════
&6&l        กฎของ Server
&c&l═══════════════════════════════

&e1. &fห้ามใช้โปรแกรมโกง (Hack/Cheat)
   &7➜ แบนถาวร

&e2. &fห้ามใช้ภาษาหยาบคาย
   &7➜ Mute 1 ชั่วโมง

&e3. &fห้ามทำลายของผู้อื่น
   &7➜ แบน 7 วัน

&e4. &fห้าม Spam ในแชท
   &7➜ Mute 30 นาที

&e5. &fห้ามขอของจาก Admin
   &7➜ เตือน

&e6. &fห้ามโฆษณา Server อื่น
   &7➜ แบนถาวร

&e7. &fเคารพผู้เล่นและ Staff
   &7➜ มารยาทดี

&a&l═══════════════════════════════
&b&l  ฝ่าฝืนกฎ = รับโทษ!
&a&l═══════════════════════════════
EOF

echo "   ✅ สร้างกฎสำเร็จ"
echo ""

# สร้างคำสั่งลัด
echo "⚡ สร้างคำสั่งลัด..."
cat > "$PLUGINS_DIR/Essentials/commands.yml" << 'EOF'
# คำสั่งลัดสำหรับผู้เล่น
commands:
  shop:
    - warp shop
  pvp:
    - warp pvp
  mine:
    - warp mine
  rules:
    - motd rules
  discord:
    - msg %player% &bDiscord: &fhttps://discord.gg/yourserver
EOF

echo "   ✅ สร้างคำสั่งลัดสำเร็จ"
echo ""

# สร้างไฟล์ Welcome Message
echo "👋 สร้างข้อความต้อนรับ..."
mkdir -p "$PLUGINS_DIR/Essentials/messages"
cat > "$PLUGINS_DIR/Essentials/messages/join.txt" << 'EOF'
&6&l╔════════════════════════════════════╗
&e&l║     ยินดีต้อนรับ {PLAYER}!        ║
&6&l╚════════════════════════════════════╝

&aคุณเป็นผู้เล่นคนที่ &e{ONLINE}&a บน Server!
&bพิมพ์ &f/help &bเพื่อดูคำสั่งทั้งหมด
&dพิมพ์ &f/rules &dเพื่ออ่านกฎของ Server

&c❤ &fสนุกกับการเล่น!
EOF

echo "   ✅ สร้างข้อความต้อนรับสำเร็จ"
echo ""

# สร้าง Warp Points
echo "🌍 สร้างจุด Warp..."
cat > "$SERVER_DIR/create_warps.txt" << 'EOF'
# คำสั่งสร้าง Warp (รันใน Server Console)
setwarp spawn 0 64 0
setwarp shop 100 64 0
setwarp pvp -100 64 0
setwarp mine 0 64 100
setwarp farm 0 64 -100
setwarp end 200 64 0
setwarp nether -200 64 0
EOF

echo "   ✅ สร้างรายการ Warp สำเร็จ"
echo ""

# สร้างไฟล์ Kits
echo "🎁 สร้าง Kits..."
cat > "$SERVER_DIR/create_kits.txt" << 'EOF'
# คำสั่งสร้าง Kits (รันใน Server Console)

# Kit Starter (ทุกคน)
createkit starter 86400
- WOODEN_SWORD 1
- WOODEN_PICKAXE 1
- WOODEN_AXE 1
- WOODEN_SHOVEL 1
- BREAD 16
- TORCH 32

# Kit Daily (ทุกคน)
createkit daily 86400
- DIAMOND 3
- EMERALD 5
- GOLD_INGOT 10
- IRON_INGOT 20
- COOKED_BEEF 32

# Kit VIP (VIP เท่านั้น)
createkit vip 43200
- DIAMOND_SWORD 1 sharpness:3
- DIAMOND_PICKAXE 1 efficiency:3
- DIAMOND 10
- EMERALD 10
- GOLDEN_APPLE 5

# Kit MVP (MVP เท่านั้น)
createkit mvp 21600
- DIAMOND_SWORD 1 sharpness:5 unbreaking:3
- DIAMOND_PICKAXE 1 efficiency:5 unbreaking:3
- DIAMOND 20
- EMERALD 20
- GOLDEN_APPLE 10
- ENCHANTED_GOLDEN_APPLE 2
EOF

echo "   ✅ สร้างรายการ Kits สำเร็จ"
echo ""

echo "✅ ตั้งค่าเสร็จสิ้น!"
echo ""
echo "📋 สิ่งที่ต้องทำต่อ:"
echo "   1. รีสตาร์ท Server"
echo "   2. รันคำสั่งใน create_warps.txt"
echo "   3. รันคำสั่งใน create_kits.txt"
echo "   4. ตั้งค่า DiscordSRV (ใส่ Bot Token)"
echo "   5. ตั้งค่า Dynmap (ถ้าติดตั้ง)"
echo "   6. สร้าง Spawn และพื้นที่ต่างๆ"
echo ""
echo "📁 ไฟล์ที่สร้าง:"
echo "   - motd.txt"
echo "   - rules.txt"
echo "   - create_warps.txt"
echo "   - create_kits.txt"
echo ""
