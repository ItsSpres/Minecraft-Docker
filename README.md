# Minecraft Bedrock Server with Docker and Tailscale

## Minecraft Bedrock Server Setup Guide

This guide will help you set up a **Minecraft Bedrock Edition** server using Docker with Tailscale for secure access. Running your server in Docker provides isolation and portability, while Tailscale ensures private and secure connections to your server from anywhere.

---

## Table of Contents

- [Requirements](#requirements)
- [Hardware Setup](#hardware-setup)
- [Install Docker and Tailscale](#install-docker-and-tailscale)
- [Create and Configure Minecraft Server Docker Container](#create-and-configure-minecraft-server-docker-container)
- [Security Recommendations with Tailscale](#security-recommendations)
- [Starting the Server](#starting-the-server)
- [Server Maintenance](#server-maintenance)
- [Useful Links](#useful-links)

---

## Requirements

### Hardware Requirements:
- **CPU**: At least 4 cores (Intel i5 or AMD Ryzen 5 or better)
- **RAM**: Minimum 8 GB of RAM for smooth performance
- **Storage**: SSD with at least 20 GB of free space (more for large worlds)
- **Internet**: Stable internet connection for online multiplayer

### Software Requirements:
- **Operating System**: Windows, Linux, or macOS (this guide uses Ubuntu Linux as an example)
- **Docker**: For containerization and ease of deployment
- **Tailscale**: For secure, private access
- **Minecraft Bedrock Edition Server**: Official server version for Docker

---

## Hardware Setup

1. **Purchase or repurpose a server**:  
   For optimal performance, use a dedicated server or PC with the specs mentioned above. If you're reusing an old PC, you may want to consider adding an SSD for faster performance.

2. **Ensure adequate cooling**:  
   Running a server 24/7 requires good airflow to prevent overheating. Make sure your setup is well-ventilated.

---

## Install Docker and Tailscale

### Step 1: Install Docker

Docker allows us to run the Minecraft server inside a container, ensuring isolation and easy management.

1. Update your package list:
    ```bash
    sudo apt update
    ```

2. Install Docker:
    ```bash
    sudo apt install docker.io
    ```

3. Verify Docker is installed:
    ```bash
    sudo docker --version
    ```

4. Start and enable Docker to run on startup:
    ```bash
    sudo systemctl start docker
    sudo systemctl enable docker
    ```

For more Docker installation details, check out the [Docker official documentation](https://docs.docker.com/get-docker/).

### Step 2: Install Tailscale

Tailscale is used to create a private network for your server. It makes sure your Minecraft server is securely accessible only by your devices.

1. Install Tailscale by following these instructions from [Tailscale's official site](https://tailscale.com/download).

    For Ubuntu:
    ```bash
    curl -fsSL https://tailscale.com/install.sh | sh
    ```

2. Start Tailscale:
    ```bash
    sudo tailscale up
    ```

3. Once installed, you’ll need to log in to Tailscale (use your Google or Microsoft account for authentication). After logging in, your machine will be connected to your private Tailscale network.

    You can check your Tailscale status with:
    ```bash
    tailscale status
    ```

---

## Create and Configure Minecraft Server Docker Container

### Step 1: Pull Minecraft Bedrock Server Docker Image

1. Pull the official **Minecraft Bedrock Edition** server image:
    ```bash
    sudo docker pull itzg/minecraft-bedrock-server
    ```

2. Verify the image was pulled successfully:
    ```bash
    sudo docker images
    ```

### Step 2: Create Docker Container for Minecraft Server

1. Create a directory to store your server data:
    ```bash
    mkdir -p ~/minecraft/bedrock
    ```

2. Run the Minecraft Bedrock server container using the pulled image:
    ```bash
    sudo docker run -d \
        -v ~/minecraft/bedrock:/data \
        -e EULA=TRUE \
        -p 19132:19132/udp \
        --name minecraft-bedrock-server \
        itzg/minecraft-bedrock-server
    ```

    Explanation:
    - `-v ~/minecraft/bedrock:/data`: Mounts the local folder `~/minecraft/bedrock` to the container's `/data` folder to persist world data.
    - `-e EULA=TRUE`: Accepts the Minecraft EULA automatically (set `EULA=TRUE` in the container environment variable).
    - `-p 19132:19132/udp`: Exposes the Minecraft Bedrock server port (UDP 19132).
    - `--name minecraft-bedrock-server`: Names the container for easy reference.

3. Verify the server container is running:
    ```bash
    sudo docker ps
    ```

### Step 3: Customize Server Configuration

To modify server settings, such as the server name or max players, edit the `server.properties` file located in the `~/minecraft/bedrock` directory.

Example:
```properties
server-name=My Bedrock Server
max-players=10
gamemode=survival
```

## Security Recommendations

When setting up your Minecraft Bedrock Edition server, it's important to implement basic security measures to protect your server and users.

### 1. **Use Tailscale for Private Networking**
   Tailscale ensures your Minecraft server is only accessible from devices within your private network. You don’t need to expose your server to the public internet. After configuring Tailscale, you can access the server using your Tailscale IP.

### 2. **Update the Server Regularly**
   Always use the latest stable version of Minecraft to ensure you have the latest bug fixes and security patches. Set up an auto-update system if possible.

### 3. **Use Strong Passwords**
   If you enable remote access to your server or use an admin panel, make sure you use strong, unique passwords. Avoid default usernames and passwords.

### 4. **Enable Firewalls**
   Ensure that your router and PC have firewalls configured to block unauthorized access. Only open necessary ports (default: port 19132 for Minecraft Bedrock Edition).

### 5. **Set Up Whitelist/Blacklist**
   Use a whitelist to only allow certain players to connect. You can enable this in the `server.properties` file by setting `white-list=true`.

### 6. **Monitor Server Logs**
   Regularly check your server logs for any suspicious activity. Look out for login attempts and potential exploits.

### 7. **Backup Your Server Regularly**
   Backup your server data and worlds regularly, especially before making updates or changes.

### 8. **Disable Remote Console**
   If you don’t need remote console access, disable it in the `server.properties` file by setting `remote-console=false`.

---

## Starting the Server

1. Double-click the `start.bat` or run the `start.sh` script to start the server.
2. You should see Minecraft's startup process in the terminal/command prompt. Once the server is running, it will allow players to connect.

---

## Server Maintenance

- **Monitor Server Performance**: Regularly check the CPU and RAM usage to ensure smooth operation. Use software like Task Manager (Windows) or `top`/`htop` (Linux) to monitor system resources.
- **Update Plugins/Mods**: If you're using plugins or mods, make sure to keep them updated to prevent security vulnerabilities.
- **Clear Unused Files**: Regularly clean up logs and old worlds to free up space.

---

## Useful Links

- [Minecraft Bedrock Edition Server Download](https://www.minecraft.net/en-us/download/server/bedrock)
- [Tailscale Official Website](https://tailscale.com/)
- [Docker Documentation](https://docs.docker.com/)
- [Minecraft Server Configuration Guide](https://minecraft.fandom.com/wiki/Server.properties)
- [How to Use Docker for Minecraft Server](https://hub.docker.com/r/itzg/minecraft-bedrock-server)
