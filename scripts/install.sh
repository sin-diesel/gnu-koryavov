#!/bin/bash

home_dir="gnu-koryavov"
scipts_dir="scripts"
gnukoryavov_name="gnu-koryavov"
dependencies=(curl egrep sed wget)
default_editors=(okular atril evince xreader zathura)

#ubuntu_default_editor="atril"


read -p "Are you sure you want to install gnu-koryavov on your system? (Y/n): " ans
if [[ $ans != "y"* && $ans != "Y"*  ]]; then
    echo "Exiting..."
    exit 0
fi


echo "Checking dependencies..."
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

    editor="NO EDITOR"

    for item in ${default_editors[*]}; do

        $item --version &> /dev/null
        if [[ $? == 0 ]]; then
            editor=$item

            read -p "Found $editor installed. Do you want to stop searching? (Y/n): " ans
            if [[ $ans != "y"* || $ans != "Y"*  ]]; then
                break
            fi
        fi

    done

    if [[ $editor == "NO EDITOR" ]]; then
        echo "No supported DjVU viewer intalled. Proceeding with default value"
    else
        echo "Choosen djvu viewer: $editor. You can change it at any time (for more information see README)"
        sed -i "/djvuviewer_script/s/=.*\.sh/=~\/gnu-koryavov\/$editor.sh/" ../config.conf
    fi
fi

#echo $HOME


echo "Installing gnu-koryavov..."

mkdir -p -v $HOME/$home_dir/KORYAVNIKS
cp -v ../config.conf $HOME/$home_dir
sudo cp -v run.sh /usr/local/bin/$gnukoryavov_name

echo "gnu-koryavov successfully installed."

