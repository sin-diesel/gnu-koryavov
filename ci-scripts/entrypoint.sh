#!/bin/sh


install_dir="scripts/"
workingdir="/home/gnu-koryavov"

echo "$PWD contents:"
ls -la

cd $workingdir && \
echo "Searching $install_dir directory in $PWD..."

cd $install_dir && \
echo "Running install.sh..." &&
chmod +x install.sh && \
./install.sh
