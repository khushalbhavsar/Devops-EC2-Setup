#!/bin/bash
set -e

echo "Updating EC2 system..."
sudo yum update -y && sudo yum upgrade -y
