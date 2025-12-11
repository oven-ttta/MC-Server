#!/bin/bash

# สคริปต์ดาวน์โหลด Plugin เพิ่มเติมสำหรับ Minecraft Server
# ใช้งาน: bash download_more_plugins.sh

PLUGINS_DIR="/root/MC-Server/minecraft_server/plugins"
cd "$PLUGINS_DIR" || exit 1

echo "🎮 กำลังดาวน์โหลด Plugin เพิ่มเติม..."
echo ""

# ฟังก์ชันดาวน์โหลด
download_plugin() {
    local name=$1
    local url=$2
    local filename=$3
    
    echo "📦 กำลังดาวน์โหลด $name..."
    if curl -L -o "$filename" "$url" 2>/dev/null; then
        size=$(ls -lh "$filename" | awk '{print $5}')
        if [ "$size" != "9" ]; then
            echo "   ✅ ดาวน์โหลดสำเร็จ ($size)"
        else
            echo "   ❌ ดาวน์โหลดล้มเหลว"
            rm -f "$filename"
        fi
    else
        echo "   ❌ ไม่สามารถเชื่อมต่อได้"
    fi
    echo ""
}

# Plugin ที่แนะนำ
echo "=== Plugin ระบบเศรษฐกิจและร้านค้า ==="
download_plugin "ShopGUI+" \
    "https://www.spigotmc.org/resources/shopgui.6515/download?version=527834" \
    "ShopGUIPlus.jar"

download_plugin "PlayerWarps" \
    "https://github.com/olliestanley/PlayerWarps/releases/download/v5.0.0/PlayerWarps-5.0.0.jar" \
    "PlayerWarps.jar"

echo "=== Plugin ระบบ PvP และการต่อสู้ ==="
download_plugin "CombatLogX" \
    "https://github.com/SirBlobman/CombatLogX/releases/download/11.4.0.0/CombatLogX-11.4.0.0.jar" \
    "CombatLogX.jar"

download_plugin "Duels" \
    "https://github.com/Realizedd/Duels/releases/download/v3.5.1/Duels-3.5.1.jar" \
    "Duels.jar"

echo "=== Plugin ระบบสังคมและชุมชน ==="
download_plugin "MarriageMaster" \
    "https://github.com/GeorgH93/MarriageMaster/releases/download/v2.7.8/MarriageMaster-2.7.8.jar" \
    "MarriageMaster.jar"

download_plugin "Parties" \
    "https://github.com/AlessioDP/Parties/releases/download/3.2.15/Parties-Bukkit-3.2.15.jar" \
    "Parties.jar"

echo "=== Plugin ระบบตกแต่งและ Cosmetics ==="
download_plugin "UltraCosmetics" \
    "https://github.com/UltraCosmetics/UltraCosmetics/releases/download/v2.6.11/UltraCosmetics-2.6.11.jar" \
    "UltraCosmetics.jar"

download_plugin "PlayerParticles" \
    "https://github.com/Rosewood-Development/PlayerParticles/releases/download/v9.2/PlayerParticles-9.2.jar" \
    "PlayerParticles.jar"

echo "=== Plugin ระบบยูทิลิตี้ ==="
download_plugin "BetterRTP" \
    "https://www.spigotmc.org/resources/betterrtp.36081/download?version=524619" \
    "BetterRTP.jar"

download_plugin "Chairs" \
    "https://github.com/Gypopo/Chairs/releases/download/1.20.8/Chairs-1.20.8.jar" \
    "Chairs.jar"

download_plugin "Elevator" \
    "https://github.com/Gypopo/Elevator/releases/download/1.9.4/Elevator-1.9.4.jar" \
    "Elevator.jar"

echo "=== Plugin ระบบความปลอดภัย ==="
download_plugin "CoreProtect" \
    "https://www.spigotmc.org/resources/coreprotect.8631/download?version=527833" \
    "CoreProtect.jar"

download_plugin "AntiCheatReloaded" \
    "https://github.com/Rammelkast/AntiCheatReloaded/releases/download/2.5.1/AntiCheatReloaded-2.5.1.jar" \
    "AntiCheatReloaded.jar"

echo "=== Plugin ระบบมินิเกม ==="
download_plugin "BedWars1058" \
    "https://github.com/andrei1058/BedWars1058/releases/download/v23.11/BedWars1058-23.11.jar" \
    "BedWars1058.jar"

download_plugin "SkyWars" \
    "https://github.com/Dabo-2100/SkyWars/releases/download/v3.0.0/SkyWars-3.0.0.jar" \
    "SkyWars.jar"

echo "=== Plugin ระบบเพิ่มเติม ==="
download_plugin "CustomItems" \
    "https://github.com/Auxilor/EcoItems/releases/download/v5.51.0/EcoItems-5.51.0.jar" \
    "EcoItems.jar"

download_plugin "ItemsAdder" \
    "https://www.spigotmc.org/resources/itemsadder.73355/download?version=527835" \
    "ItemsAdder.jar"

download_plugin "MythicMobs" \
    "https://www.spigotmc.org/resources/mythicmobs.5702/download?version=527836" \
    "MythicMobs.jar"

echo ""
echo "✅ เสร็จสิ้น! กรุณาตรวจสอบ plugin ที่ดาวน์โหลดสำเร็จ"
echo "📁 ตำแหน่ง: $PLUGINS_DIR"
echo ""
echo "⚠️  หมายเหตุ:"
echo "   - บาง plugin อาจต้องซื้อหรือดาวน์โหลดด้วยตนเอง"
echo "   - ตรวจสอบความเข้ากันได้กับเวอร์ชัน Minecraft ของคุณ"
echo "   - รีสตาร์ท server หลังจากติดตั้ง plugin ใหม่"
echo ""
