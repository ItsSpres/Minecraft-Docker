#!/bin/bash

# Start Tailscale
tailscaled &

# Wait for Tailscale to start
tailscale up --authkey=${TAILSCALE_AUTH_KEY}

# Start Minecraft server
LD_LIBRARY_PATH=. ./bedrock_server

while true; do
    /backup.sh
    sleep 3600 # Back up every hour
done &
