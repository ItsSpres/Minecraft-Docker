
# Minecraft Bedrock Server in Docker 🛠️🎮

This repository contains a Docker image to run a **Minecraft Bedrock Edition Server** with the following features:
- Securely connects to your network using **Tailscale**. 🔒
- Automatically performs **periodic backups** without disrupting gameplay. 💾
- Fully configurable and easy to deploy. 🚀

---

## Features ✨
- **Tailscale Integration**: Uses Tailscale to secure connections.
- **Continuous Backups**: Creates backups while players are online or after all players leave.
- **Customizable**: Easy-to-edit configurations via environment variables.

---

## Prerequisites ✅
1. [Docker](https://www.docker.com/) installed.
2. A Tailscale account and a generated authentication key.
3. (Optional) [Git](https://git-scm.com/) for cloning this repository.

---

## Setup Instructions 🛠️

### Step 1: Clone the Repository
```bash
git clone https://github.com/yourusername/mc-bedrock-docker.git
cd mc-bedrock-docker
```

### Step 2: Configure Environment Variables
Create a `.env` file in the project root and add your configuration:
```env
TAILSCALE_AUTH_KEY=your-tailscale-auth-key
MC_SERVER_NAME=MyMinecraftServer
MC_MAX_PLAYERS=10
```

### Step 3: Build and Run the Docker Image
```bash
docker-compose up --build
```

---

## Backup Configuration 💾
Backups are saved in the `backups/` directory. The server performs periodic backups without requiring downtime:
- By default, backups occur every 30 minutes. You can adjust this by editing the `BACKUP_INTERVAL` environment variable.

---

## Contributions 🤝
Feel free to fork this repository, submit pull requests, or create issues to suggest features and improvements. 

---

## License 📄
This project is open-source under the [MIT License](LICENSE).

---

Happy gaming! 🎉
