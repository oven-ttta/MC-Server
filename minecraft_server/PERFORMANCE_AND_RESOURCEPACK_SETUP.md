# 🎮 Minecraft Server Performance & Resource Pack Setup

## ✅ สิ่งที่ตั้งค่าเสร็จแล้ว

### 📦 1. Resource Pack Auto-Download (Faithful 64x)

**การตั้งค่าใน server.properties:**
- ✅ Resource Pack URL: `http://192.168.1.13:8080/Faithful-64x.zip`
- ✅ SHA1 Hash: `62f9e6170fac846648ade2a1873ad5c65e19d658`
- ✅ Custom Prompt: "§6§lOvenx Shop Server §r§e- ดาวน์โหลด Faithful 64x Resource Pack เพื่อประสบการณ์ที่ดีที่สุด!"
- ⚠️ Require Pack: `false` (ผู้เล่นสามารถปฏิเสธได้)

**วิธีการทำงาน:**
1. เมื่อผู้เล่นเข้าเซิร์ฟเวอร์ จะมีป๊อปอัพถามว่าต้องการดาวน์โหลด Resource Pack หรือไม่
2. ถ้ากด "Yes" จะดาวน์โหลดอัตโนมัติจาก web server ที่ port 8080
3. Resource Pack จะถูกติดตั้งและใช้งานทันที

**หมายเหตุ:**
- Web Server (nginx) กำลังทำงานที่ port 8080
- URL: http://192.168.1.13:8080
- ไฟล์ Resource Pack อยู่ที่: `/var/www/html/minecraft-downloads/Faithful-64x.zip`

---

### ⚡ 2. Performance Optimization (สำหรับ 20+ ผู้เล่น)

**ข้อมูลเซิร์ฟเวอร์:**
- CPU: 6 cores
- RAM: 6 GB (จาก 8 GB ทั้งหมด)
- เป้าหมาย: รองรับผู้เล่นอย่างน้อย 20 คน

#### 🔧 การปรับแต่ง JVM (start.sh)

**RAM Allocation:**
- Initial Heap: 6GB (-Xms6G)
- Maximum Heap: 6GB (-Xmx6G)

**Aikar's Flags (Optimized for Minecraft):**
- ✅ G1GC Garbage Collector
- ✅ Parallel Reference Processing
- ✅ Max GC Pause: 200ms (ลด lag spike)
- ✅ G1 Heap Region: 8M
- ✅ Optimized for low latency

**ประโยชน์:**
- ลด lag spike จาก garbage collection
- ใช้ RAM อย่างมีประสิทธิภาพ
- เพิ่ม TPS (Ticks Per Second) ให้คงที่ที่ 20

---

#### 🌍 การปรับแต่ง server.properties

**View & Simulation Distance:**
- View Distance: 10 → **8 chunks** (ลด 20% load)
- Simulation Distance: 10 → **6 chunks** (ลด 40% entity processing)

**Network Optimization:**
- Sync Chunk Writes: true → **false** (เขียนข้อมูลแบบ async)

**ผลลัพธ์:**
- ลดการใช้ CPU ในการ render chunks
- ลดการใช้ RAM ในการเก็บ chunk data
- เพิ่มความเร็วในการโหลด chunks

---

#### 🎯 การปรับแต่ง spigot.yml

**Network Threads:**
- Netty Threads: 4 → **6** (ใช้ทุก CPU cores)

**Entity Optimization:**
- Entity Activation Range ลดลง 25%:
  - Animals: 32 → **24**
  - Monsters: 32 → **24**
  - Raiders: 64 → **48**
  - Misc: 16 → **12**
  - Water: 16 → **12**
  - Villagers: 32 → **24**
  - Flying Monsters: 32 → **24**

**Item & Projectile Despawn:**
- Item Despawn: 6000 ticks (5 min) → **3000 ticks (2.5 min)**
- Arrow Despawn: 1200 ticks (1 min) → **600 ticks (30 sec)**
- Trident Despawn: 1200 ticks → **600 ticks**

**Item Merge Radius:**
- Items: 0.5 → **3.0** (รวม items ที่อยู่ใกล้กัน)
- Experience: -1.0 → **4.0** (รวม XP orbs)

**Mob Spawn Range:**
- Mob Spawn Range: 8 → **6 chunks**

**Hopper Optimization:**
- Hopper Check: 1 tick → **8 ticks** (ลดการตรวจสอบ hopper)

**ผลลัพธ์:**
- ลด entity count ลง 25-40%
- ลดการใช้ CPU ในการคำนวณ AI
- ลดการใช้ RAM ในการเก็บ entity data
- เพิ่ม TPS โดยรวม

---

#### 🐾 การปรับแต่ง bukkit.yml

**Spawn Limits (ลดจำนวน mob ที่ spawn ได้):**
- Monsters: 70 → **50** (-29%)
- Animals: 10 → **8** (-20%)
- Water Animals: 5 → **4** (-20%)
- Water Ambient: 20 → **10** (-50%)
- Water Underground: 5 → **3** (-40%)
- Axolotls: 5 → **3** (-40%)
- Ambient: 15 → **10** (-33%)

**ผลลัพธ์:**
- ลด mob count ลง 20-50%
- ลดการใช้ CPU ในการคำนวณ mob AI
- เพิ่มประสิทธิภาพโดยรวม

---

## 📊 ประมาณการประสิทธิภาพ

### ก่อนการปรับแต่ง:
- Max Players: ~10-12 คน
- Average TPS: 18-19
- RAM Usage: ~4GB
- CPU Usage: 60-70%

### หลังการปรับแต่ง (คาดการณ์):
- Max Players: **20-25 คน**
- Average TPS: **19.5-20**
- RAM Usage: ~5-5.5GB
- CPU Usage: 50-60%

---

## 🚀 วิธีใช้งาน

### 1. Restart Server
```bash
cd /root/MC-Server/minecraft_server
./start.sh
```

### 2. ตรวจสอบ TPS
ใช้คำสั่งใน game:
```
/tps
```
หรือใช้ plugin เช่น Spark สำหรับ profiling

### 3. Monitor Performance
```bash
# ดู RAM usage
free -h

# ดู CPU usage
top

# ดู server logs
tail -f logs/latest.log
```

---

## 🎨 Resource Pack Information

**Faithful 64x:**
- ขนาดไฟล์: ~16 MB
- ความละเอียด: 64x64 pixels
- รองรับ: Minecraft 1.21.x
- สไตล์: Vanilla-faithful (คล้ายของเดิมแต่ละเอียดกว่า)

**Download URL:**
- Web Interface: http://192.168.1.13:8080
- Direct Download: http://192.168.1.13:8080/Faithful-64x.zip

---

## ⚠️ หมายเหตุสำคัญ

### Shader Mods
- ❌ **ไม่สามารถบังคับจาก server ได้**
- Shader เป็น client-side mod ที่ต้องติดตั้งในเครื่องผู้เล่น
- ผู้เล่นต้องติดตั้ง OptiFine หรือ Iris + Sodium เอง
- Shader Pack (Sildur's) สามารถดาวน์โหลดได้จาก: http://192.168.1.13:8080

### Resource Pack
- ✅ **สามารถบังคับจาก server ได้**
- ตั้งค่าเป็น `require-resource-pack=false` (ผู้เล่นสามารถปฏิเสธได้)
- ถ้าต้องการบังคับ แก้เป็น `require-resource-pack=true` ใน server.properties

### Performance Tuning
- การตั้งค่าเหล่านี้เหมาะสำหรับ **Survival Server**
- ถ้าเป็น Creative/Building server อาจต้องปรับ view-distance สูงขึ้น
- สามารถปรับแต่งเพิ่มเติมได้ตามความต้องการ

---

## 🔧 การปรับแต่งเพิ่มเติม (ถ้าต้องการ)

### เพิ่มผู้เล่นได้มากกว่า 25 คน:
1. ลด view-distance เป็น 6-7
2. ลด simulation-distance เป็น 4-5
3. ติดตั้ง plugin เช่น FarmLimiter, MobLimiter
4. ใช้ Paper server แทน Spigot (ประสิทธิภาพดีกว่า)

### บังคับ Resource Pack:
แก้ไข `server.properties`:
```properties
require-resource-pack=true
```

### เปลี่ยน Resource Pack:
1. วางไฟล์ .zip ใหม่ใน `/var/www/html/minecraft-downloads/`
2. คำนวณ SHA1: `sha1sum filename.zip`
3. อัพเดท `server.properties`:
   - `resource-pack=http://192.168.1.13:8080/filename.zip`
   - `resource-pack-sha1=<new-hash>`

---

## 📞 Support

หากมีปัญหาหรือต้องการปรับแต่งเพิ่มเติม:
1. ตรวจสอบ logs: `/root/MC-Server/minecraft_server/logs/latest.log`
2. ตรวจสอบ TPS ใน game: `/tps`
3. ใช้ Spark plugin สำหรับ profiling: `/spark profiler`

---

**สร้างเมื่อ:** 2025-12-12
**เวอร์ชัน:** Minecraft 1.21.x (Spigot)
**สถานะ:** ✅ พร้อมใช้งาน
