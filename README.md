# SysAdmin & Containerized Deployment Lab

A hands-on systems administration and infrastructure automation project built on Ubuntu (WSL). This project demonstrates foundational Linux hardening, firewall configuration, Docker containerization, and shell script automation for continuous deployment.

## 🛠️ Tech Stack & Tools
* **Operating System:** Ubuntu (WSL)
* **Web Server:** Nginx (Containerized)
* **Containerization:** Docker
* **Security & Firewall:** UFW (Uncomplicated Firewall), OpenSSH Server (Hardened)
* **Automation:** Bash Scripting

---

## 🚀 Project Architecture & Implementation

### 1. Linux Foundations & Security Hardening
* **User & Group Management:** Configured dedicated administrative users and web developer groups with strict file ownership permissions (`/var/www/project`).
* **SSH Hardening:** Secured remote access by modifying `/etc/ssh/sshd_config` to disable root login (`PermitRootLogin no`) and enforce authentication best practices.
* **Firewall Configuration:** Configured UFW rules to restrict unauthorized traffic while allowing necessary administrative and web services.

### 2. Containerized Services (Docker)
* Installed and configured the Docker daemon on Ubuntu.
* Migrated standard web hosting to containerized architecture by running isolated Nginx containers with custom port mapping (`-p 8080:80`).
* Practiced container lifecycle management (`docker ps`, `docker stop`, `docker rm`).

### 3. Infrastructure Automation (`deploy.sh`)
Authored an automated deployment script to streamline service updates and eliminate manual CLI intervention. 

**Script Workflow (`/var/www/project/scripts/deploy.sh`):**
1. Checks for any currently running instances of the target container (`my-web-server`).
2. Gracefully stops and removes existing containers to prevent port conflicts.
3. Provisions and launches a fresh container instance using the official Nginx image.

```bash
#!/bin/bash

echo "Starting automated deployment..."

# Stop and remove any existing container named 'my-web-server' if it exists
if [ "$(docker ps -aq -f name=my-web-server)" ]; then
    echo "Stopping existing container..."
    docker stop my-web-server
    docker rm my-web-server
fi

echo "Deploying new Nginx container..."
docker run -d --name my-web-server -p 8080:80 nginx

echo "Deployment complete! Access via http://localhost:8080"
