#!/bin/bash
TARGET_DIR="/home/administrator/myfolder"
TARGET_FILE="$TARGET_DIR/myfile.txt"
sudo mkdir -p "$TARGET_DIR"
sudo touch "$TARGET_FILE"
sudo chmod 755 "$TARGET_DIR"
sudo chmod 644 "$TARGET_FILE"
sudo chown administrator:administrator "$TARGET_DIR" "$TARGET_FILE"
echo "Jenkins job completed"
