#!/bin/bash
set -e

echo "Installing Grafana..."

wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

echo "deb https://packages.grafana.com/oss/deb stable main" | \
sudo tee /etc/apt/sources.list.d/grafana.list

sudo apt update -y
sudo apt install -y grafana

sudo systemctl enable grafana-server
sudo systemctl start grafana-server
