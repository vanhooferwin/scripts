#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/vanhooferwin/scripts/main/python/install.sh | bash

set -e  # Exit on any error

echo "Updating package list..."
sudo apt update -y

echo "Installing Python 3 and pip..."
sudo apt install -y python3 python3-pip python3-venv

# Verify installation
echo "Verifying installation..."
python3 --version
pip3 --version

echo "Python 3 has been installed successfully!"