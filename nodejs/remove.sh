#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/vanhooferwin/scripts/main/nodejs/remove.sh | bash

set -e  # Exit on any error

echo "Removing Node.js and npm..."
sudo apt remove -y nodejs npm

echo "Purging Node.js and npm packages..."
sudo apt purge -y nodejs npm

echo "Removing additional Node.js files..."
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf ~/.npm
sudo rm -rf ~/.node-gyp
sudo rm -rf /usr/lib/node_modules
sudo rm -rf /usr/local/include/node
sudo rm -rf /usr/local/bin/node
sudo rm -rf /usr/local/bin/npm
sudo rm -rf /usr/local/share/man/man1/node*
sudo rm -rf /usr/local/lib/dtrace/node.d

echo "Cleaning up package manager..."
sudo apt autoremove -y
sudo apt autoclean -y

echo "Node.js has been successfully removed from your system!"