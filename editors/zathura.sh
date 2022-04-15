#!/bin/bash

zathura --version 2> /dev/null
if [[ $? -ne 0 ]]; then
    
    echo "Zathura не установлен!"
    exit
    
fi

sem=$1
str_num=$2

zathura ~/gnu-koryavov/KORYAVNIKS/${sem}.djvu -P $str_num 2> /dev/null

