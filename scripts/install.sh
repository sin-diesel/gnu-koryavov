#!/bin/bash
set -uo pipefail

home_dir="gnu-koryavov"
scipts_dir="scripts"
gnukoryavov_name="gnu-koryavov"
main_config=../configs/config.conf


read -p "Are you sure you want to install gnu-koryavov on your system? (Y/n): " ans


echo $HOME

    viewer="NO VIEWER"

    for item in ${default_viewers[*]}; do

    exec ./preinst.sh
    if [[ $? != 0 ]]; then
        echo "Installation is not certified due to lack of dependencies"
        exit 0
    fi


    if [[ $viewer == "NO VIEWER" ]]; then
        echo "No supported DjVU viewer installed (see README for more information). Proceeding with default value"
    else
        echo "Choosen djvu viewer: $viewer. You can change it at any time (for more information see README)"
        sed -i "/djvuviewer_script/s/=.*\.sh/=~\/gnu-koryavov\/$viewer.sh/" $main_config
    fi
fi


cp -v $main_config $HOME/$home_dir
echo "gnu-koryavov successfully installed."
