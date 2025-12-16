#!/bin/bash
set -e

sudo yum install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://get.docker.com | sudo bash
sudo usermod -aG docker ubuntu
sudo systemctl enable docker
echo "Docker installed successfully"
echo "Installing Docker..."
sudo yum install -y docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
echo "Docker installed"
