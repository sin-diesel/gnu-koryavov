#!/bin/bash

atril --version 2> /dev/null
if [[ $? -ne 0 ]]; then
    
    echo "Atril не установлен!"
    exit
    
fi

sem=$1
str_num=$2

atril -p $str_num ~/gnu-koryavov/KORYAVNIKS/${sem}.djvu &>/dev/null &
