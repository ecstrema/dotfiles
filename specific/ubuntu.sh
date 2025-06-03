#!/usr/bin/bash

sudo apt update && sudo apt upgrade -y

# Utilities install
sudo apt install \
    apt-transport-https \
    build-essential \
    ca-certificates \
    chrome-gnome-shell \
    clang-format \
    cmake \
    curl \
    diffutils \
    findutils \
    flatpak \
    gcc-arm-none-eabi \
    gdb-multiarch \
    git \
    gnome-software-plugin-flatpak \
    gnome-tweaks \
    gpg \
    graphviz \
    grep \
    gzip \
    hostname \
    htop \
    inkscape \
    musescore \
    lcov \
    lldb \
    pipx \
    python3 \
    python3-matplotlib \
    python3-numpy \
    python3-pip \
    python3-venv \
    sshpass \
    tree \
    unzip \
    wget

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
rm -f packages.microsoft.gpg

wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor >warpdotdev.gpg
sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
rm warpdotdev.gpg
sudo apt update && sudo apt install warp-terminal

curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

curl -fsSL https://get.pnpm.io/install.sh | sh -
source ~/.bashrc
pnpm env --global use lts
