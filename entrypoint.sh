#!/bin/bash

# Start Tailscale in the background
tailscaled --state=/var/lib/tailscale/tailscaled.state &

# Wait for Tailscale to initialize
sleep 5

# Authenticate with Tailscale using the provided auth key
tailscale up --authkey=$TS_AUTH_KEY

# Start Minecraft Bedrock server
/app/bedrock-server-1/bedrock_server