#!/bin/bash

# Start Tailscale in the background
tailscaled &
sleep 5

# Authenticate with Tailscale
tailscale up --authkey=${TAILSCALE_AUTH_KEY}


# Run the Minecraft Bedrock server
cd /app/bedrock-server-1
./bedrock_server