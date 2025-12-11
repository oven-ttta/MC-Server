#!/bin/bash

# Auto Git Push Script
# ตรวจสอบและ push ไฟล์ใหม่ขึ้น GitHub ทุก 30 วินาที

REPO_DIR="/root/MC-Server"
LOG_FILE="/root/MC-Server/auto_git_push.log"

# ฟังก์ชันบันทึก log
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# เข้าไปยัง directory
cd "$REPO_DIR" || exit 1

log "🚀 Auto Git Push เริ่มทำงาน..."

# ตรวจสอบว่ามี git repository หรือไม่
if [ ! -d ".git" ]; then
    log "❌ ไม่พบ Git repository กำลังสร้าง..."
    git init
    git branch -M main
    log "✅ สร้าง Git repository สำเร็จ"
fi

# ตรวจสอบว่ามี remote หรือไม่
if ! git remote | grep -q "origin"; then
    log "⚠️  ยังไม่มี remote repository"
    log "📝 กรุณาตั้งค่า remote ด้วยคำสั่ง:"
    log "   git remote add origin https://github.com/oven-ttta/MC-Server.git"
fi

# เพิ่มไฟล์ทั้งหมด
git add .

# ตรวจสอบว่ามีการเปลี่ยนแปลงหรือไม่
if git diff --cached --quiet; then
    log "✓ ไม่มีไฟล์ใหม่หรือการเปลี่ยนแปลง"
else
    # นับจำนวนไฟล์ที่เปลี่ยนแปลง
    CHANGED_FILES=$(git diff --cached --name-only | wc -l)
    
    log "📦 พบไฟล์ที่เปลี่ยนแปลง: $CHANGED_FILES ไฟล์"
    
    # แสดงรายการไฟล์
    log "📄 ไฟล์ที่เปลี่ยนแปลง:"
    git diff --cached --name-only | while read file; do
        log "   - $file"
    done
    
    # Commit
    COMMIT_MSG="Auto commit: $(date '+%Y-%m-%d %H:%M:%S') - $CHANGED_FILES files changed"
    git commit -m "$COMMIT_MSG"
    
    if [ $? -eq 0 ]; then
        log "✅ Commit สำเร็จ: $COMMIT_MSG"
        
        # Push
        log "🚀 กำลัง Push ไปยัง GitHub..."
        
        if git push origin main 2>&1 | tee -a "$LOG_FILE"; then
            log "✅ Push สำเร็จ!"
        else
            log "❌ Push ล้มเหลว - ตรวจสอบ remote และ credentials"
        fi
    else
        log "❌ Commit ล้มเหลว"
    fi
fi

log "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
