#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/vanhooferwin/scripts/main/python/remove.sh | bash

set -e  # Exit on any error

echo "Removing Python 3 and pip..."
sudo apt remove -y python3 python3-pip python3-venv

echo "Purging Python 3 packages..."
sudo apt purge -y python3 python3-pip python3-venv

echo "Removing additional Python files..."
sudo rm -rf ~/.local/lib/python*
sudo rm -rf ~/.cache/pip
sudo rm -rf /usr/lib/python*
sudo rm -rf /usr/local/bin/python*
sudo rm -rf /usr/local/lib/python*

echo "Cleaning up package manager..."
sudo apt autoremove -y
sudo apt autoclean -y

echo "Python 3 has been successfully removed!"