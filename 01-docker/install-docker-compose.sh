#!/bin/bash
set -e

echo "Installing Docker Compose..."

sudo curl -L "https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-$(uname -s)-$(uname -m)" \

sudo chmod +x /usr/local/bin/docker-compose
