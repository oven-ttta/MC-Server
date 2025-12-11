#!/bin/bash

# สคริปต์สร้าง Web Server สำหรับดาวน์โหลด Resource Pack และ Shader
# ใช้งาน: bash setup_download_server.sh

SERVER_DIR="/root/MC-Server/minecraft_server"
DOWNLOADS_DIR="$SERVER_DIR/client_downloads"
WEB_DIR="/var/www/html/minecraft-downloads"

echo "🌐 กำลังตั้งค่า Download Server..."
echo ""

# ติดตั้ง nginx (ถ้ายังไม่มี)
echo "📦 ตรวจสอบ nginx..."
if ! command -v nginx &> /dev/null; then
    echo "   กำลังติดตั้ง nginx..."
    apt-get update -qq
    apt-get install -y nginx
    echo "   ✅ ติดตั้ง nginx สำเร็จ"
else
    echo "   ✅ nginx ติดตั้งแล้ว"
fi
echo ""

# สร้างโฟลเดอร์สำหรับ downloads
echo "📁 สร้างโฟลเดอร์..."
mkdir -p "$WEB_DIR"
echo "   ✅ สร้างโฟลเดอร์สำเร็จ"
echo ""

# คัดลอกไฟล์
echo "📋 คัดลอกไฟล์..."
cp "$DOWNLOADS_DIR/Faithful 64x - December 2025 Release.zip" "$WEB_DIR/Faithful-64x.zip"
cp "$DOWNLOADS_DIR/Sildur's Vibrant Shaders v1.541 Lite.zip" "$WEB_DIR/Sildurs-Vibrant-Shaders-Lite.zip"
echo "   ✅ คัดลอกไฟล์สำเร็จ"
echo ""

# สร้างหน้า HTML
echo "🎨 สร้างหน้าเว็บ..."
cat > "$WEB_DIR/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ovenx Shop Server - Downloads</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            max-width: 900px;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }
        
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 10px;
            font-size: 2.5em;
        }
        
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 40px;
            font-size: 1.2em;
        }
        
        .download-section {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            transition: transform 0.3s ease;
        }
        
        .download-section:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .download-section h2 {
            color: #667eea;
            margin-bottom: 15px;
            font-size: 1.8em;
        }
        
        .download-section p {
            color: #555;
            margin-bottom: 20px;
            line-height: 1.6;
        }
        
        .download-btn {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 40px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1em;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .download-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
        }
        
        .features {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 25px;
            margin-top: 30px;
        }
        
        .features h3 {
            color: #333;
            margin-bottom: 15px;
        }
        
        .features ul {
            list-style: none;
            padding-left: 0;
        }
        
        .features li {
            color: #555;
            padding: 10px 0;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .features li:last-child {
            border-bottom: none;
        }
        
        .features li:before {
            content: "✓ ";
            color: #667eea;
            font-weight: bold;
            margin-right: 10px;
        }
        
        .installation {
            background: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 20px;
            margin-top: 30px;
            border-radius: 5px;
        }
        
        .installation h3 {
            color: #856404;
            margin-bottom: 15px;
        }
        
        .installation ol {
            color: #856404;
            padding-left: 20px;
        }
        
        .installation li {
            margin: 10px 0;
        }
        
        .server-info {
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 10px;
        }
        
        .server-info h3 {
            margin-bottom: 10px;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            
            h1 {
                font-size: 2em;
            }
            
            .download-section h2 {
                font-size: 1.5em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎮 Ovenx Shop Server</h1>
        <p class="subtitle">ดาวน์โหลด Resource Pack และ Shader</p>
        
        <div class="download-section">
            <h2>📦 Resource Pack: Faithful 64x</h2>
            <p>
                <strong>Faithful 64x</strong> เป็น Resource Pack ความละเอียดสูงที่ยังคงความเป็น Minecraft ไว้
                แต่เพิ่มรายละเอียดให้สวยงามขึ้น 4 เท่า! เหมาะสำหรับผู้ที่ต้องการกราฟิกสวยแต่ไม่หนักเกินไป
            </p>
            <a href="Faithful-64x.zip" class="download-btn" download>⬇️ ดาวน์โหลด Faithful 64x</a>
            
            <div class="features">
                <h3>คุณสมบัติ:</h3>
                <ul>
                    <li>ความละเอียด 64x64 (สูงกว่าปกติ 4 เท่า)</li>
                    <li>รักษาสไตล์ Minecraft ดั้งเดิม</li>
                    <li>รองรับ Minecraft เวอร์ชันล่าสุด</li>
                    <li>ไม่หนักมาก เล่นได้ลื่น</li>
                </ul>
            </div>
        </div>
        
        <div class="download-section">
            <h2>✨ Shader Pack: Sildur's Vibrant Shaders Lite</h2>
            <p>
                <strong>Sildur's Vibrant Shaders</strong> เป็น Shader ที่ทำให้โลก Minecraft มีชีวิตชีวา
                มีแสงเงา น้ำสะท้อน และบรรยากาศสมจริง! เวอร์ชัน Lite นี้เหมาะสำหรับคอมสเปคปานกลาง
            </p>
            <a href="Sildurs-Vibrant-Shaders-Lite.zip" class="download-btn" download>⬇️ ดาวน์โหลด Sildur's Shaders</a>
            
            <div class="features">
                <h3>คุณสมบัติ:</h3>
                <ul>
                    <li>แสงเงาสมจริง (Dynamic Shadows)</li>
                    <li>น้ำสะท้อน (Water Reflections)</li>
                    <li>ท้องฟ้าสวยงาม (Beautiful Sky)</li>
                    <li>เวอร์ชัน Lite ไม่หนักมาก</li>
                    <li>ต้องใช้ OptiFine หรือ Iris</li>
                </ul>
            </div>
        </div>
        
        <div class="installation">
            <h3>📝 วิธีติดตั้ง Resource Pack:</h3>
            <ol>
                <li>ดาวน์โหลดไฟล์ <strong>Faithful-64x.zip</strong></li>
                <li>เปิด Minecraft แล้วไปที่ <strong>Options → Resource Packs</strong></li>
                <li>คลิก <strong>Open Pack Folder</strong></li>
                <li>วางไฟล์ .zip ลงในโฟลเดอร์ (ไม่ต้องแตกไฟล์)</li>
                <li>กลับไปที่เกมแล้วเลือก Faithful 64x</li>
                <li>คลิก <strong>Done</strong> เพื่อใช้งาน</li>
            </ol>
        </div>
        
        <div class="installation">
            <h3>📝 วิธีติดตั้ง Shader Pack:</h3>
            <ol>
                <li>ติดตั้ง <strong>OptiFine</strong> หรือ <strong>Iris + Sodium</strong> ก่อน</li>
                <li>ดาวน์โหลดไฟล์ <strong>Sildurs-Vibrant-Shaders-Lite.zip</strong></li>
                <li>เปิด Minecraft แล้วไปที่ <strong>Options → Video Settings → Shaders</strong></li>
                <li>คลิก <strong>Shaders Folder</strong></li>
                <li>วางไฟล์ .zip ลงในโฟลเดอร์ (ไม่ต้องแตกไฟล์)</li>
                <li>กลับไปที่เกมแล้วเลือก Sildur's Vibrant Shaders Lite</li>
                <li>คลิก <strong>Done</strong> เพื่อใช้งาน</li>
            </ol>
        </div>
        
        <div class="server-info">
            <h3>🎯 ข้อมูล Server</h3>
            <p><strong>Server IP:</strong> your-server-ip:25565</p>
            <p><strong>Version:</strong> 1.21.x (Java & Bedrock)</p>
            <p><strong>Discord:</strong> discord.gg/yourserver</p>
            <p style="margin-top: 15px;">สนุกกับการเล่น! 🎮</p>
        </div>
    </div>
</body>
</html>
EOF

echo "   ✅ สร้างหน้าเว็บสำเร็จ"
echo ""

# ตั้งค่า nginx
echo "⚙️  ตั้งค่า nginx..."
cat > /etc/nginx/sites-available/minecraft-downloads << 'EOF'
server {
    listen 8080;
    server_name _;
    
    root /var/www/html/minecraft-downloads;
    index index.html;
    
    location / {
        try_files $uri $uri/ =404;
        autoindex on;
    }
    
    location ~* \.(zip|jar)$ {
        add_header Content-Disposition "attachment";
    }
}
EOF

# Enable site
ln -sf /etc/nginx/sites-available/minecraft-downloads /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Restart nginx
systemctl restart nginx

echo "   ✅ ตั้งค่า nginx สำเร็จ"
echo ""

# ตั้งค่า permissions
chmod -R 755 "$WEB_DIR"

echo "✅ ตั้งค่าเสร็จสิ้น!"
echo ""
echo "🌐 Download Server พร้อมใช้งานแล้ว!"
echo "   URL: http://YOUR_SERVER_IP:8080"
echo ""
echo "📁 ไฟล์ที่พร้อมดาวน์โหลด:"
echo "   • Faithful 64x Resource Pack"
echo "   • Sildur's Vibrant Shaders Lite"
echo ""
echo "📝 หมายเหตุ:"
echo "   - แก้ไข YOUR_SERVER_IP ในไฟล์ HTML"
echo "   - เปิด Port 8080 ใน Firewall"
echo "   - ใช้ Reverse Proxy (nginx) สำหรับ HTTPS"
echo ""
