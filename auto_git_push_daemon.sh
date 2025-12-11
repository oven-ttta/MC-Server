#!/bin/bash

# Cron-style Auto Git Push
# รันทุก 30 วินาที

SCRIPT_DIR="/root/MC-Server"
SCRIPT_PATH="$SCRIPT_DIR/auto_git_push.sh"

cd "$SCRIPT_DIR" || exit 1

# รันทุก 30 วินาที
while true; do
    bash "$SCRIPT_PATH"
    sleep 30
done
