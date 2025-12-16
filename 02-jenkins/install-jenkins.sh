#!/bin/bash
set -e

echo "Installing Jenkins..."

sudo yum install -y fontconfig openjdk-17-jre

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/yum/sources.list.d/jenkins.list > /dev/null

sudo yum update -y
sudo yum install -y jenkins

sudo systemctl enable jenkins
sudo systemctl start jenkins
