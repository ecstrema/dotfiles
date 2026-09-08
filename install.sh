#!/usr/bin/env bash

# copy files first, because some installation scripts append to the bashrc or similar
cp -R copy/. $HOME

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source "./specific/ubuntu.sh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source "./specific/macos.sh"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    source "./specific/win.sh"
else
    echo "No specific scripts for $OSTYPE!"
fi

echo "Done"
