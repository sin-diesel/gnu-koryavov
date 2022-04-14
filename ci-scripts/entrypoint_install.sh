#!/bin/sh


install_dir="scripts/"
workingdir="/home/gnu-koryavov"


echo "$PWD contents:"
ls -la

cd $workingdir && \
echo "Searching $install_dir directory in $PWD..."

cd $install_dir && \
ls -la &&
echo "Running install.sh..." &&
chmod +x install.sh && \
yes | ./install.sh

# verify if installation process is ok
if [ -d "$HOME/gnu-koryavov/KORYAVNIKS" ]; then

    echo "KORYAVNIKS exists test: OK"

else

    echo "KORYAVNIKS exists test: FAIL"
    exit 1

fi

if [ -f "$HOME/gnu-koryavov/config.conf" ]; then

    echo "config.conf exists test: OK"

else

    echo "config.conf exists test: FAIL"
    exit 1
    
fi

if [ -f "/usr/local/bin/gnu-koryavov" ]; then

    echo "/usr/local/bin/gnu-koryavov exists test: OK"

else

    echo "/usr/local/bin/gnu-koyravov exists test: FAIL"
    exit 1
    
fi

