#!/bin/bash
set -e

echo "🐳 Installing Docker..."

sudo yum install -y docker
sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker ec2-user

echo "✅ Docker installed"
