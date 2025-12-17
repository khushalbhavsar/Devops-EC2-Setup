#!/bin/bash
set -e

echo "🔍 Installing SonarQube (Docker)..."

docker volume create sonarqube_data

docker run -d \
  --name sonarqube \
  -p 9000:9000 \
  -v sonarqube_data:/opt/sonarqube/data \
  sonarqube:lts

echo "✅ SonarQube running on port 9000"
