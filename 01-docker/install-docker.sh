#!/bin/bash
set -e

echo "Installing Docker on EC2..."

sudo apt install -y ca-certificates curl gnupg lsb-release

curl -fsSL https://get.docker.com | sudo bash

sudo usermod -aG docker ubuntu

sudo systemctl enable docker
sudo systemctl start docker

echo "Docker installed successfully"
