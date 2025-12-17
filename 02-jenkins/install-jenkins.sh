#!/bin/bash
set -e

echo "🚀 Installing Jenkins..."

sudo yum install -y java-17-amazon-corretto

sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "✅ Jenkins installed"
