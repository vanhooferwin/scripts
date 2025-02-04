#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/vanhooferwin/scripts/main/nginx/install.sh | bash

set -e  # Exit on error

echo "Updating package list..."
sudo apt update -y

echo "Installing Nginx..."
sudo apt install -y nginx

echo "Starting Nginx service..."
sudo systemctl enable nginx
sudo systemctl start nginx

# Verify installation
echo "Checking Nginx status..."
sudo systemctl status nginx --no-pager

echo "Nginx has been installed successfully!"
echo "Visit http://<your-server-ip> to verify."