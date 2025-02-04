#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/vanhooferwin/scripts/main/docker/remove.sh | bash

set -e  # Exit on any error

echo "Removing Docker..."
sudo apt remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Purging Docker packages..."
sudo apt purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Removing Docker directories..."
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker
sudo rm -rf ~/.docker

echo "Cleaning up package manager..."
sudo apt autoremove -y
sudo apt autoclean -y

echo "Docker has been successfully removed!"