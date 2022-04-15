#!/bin/bash

check_res=$(zathura --version 2> /dev/null)
echo $check_res
if [[ $? -ne 0 || $checkres -ne *"pdf"* ]]; then
    
    echo "Zathura не установлен!"
    exit
    
fi

sem=$1
str_num=$2

zathura ~/gnu-koryavov/KORYAVNIKS/${sem}.djvu -P $str_num 2> /dev/null

