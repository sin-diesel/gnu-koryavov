#!/bin/bash
set -uo pipefail

home_dir="gnu-koryavov"
scipts_dir="scripts"

ubuntu_default_editor="atril"

read -p "Are you sure you want to install gnu-koryavov on yout system (Y/N): " ans

#echo "Determining OS version..."
#os_info=$(cat /etc/*release)
#echo "$os_info"

#is_ubuntu=$(echo $os_info | grep -i "ubuntu")

#if [[ $? -eq 0 ]] ; then

#    echo "Running on ubuntu machine. Default editor: $ubuntu_default_editor"

#fi


editors=(okular atril evince xreader zathura)
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
sed -i "s/okular.sh/$editor.sh/" ./../config.conf


echo $HOME

if [[ $ans == "y"* || $ans == "Y"*  ]]; then

    mkdir -p -v $HOME/$home_dir/KORYAVNIKS
    cp ../config.conf $HOME/$home_dir
    sudo cp run.sh /usr/local/bin/$home_dir
    sudo cp ../editors/atril.sh $HOME$/$home_dir
    
    echo "gnu-koryavov successfully installed."

fi

