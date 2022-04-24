#!/bin/bash

home_dir=".gnu-koryavov"

okular --version 2> /dev/null
if [[ $? -ne 0 ]]; then
    
    echo "Okular not installed!"
    exit
    
fi

sem=$1
str_num=$2

okular -p $str_num $HOME/$home_dir/KORYAVNIKS/${sem}.djvu 2> /dev/null
