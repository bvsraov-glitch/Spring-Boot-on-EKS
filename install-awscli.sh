#!/bin/bash
set -e

# Download AWS CLI v2 installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the installer
unzip awscliv2.zip

# Install AWS CLI
sudo ./aws/install

# Add AWS CLI to PATH
export PATH=$PATH:/usr/local/bin
if ! grep -q '/usr/local/bin' ~/.bashrc; then
  echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
fi

echo "AWS CLI installed successfully. Run 'aws --version' to verify."
