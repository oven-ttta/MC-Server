#!/bin/bash

# สคริปต์ติดตั้ง ViaVersion Plugins สำหรับรองรับหลายเวอร์ชัน
# ใช้งาน: bash install_viaversion.sh

PLUGINS_DIR="/root/MC-Server/minecraft_server/plugins"
cd "$PLUGINS_DIR" || exit 1

echo "🎮 กำลังติดตั้ง ViaVersion Plugins..."
echo ""
echo "📋 Plugin เหล่านี้จะทำให้ Server รองรับ Minecraft 1.8 - 1.21.4+"
echo ""

# ตรวจสอบ ViaRewind
echo "1️⃣  ตรวจสอบ ViaRewind..."
if [ -f "ViaRewind.jar" ]; then
    size=$(ls -lh ViaRewind.jar | awk '{print $5}')
    if [ "$size" != "9" ] && [ "$size" != "75" ]; then
        echo "   ✅ ViaRewind ติดตั้งแล้ว ($size)"
    else
        echo "   ⚠️  ViaRewind ขนาดไม่ถูกต้อง กำลังดาวน์โหลดใหม่..."
        rm -f ViaRewind.jar
        curl -L -o ViaRewind.jar "https://github.com/ViaVersion/ViaRewind/releases/download/4.0.3/ViaRewind-4.0.3.jar"
    fi
else
    echo "   📥 กำลังดาวน์โหลด ViaRewind..."
    curl -L -o ViaRewind.jar "https://github.com/ViaVersion/ViaRewind/releases/download/4.0.3/ViaRewind-4.0.3.jar"
fi
echo ""

# ViaVersion
echo "2️⃣  ดาวน์โหลด ViaVersion..."
echo ""
echo "   ⚠️  ไม่สามารถดาวน์โหลดอัตโนมัติได้"
echo "   📝 กรุณาดาวน์โหลดด้วยตนเองจาก:"
echo ""
echo "   🔗 https://www.spigotmc.org/resources/viaversion.19254/"
echo "   🔗 https://modrinth.com/plugin/viaversion"
echo "   🔗 https://hangar.papermc.io/ViaVersion/ViaVersion"
echo ""
echo "   แล้วอัพโหลดไฟล์ ViaVersion-5.1.2.jar มาที่:"
echo "   📁 $PLUGINS_DIR/"
echo ""

# ViaBackwards
echo "3️⃣  ดาวน์โหลด ViaBackwards..."
echo ""
echo "   ⚠️  ไม่สามารถดาวน์โหลดอัตโนมัติได้"
echo "   📝 กรุณาดาวน์โหลดด้วยตนเองจาก:"
echo ""
echo "   🔗 https://www.spigotmc.org/resources/viabackwards.27448/"
echo "   🔗 https://modrinth.com/plugin/viabackwards"
echo "   🔗 https://hangar.papermc.io/ViaVersion/ViaBackwards"
echo ""
echo "   แล้วอัพโหลดไฟล์ ViaBackwards-5.1.2.jar มาที่:"
echo "   📁 $PLUGINS_DIR/"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📊 สถานะการติดตั้ง:"
echo ""

# ตรวจสอบไฟล์ทั้งหมด
check_plugin() {
    local name=$1
    local file=$2
    
    if [ -f "$file" ]; then
        size=$(ls -lh "$file" | awk '{print $5}')
        # ตรวจสอบว่าไฟล์มีขนาดมากกว่า 100KB
        size_bytes=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        if [ "$size_bytes" -gt 100000 ]; then
            echo "   ✅ $name: ติดตั้งแล้ว ($size)"
            return 0
        else
            echo "   ❌ $name: ไฟล์ไม่ถูกต้อง ($size)"
            return 1
        fi
    else
        echo "   ❌ $name: ยังไม่ได้ติดตั้ง"
        return 1
    fi
}

via_count=0

if check_plugin "ViaVersion" "ViaVersion.jar"; then
    ((via_count++))
fi

if check_plugin "ViaBackwards" "ViaBackwards.jar"; then
    ((via_count++))
fi

if check_plugin "ViaRewind" "ViaRewind.jar"; then
    ((via_count++))
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ $via_count -eq 3 ]; then
    echo "🎉 ติดตั้งครบทั้ง 3 Plugin แล้ว!"
    echo ""
    echo "📊 Server จะรองรับ:"
    echo "   ✅ Minecraft 1.8.x"
    echo "   ✅ Minecraft 1.9 - 1.12"
    echo "   ✅ Minecraft 1.13 - 1.16"
    echo "   ✅ Minecraft 1.17 - 1.20"
    echo "   ✅ Minecraft 1.21.x"
    echo "   ✅ Minecraft เวอร์ชันใหม่กว่า"
    echo ""
    echo "🚀 รีสตาร์ท Server:"
    echo "   pm2 restart minecraft"
elif [ $via_count -eq 2 ]; then
    echo "⚠️  ติดตั้งแล้ว $via_count/3 Plugin"
    echo ""
    echo "📝 ต้องติดตั้งเพิ่ม:"
    [ ! -f "ViaVersion.jar" ] && echo "   - ViaVersion"
    [ ! -f "ViaBackwards.jar" ] && echo "   - ViaBackwards"
    [ ! -f "ViaRewind.jar" ] && echo "   - ViaRewind"
    echo ""
    echo "📖 อ่านคู่มือ: MULTI_VERSION_GUIDE.md"
elif [ $via_count -eq 1 ]; then
    echo "⚠️  ติดตั้งแล้ว $via_count/3 Plugin"
    echo ""
    echo "📝 ต้องติดตั้งเพิ่ม:"
    [ ! -f "ViaVersion.jar" ] && echo "   - ViaVersion (ตัวหลัก - ต้องมี!)"
    [ ! -f "ViaBackwards.jar" ] && echo "   - ViaBackwards"
    [ ! -f "ViaRewind.jar" ] && echo "   - ViaRewind"
    echo ""
    echo "📖 อ่านคู่มือ: MULTI_VERSION_GUIDE.md"
else
    echo "❌ ยังไม่ได้ติดตั้ง Plugin ใดๆ"
    echo ""
    echo "📝 ต้องติดตั้ง:"
    echo "   1. ViaVersion (ตัวหลัก - ต้องมี!)"
    echo "   2. ViaBackwards"
    echo "   3. ViaRewind"
    echo ""
    echo "📖 อ่านคู่มือ: MULTI_VERSION_GUIDE.md"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📚 ข้อมูลเพิ่มเติม:"
echo "   - คู่มือ: /root/MC-Server/minecraft_server/MULTI_VERSION_GUIDE.md"
echo "   - ดาวน์โหลด ViaVersion: https://www.spigotmc.org/resources/viaversion.19254/"
echo "   - ดาวน์โหลด ViaBackwards: https://www.spigotmc.org/resources/viabackwards.27448/"
echo ""
