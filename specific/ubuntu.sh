#!/bin/bash

# Node installation (nvm)
apt install curl unzip openjdk-8-jdk tree
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile   # load profile
nvm install lts --reinstall-packages-from=default --latest-npm

# app installs
apt install musescore
