#!/bin/bash

home_dir="gnu-koryavov"
scipts_dir="scripts"

read -p "Вы уверены, что хотите установить скрипт gnu-koryavov в систему? (Д/н): " ans

if [[ $ans == "y"* || $ans == "Y"* || $ans == "д"* || $ans == "Д"* ]]; then

    mkdir -p -v ~/$home_dir/KORYAVNIKS
    cp ../config.conf ~/$home_dir
    sudo cp run.sh /usr/local/bin/$home_dir
    
    echo "Cкрипт gnu-koryavov установлен."

fi
