#!/bin/bash

BACKUP_DIR="/data/backups"
WORLD_DIR="/data/worlds"

# Make sure the backup directory exists
mkdir -p $BACKUP_DIR

# Get the current timestamp
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Backup world data
cp -r $WORLD_DIR $BACKUP_DIR/world_$TIMESTAMP
echo "Backup completed at $TIMESTAMP"