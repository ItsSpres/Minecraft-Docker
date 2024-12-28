#!/bin/bash
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR=/minecraft/backups
mkdir -p $BACKUP_DIR

# Use screen command to save the game
screen -S mc-server -X stuff "save hold^M"
sleep 5
screen -S mc-server -X stuff "save query^M"
cp -r /minecraft/world $BACKUP_DIR/world_$TIMESTAMP
screen -S mc-server -X stuff "save resume^M"
