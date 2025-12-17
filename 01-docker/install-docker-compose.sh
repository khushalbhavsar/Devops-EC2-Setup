#!/bin/bash
set -e

echo "📦 Installing Docker Compose..."

DOCKER_COMPOSE_VERSION="v2.27.0"

sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" \
-o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

echo "✅ Docker Compose installed"
