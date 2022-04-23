#!/bin/bash
set -uo pipefail

home_dir="gnu-koryavov"
scipts_dir="scripts"

ubuntu_default_editor="atril"

read -p "Are you sure you want to install gnu-koryavov on yout system (Y/N): " ans


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
sed -i "/djvuviewer_script/s/=~\/gnu-koryavov\/.*\.sh/=~\/gnu-koryavov\/$editor.sh/g" ./../config.conf

exit

echo $HOME

if [[ $ans == "y"* || $ans == "Y"*  ]]; then

    mkdir -p -v $HOME/$home_dir/KORYAVNIKS
    cp ../config.conf $HOME/$home_dir
    sudo cp run.sh /usr/local/bin/$home_dir
    sudo cp ../editors/atril.sh $HOME$/$home_dir
    
    echo "gnu-koryavov successfully installed."

fi

