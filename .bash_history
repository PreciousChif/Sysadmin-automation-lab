su -sysadmin
sudo passwd sysadmin
sudo su - sysadmin
sudo adduser sysadmin
sudo usermod -aG sudo sysadmin
# Create a new group called webdev
sudo groupadd webdev
# Create the directory
sudo mkdir -p /var/www/project
# Change ownership of the directory so the group owns it
sudo chown -R root:webdev /var/www/project
# Set permissions: Read, write, execute for owner and group; read/execute for others
sudo chmod -R 775 /var/www/project
# Add your sysadmin user to the webdev group
sudo usermod -aG webdev sysadmin
sudo apt update
sudo apt install nginx -y
sudo systemctl status nginx
# Stop Nginx
sudo systemctl stop nginx
# Restart Nginx
sudo systemctl restart nginx
# Ensure it starts automatically every time the computer/server boots up
sudo systemctl enable nginx
sudo ss -tulpn | grep nginx
cd /var/log
ls
sudo tail -f /var/log/auth.log
# Create a new group called webdev
sudo groupadd webdev
# Create the directory
sudo mkdir -p /var/www/project
# Change ownership of the directory so the group owns it
sudo chown -R root:webdev /var/www/project
# Set permissions: Read, write, execute for owner and group; read/execute for others
sudo chmod -R 775 /var/www/project
# Add your sysadmin user to the webdev group
sudo usermod -aG webdev sysadmin
# Update package list and install Nginx
sudo apt update && sudo apt install nginx -y
# Check if Nginx is running
sudo systemctl status nginx
# Move into the log directory
cd /var/log
# List the log files available
ls
sudo tail -n 20 auth.log
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 'Nginx HTTP'
sudo ufw enable
sudo ufw status verbose
sudo nano /etc/ssh/sshd_config
sudo apt update && sudo apt install openssh-server -y
sudo nano /etc/ssh/sshd_config
sudo systemctl restart ssh
# Update package list
sudo apt update
# Install Docker dependencies and Docker
sudo apt install docker.io -y
# Start and enable Docker on boot
sudo systemctl start docker
sudo systemctl enable docker
# Add your current user to the docker group
sudo usermod -aG docker $USER
