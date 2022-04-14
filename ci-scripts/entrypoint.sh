#!/bin/sh


install_dir="scripts/"

cd ../ && \
echo "Searching $install_dir directory in $PWD..."

cd $install_dir && \
echo "Running install.sh..." &&
chmod +x install.sh && \
./install.sh
