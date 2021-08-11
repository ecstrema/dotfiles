# copy files
cp -r /copy/* $HOME


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source "/specific/ubuntu.sh";
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source "/specific/macos.sh";
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
else
        echo "Unknown OS."
fi

# Global scripts
for f in ../global/*; do
   source $f
done
