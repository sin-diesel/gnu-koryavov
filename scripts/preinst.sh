#!/bin/bash
set -uo pipefail


install_config=../configs/install.conf
source $install_config


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
    exit 2
fi

echo "Choosen editor: $editor. You can change it as wrote in README"
sed -i "/djvuviewer_script/s/=.*\.sh/=~\/gnu-koryavov\/$editor.s    h/" $main_config


for utility in ${dependencies[*]}; do

    $utility --version &> /dev/null
    if [[ $? != 0 ]]; then
        echo "$utility is not installed!"
        exit 1
    fi
done


exit 0

