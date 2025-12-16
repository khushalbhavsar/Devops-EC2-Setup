#!/bin/bash
set -e

echo "Installing Grafana..."

wget -q -O - https://packages.grafana.com/gpg.key | sudo yum-key add -

echo "deb https://packages.grafana.com/oss/deb stable main" | \
sudo tee /etc/yum/sources.list.d/grafana.list

sudo yum update -y
sudo yum install -y grafana

sudo systemctl enable grafana-server
sudo systemctl start grafana-server
