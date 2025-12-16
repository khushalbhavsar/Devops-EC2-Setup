#!/bin/bash
set -e

echo "Installing Docker Compose..."

sudo curl -L https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version

sudo chmod +x /usr/local/bin/docker-compose
