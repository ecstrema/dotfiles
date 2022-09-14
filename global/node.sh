#!/bin/bash

sudo npm install -g npm@latest

# npm packages (using pnpm)
npm i -g pnpm
pnpm setup
source /home/codespace/.bashrc
pnpm i -g @antfu/ni
ni -g typescript nodemon gh-pages license np zx rimraf
