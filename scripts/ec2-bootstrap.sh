#!/usr/bin/env bash

set -euo pipefail

APP_DIR=${1:-'/opt/expense-tracker'}

echo "Updating packages..."
sudo apt update

echo "Installing dependencies..."
sudo apt install -y \
    curl \
    rsync \
    ca-certificates \
    gnupg

if command -v docker >/dev/null 2>&1; then
    echo "Docker is already installed: $(docker --version)"
else
    echo "Installing Docker..."

    # Create keyring directory
    sudo install -m 0755 -d /etc/apt/keyrings

    # Download Docker GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
        | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Add Docker repository
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
      | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

    # Install Docker
    sudo apt update
    sudo apt install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin

    # Enable Docker on boot
    sudo systemctl enable docker
    sudo systemctl start docker

    # Allow ubuntu user to run docker without sudo
    sudo usermod -aG docker ubuntu

    echo "Docker installation completed."
    echo "⚠️  Log out and back in (or reboot) for the docker group change to take effect."
fi

sudo reboot