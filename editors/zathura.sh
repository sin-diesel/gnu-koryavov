#!/bin/bash

home_dir=".gnu-koryavov"

check_res=$(zathura --version 2> /dev/null)
if [[ $? -ne 0 || ! $check_res == *"djvu"* ]]; then
    
    echo "Zathura DjVU не установлен!"
    exit
    
fi

sem=$1
str_num=$2

zathura $HOME/$home_dir/KORYAVNIKS/${sem}.djvu -P $str_num 2> /dev/null

