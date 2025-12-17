#!/bin/bash
set -e

echo "🚀 Starting AWS EC2 DevOps setup..."

for dir in 00-common 01-docker 02-jenkins 03-sonarqube 04-prometheus 05-grafana
do
  for script in $dir/*.sh
  do
    echo "▶ Running $script"
    bash $script
  done
done

echo "🎉 DevOps EC2 setup completed!"
echo "⚠️ Logout & login again for Docker group changes"
