# Use an Ubuntu base image
FROM ubuntu:20.04

# Install required packages
RUN curl -fsSL https://tailscale.com/install.sh | sh && \
    apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    socat \
    cron \
    iputils-ping && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the zip file into the container
COPY bedrock-server-1.zip /app/

# Unzip the server files
RUN unzip bedrock-server-1.zip -d /app/bedrock-server-1 && rm bedrock-server-1.zip

# Expose the Minecraft Bedrock Edition server port
EXPOSE 19132

# Set the entrypoint
ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]