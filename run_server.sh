#!/bin/bash
cd /root/MC-Server/minecraft_server
java -Xms512M -Xmx1G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -jar server.jar nogui

