#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/vanhooferwin/scripts/main/nodejs/install.sh | bash

set -e  # Exit on any error

# Node.js version
NODE_VERSION="22.11.0"

echo "Updating package list..."
sudo apt update -y

echo "Installing prerequisites..."
sudo apt install -y curl ca-certificates

echo "Adding NodeSource repository..."
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

echo "Installing Node.js v$NODE_VERSION..."
sudo apt install -y nodejs

# Verify installation
echo "Verifying installation..."
node -v
npm -v

echo "Node.js v$NODE_VERSION has been installed successfully!"