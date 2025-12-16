#!/bin/bash
set -e

echo "Updating EC2 system..."
sudo apt update -y && sudo apt upgrade -y
