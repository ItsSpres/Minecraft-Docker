#!/bin/bash

# Set backup folder path (this is the mounted directory in the container)
BACKUP_DIR="/app/backups"
SERVER_DIR="/app/bedrock-server-1"

# Create a timestamp for the backup file
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create the backup file (e.g., zip the entire server directory)
zip -r "$BACKUP_DIR/backup_$TIMESTAMP.zip" "$SERVER_DIR"

echo "Backup completed successfully at $TIMESTAMP"