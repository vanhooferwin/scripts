#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/vanhooferwin/scripts/main/nginx/remove.sh | bash

set -e  # Exit on error

echo "Stopping Nginx service..."
sudo systemctl stop nginx

echo "Removing Nginx..."
sudo apt remove -y nginx nginx-common

echo "Purging Nginx configuration files..."
sudo apt purge -y nginx nginx-common

echo "Removing additional Nginx files..."
sudo rm -rf /etc/nginx
sudo rm -rf /var/log/nginx
sudo rm -rf /var/lib/nginx

echo "Cleaning up package manager..."
sudo apt autoremove -y
sudo apt autoclean -y

echo "Nginx has been successfully removed!"