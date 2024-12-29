# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    socat \
    cron \
    iputils-ping \
    tailscale \
    && rm -rf /var/lib/apt/lists/*

# Set working directory in the container
WORKDIR /app

# Copy Minecraft Bedrock server files into the container
COPY bedrock-server-1/ /app/bedrock-server-1/

# Ensure the server file is executable
RUN chmod +x /app/bedrock-server-1/bedrock_server

# Expose Minecraft server port
EXPOSE 19132/udp

# Expose Tailscale ports (optional)
# EXPOSE 41641

# Add entrypoint for Tailscale and Minecraft server startup
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Start Tailscale and Minecraft Server
ENTRYPOINT ["/entrypoint.sh"]