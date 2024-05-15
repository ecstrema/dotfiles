#!/usr/bin/bash

# Utilities install
sudo apt install curl unzip tree build-essential

# app installs
# sudo apt install musescore

curl -fsSL https://get.pnpm.io/install.sh | sh -
source /home/remimarche/.bashrc
pnpm env --global use lts
