#!/bin/bash
# แรมเริ่มต้น 4GB (แก้ไข -Xms และ -Xmx ตามต้องการ)
java -Xms4G -Xmx4G -XX:+UseG1GC -jar server.jar nogui
