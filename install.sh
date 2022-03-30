#!/bin/bash

echo "Вы уверены, что хотите установить скрипт gnu-koryavov в систему? (Д/н): "
read ans

if [[ $ans == "y"* || $ans == "Y"* || $ans == "д"* || $ans == "Д"* ]]; then

    mkdir -p -v ~/gnu-koryavov/KORYAVNIKS
    cp config.conf ~/gnu-koryavov
    sudo cp run.sh /usr/local/bin/gnu-koryavov
    
    echo "скрипт gnu-koryavov установлен"
fi
