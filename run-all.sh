#!/bin/bash
set -e

echo "Starting AWS EC2 DevOps setup..."

bash 00-common/system-update.sh
bash 00-common/aws-ec2-hardening.sh
bash 00-common/swap-memory.sh
bash 01-docker/install-docker.sh
bash 01-docker/install-docker-compose.sh
bash 02-jenkins/install-jenkins.sh
bash 03-sonarqube/install-sonarqube.sh
bash 04-prometheus/install-prometheus.sh
bash 05-grafana/install-grafana.sh

echo "Setup completed. Reboot recommended."
