#!/bin/bash
set -e

echo "🔐 Applying basic EC2 hardening..."

# Disable root SSH login
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

# Disable password authentication
sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

sudo systemctl restart sshd

echo "🔄 Enabling automatic security updates..."

if command -v dnf &>/dev/null; then
    # Amazon Linux 2023
    sudo dnf install -y dnf-automatic
    sudo systemctl enable --now dnf-automatic.timer
    echo "✅ dnf-automatic enabled (Amazon Linux 2023)"
else
    # Amazon Linux 2
    sudo yum install -y yum-cron
    sudo systemctl enable yum-cron
    sudo systemctl start yum-cron
    echo "✅ yum-cron enabled (Amazon Linux 2)"
fi

echo "✅ EC2 hardening completed"
