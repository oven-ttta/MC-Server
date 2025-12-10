module.exports = {
  apps : [{
    name   : "minecraft",
    script : "./run_server.sh",
    cwd    : "/root/MC-Server/minecraft_server",   // ระบุโฟลเดอร์ที่มี server.jar
    autorestart: true
  }]
}

