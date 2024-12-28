#!/bin/bash

# Start the Minecraft server
echo "Starting Minecraft Server..."
./bedrock_server &

# Backup loop
while true; do
    echo "Performing backup..."
    timestamp=$(date +"%Y%m%d_%H%M%S")
    cp -r /app/world /app/backups/world_$timestamp
    echo "Backup completed at $timestamp."
    sleep ${BACKUP_INTERVAL}m
done
