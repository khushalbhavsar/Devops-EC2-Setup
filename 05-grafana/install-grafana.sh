#!/bin/bash
set -e

echo "📈 Installing Grafana..."

sudo yum install -y https://dl.grafana.com/oss/release/grafana-10.4.1-1.x86_64.rpm

sudo systemctl enable grafana-server
sudo systemctl start grafana-server

echo "✅ Grafana installed"
