#!/bin/bash
set -e

echo "🔄 Updating system packages..."

if command -v dnf &>/dev/null; then
  sudo dnf update -y
else
  sudo yum update -y
fi

sudo yum install -y curl wget git unzip
echo "✅ System updated"
