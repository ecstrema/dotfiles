#!/usr/bin/bash

# copy files
cp -R copy/. $HOME

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source "./specific/ubuntu.sh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source "./specific/macos.sh"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "No script for cygwin"
elif [[ "$OSTYPE" == "msys" ]]; then
    echo "No script for msys/windows"
elif [[ "$OSTYPE" == "win32" ]]; then
    echo "No script for win32"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "No script for freebsd"
else
    echo "Unknown OS."
fi

# Global scripts
for f in "./global/*"; do
   source $f
done
