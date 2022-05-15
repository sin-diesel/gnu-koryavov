#!/bin/bash
set -uo pipefail

install_config=../configs/install.conf
source $install_config


read -p "Are you sure you want to install gnu-koryavov on your system? (Y/n): " ans
if [[ $ans != "y"* && $ans != "Y"*  ]]; then
    echo "Exiting..."
    exit 0
fi


bash ./preinst.sh

echo "Installing gnu-koryavov..."
mkdir -p -v $HOME/$home_dir/KORYAVNIKS
sudo cp -v run.sh /usr/local/bin/$gnukoryavov_name


read -p "Are you going to use one of the default document viewer scripts? (Y/n): " ans
if [[ $ans == "y"* || $ans == "Y"*  ]]; then

    cp -v ../editors/* $HOME/$home_dir/

    viewer="NO VIEWER"

    for item in ${default_viewers[*]}; do

        $item --version &> /dev/null
        if [[ $? == 0 ]]; then
            viewer=$item

            read -p "Found $viewer installed. Do you want to stop searching? (Y/n): " ans
            if [[ $ans != "y"* || $ans != "Y"*  ]]; then
                break
            fi
        fi

    done

    if [[ $viewer == "NO VIEWER" ]]; then
        echo "No supported DjVU viewer installed (see README for more information). Proceeding with default value"
    else
        echo "Choosen djvu viewer: $viewer. You can change it at any time (for more information see README)"
        sed -i "/djvuviewer_script/s/=.*\.sh/=~\/gnu-koryavov\/$viewer.sh/" $main_config
    fi
fi


cp -v $main_config $HOME/$home_dir
echo "gnu-koryavov successfully installed."

