#!/bin/bash

home_dir="gnu-koryavov"
scipts_dir="scripts"
gnukoryavov_name=gnu-koryavov-test
dependencies=(curl egrep sed)

ubuntu_default_editor="atril"

read -p "Are you sure you want to install gnu-koryavov on your system? (Y/n): " ans

echo "Determining OS version..."
os_info=$(cat /etc/*release)
echo "$os_info"

is_ubuntu=$(echo $os_info | grep -i "ubuntu")

if [[ $? -eq 0 ]] ; then

    echo "Running on ubuntu machine. Default editor: $ubuntu_default_editor"

fi

echo $HOME

if [[ $ans == "y"* || $ans == "Y"*  ]]; then

    mkdir -p -v $HOME/$home_dir/KORYAVNIKS
    cp ../config.conf $HOME/$home_dir
    sudo cp run.sh /usr/local/bin/$gnukoryavov_name

    for utility in ${dependencies[*]}; do

        $utility --version &> /dev/null
        if [[ $? ! -eq 0 ]]; then
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

