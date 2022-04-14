#!/bin/bash

home_dir="gnu-koryavov"
gnukoryavov_name="test-gnu-koryavov"
scipts_dir="scripts"


read -p "Вы уверены, что хотите установить скрипт gnu-koryavov в систему? (Д/н): " ans
if [[ $ans == "y"* || $ans == "Y"* || $ans == "д"* || $ans == "Д"* ]]; then

    mkdir -p -v ~/$home_dir/KORYAVNIKS
    cp config.conf ~/$home_dir
    sudo cp $scripts_dir/run.sh /usr/local/bin/$gnukoryavov_name
    
    echo "Cкрипт gnu-koryavov установлен."
fi

read -p "Хотите ли Вы использовать готовый скрипт просмотра Корявника? (Д/н): " ans
if [[ $ans == "y"* || $ans == "Y"* || $ans == "д"* || $ans == "Д"* ]]; then

    cp -r openscripts/ ~/$home_dir/
    
    #okular --version > /dev/null
    #sed -i '/pdfviewer_script/s/=.*\.sh/='$(pdfviewer)'.sh/' test.conf

fi
