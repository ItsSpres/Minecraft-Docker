FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl unzip socat cron \
    && rm -rf /var/lib/apt/lists/*

# Install Minecraft Bedrock server
WORKDIR /app
RUN bedrock-server-1

# Add entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose Minecraft port
EXPOSE 19132/udp

# Run the server
ENTRYPOINT ["/entrypoint.sh"]