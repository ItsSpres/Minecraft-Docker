# Base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl unzip jq gnupg software-properties-common \
    && apt-get clean

# Install Minecraft Bedrock server
WORKDIR /minecraft
RUN curl -L -o bedrock-server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.20.32.03.zip \
    && unzip bedrock-server.zip \
    && rm bedrock-server.zip

# Install Tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh

# Copy Tailscale authentication state (optional, if required)
# ADD state.json /var/lib/tailscale/state.json

# Expose Minecraft and Tailscale ports
EXPOSE 19132/udp
EXPOSE 19132/tcp
EXPOSE 41641/udp

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set entrypoint
ENTRYPOINT ["/start.sh"]
