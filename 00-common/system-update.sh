#!/bin/bash
set -e

echo "Updating Amazon Linux system..."
if command -v dnf >/dev/null 2>&1; then
	sudo dnf update -y
else
	sudo yum update -y
fi
