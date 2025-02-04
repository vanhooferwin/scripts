#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/vanhooferwin/scripts/main/docker/install.sh | bash

set -e  # Exit on any error

echo "Updating package list..."
sudo apt update -y

echo "Installing dependencies..."
sudo apt install -y ca-certificates curl gnupg

echo "Adding Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating package list again..."
sudo apt update -y

echo "Installing Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Adding current user to Docker group..."
sudo usermod -aG docker $USER

echo "Docker has been installed successfully!"
echo "You may need to log out and log back in to use Docker without sudo."

# Verify installation
docker --version || echo "Docker command not found, please restart your session."
