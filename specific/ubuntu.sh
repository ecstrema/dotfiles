# Node installation (nvm)
apt install curl
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile   # reload profile
nvm install lts --reinstall-packages-from=default --latest-npm

# app installs
apt install musescore
