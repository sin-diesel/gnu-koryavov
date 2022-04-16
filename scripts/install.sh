#!/bin/bash

home_dir="gnu-koryavov"
scipts_dir="scripts"

ubuntu_default_editor="atril"

read -p "Are you sure you want to install gnu-koryavov on yout system (Y/N): " ans

echo "Determining OS version..."
os_info=$(cat /etc/*release)
echo "$os_info"

is_ubuntu=$(echo $os_info | grep -i "ubuntu")

if [[ $? -eq 0 ]] ; then

    echo "Running on ubuntu machine. Default editor: $ubuntu_default_editor"
    sed -i "s/okular.sh/atril.sh/g" ../config.conf
    cat ../config.conf

fi 

if [[ $ans == "y"* || $ans == "Y"*  ]]; then

    mkdir -p -v ~/$home_dir/KORYAVNIKS
    cp ../config.conf ~/$home_dir
    sudo cp run.sh /usr/local/bin/$home_dir
    
    echo "gnu-koryavov successfully installed."

fi

