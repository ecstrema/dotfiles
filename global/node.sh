#!/bin/bash
set -x
sudo npm install -g npm@latest

# npm packages (using pnpm)
npm i -g pnpm
pnpm setup
export PNPM_HOME="/home/codespace/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
source /home/codespace/.bashrc
sudo pnpm i -g @antfu/ni
sudo ni -g typescript nodemon gh-pages license np zx rimraf
