#!/bin/bash
set -e

echo "🔄 Updating system packages..."

if command -v dnf &>/dev/null; then
    # Amazon Linux 2023

    echo "⚙️ Detected Amazon Linux 2023 (dnf)"

    sudo dnf update -y

    # Fix curl-minimal conflict
    if rpm -q curl-minimal &>/dev/null; then
        echo "🔧 Removing curl-minimal and installing full curl..."
        sudo dnf remove -y curl-minimal
        sudo dnf install -y curl
    fi

    sudo dnf install -y wget git unzip

else
    # Amazon Linux 2
    echo "⚙️ Detected Amazon Linux 2 (yum)"

    sudo yum update -y
    sudo yum install -y curl wget git unzip
fi

echo "✅ System update completed"
