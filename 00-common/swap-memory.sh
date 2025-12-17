#!/bin/bash
set -e

SWAP_SIZE=2G

if free | grep -q Swap; then
  echo "⚠️ Swap already exists"
  exit 0
fi

echo "➕ Creating swap memory..."

sudo fallocate -l $SWAP_SIZE /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab

echo "✅ Swap memory added"
