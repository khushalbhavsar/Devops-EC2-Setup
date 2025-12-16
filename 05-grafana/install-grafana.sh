#!/bin/bash
set -e

wget -q -O - https://packages.grafana.com/gpg.key | sudo yum-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | \
sudo yum update -y
sudo systemctl enable grafana-server
echo "Installing Grafana..."
sudo tee /etc/yum.repos.d/grafana.repo <<EOF
[grafana]
name=Grafana OSS
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
EOF
sudo yum install -y grafana
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
