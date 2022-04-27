#!/bin/bash

home_dir="gnu-koryavov"
scipts_dir="scripts"
gnukoryavov_name=gnu-koryavov
main_config=./../configs/editors
source ./../configs/dependencies


read -p "Are you sure you want to install gnu-koryavov on your system? (Y/n): " ans


source $main_config
editor="NO EDITOR"

for item in ${editors[*]}; do

    $item --version &> /dev/null
    if [[ $? == 0 ]]; then
        editor=$item
        break
    fi

done

if [[ $editor == "NO EDITOR" ]]; then

    echo "No supported DjVU viewer intalled"
    exit 0
fi

echo "Choosen editor: $editor. You can change it as wrote in README"
sed -i "/djvuviewer_script/s/=.*\.sh/=~\/gnu-koryavov\/$editor.sh/" $main_config


echo $HOME

if [[ $ans == "y"* || $ans == "Y"*  ]]; then

    mkdir -p -v $HOME/$home_dir/KORYAVNIKS
    cp ./../configs/config.conf $HOME/$home_dir
    sudo cp run.sh /usr/local/bin/$gnukoryavov_name

    for utility in ${dependencies[*]}; do

        $utility --version &> /dev/null
        if [[ $? != 0 ]]; then
            echo "$utility is not installed!"
            exit 1
        fi

    done

    read -p "Are you going to use one of the default document viewer scripts? (Y/n): " ans
    if [[ $ans == "y"* || $ans == "Y"*  ]]; then
        cp ../editors/* $HOME/$home_dir/
    fi
    
    echo "gnu-koryavov successfully installed."

fi

