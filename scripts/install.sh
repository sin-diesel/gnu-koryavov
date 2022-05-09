#!/bin/bash
set -uo pipefail

install_config=../configs/install.conf
source $install_config


read -p "Are you sure you want to install gnu-koryavov on your system? (Y/n): " ans


echo $HOME

if [[ $ans == "y"* || $ans == "Y"*  ]]; then

    mkdir -p -v $HOME/$home_dir/KORYAVNIKS
    cp $main_config $HOME/$home_dir
    sudo cp run.sh /usr/local/bin/$gnukoryavov_name

    exec ./preinst.sh
    if [[ $? != 0 ]]; then
        echo "Installation is not certified due to lack of dependencies"
        exit 0
    fi

    read -p "Are you going to use one of the default document viewer scripts? (Y/n): " ans
    if [[ $ans == "y"* || $ans == "Y"*  ]]; then
        cp ../editors/* $HOME/$home_dir/
    fi

    echo "gnu-koryavov successfully installed."

fi
