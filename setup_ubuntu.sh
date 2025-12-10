#!/bin/bash

# สีสำหรับข้อความ
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}เริ่มการติดตั้ง Minecraft Server (PaperMC 1.21.4)...${NC}"

# 1. อัปเดตระบบและติดตั้ง Java (Java 21 สำหรับ Minecraft 1.20.5+)
echo "ติดตั้ง Java 21 และ Screen..."
sudo apt update
sudo apt install -y openjdk-21-jre-headless screen wget

# 2. สร้างโฟลเดอร์สำหรับ Server
mkdir -p minecraft_server
cd minecraft_server

# 3. ตั้งค่า Firewall (เปิดพอร์ต 25565 TCP และ 19132 UDP)
echo "ตั้งค่า Firewall..."
sudo ufw allow 25565/tcp
sudo ufw allow 19132/udp

# 4. ดาวน์โหลด PaperMC (เวอร์ชัน 1.21.4)
echo "กำลังดาวน์โหลด PaperMC..."
# หมายเหตุ: ลิงก์นี้อาจต้องอัปเดตหากมีเวอร์ชันใหม่ออกมา
wget -O server.jar "https://api.papermc.io/v2/projects/paper/versions/1.21.4/builds/6/downloads/paper-1.21.4-6.jar"

# 5. ติดตั้งระบบเล่นข้ามแพลตฟอร์ม (Geyser + Floodgate)
echo "ติดตั้ง GeyserMC และ Floodgate (เพื่อให้มือถือเล่นได้)..."
mkdir -p plugins
cd plugins
wget -O Geyser-Spigot.jar "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot"
wget -O floodgate-spigot.jar "https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot"
cd ..

# 6. ตั้งค่าให้เล่นแบบ Offline (Minecraft เถื่อนเข้าได้)
echo "ตั้งค่า server.properties (online-mode=false)..."
echo "online-mode=false" > server.properties
echo "motd=Ovenx Shop Server" >> server.properties

# 7. ยอมรับ EULA
echo "สร้างไฟล์ EULA..."
echo "eula=true" > eula.txt

# 8. ดาวน์โหลดไฟล์ start.sh (สร้างไฟล์ start ในโฟลเดอร์นี้ด้วย)
cat <<EOF > start.sh
#!/bin/bash
# แรมเริ่มต้น 4GB (แก้ไข -Xms และ -Xmx ตามต้องการ)
java -Xms4G -Xmx4G -XX:+UseG1GC -jar server.jar nogui
EOF

chmod +x start.sh

echo -e "${GREEN}ติดตั้งเสร็จสมบูรณ์!${NC}"
echo "ไปที่โฟลเดอร์โดยพิมพ์: cd minecraft_server"
echo "และเริ่มเซิร์ฟเวอร์โดยพิมพ์: ./start.sh"
