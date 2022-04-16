#!/bin/bash

home_dir="gnu-koryavov"
scipts_dir="scripts"

read -p "Are you sure you want to install gnu-koryavov on yout system (Y/N): " ans

if [[ $ans == "y"* || $ans == "Y"*  ]]; then

    mkdir -p -v ~/$home_dir/KORYAVNIKS
    cp ../config.conf ~/$home_dir
    sudo cp run.sh /usr/local/bin/$home_dir
    
    echo "gnu-koryavov successfully installed."

fi
