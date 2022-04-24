#!/bin/bash

home_dir=".gnu-koryavov"

xreader --version 2> /dev/null
if [[ $? -ne 0 ]]; then
    
    echo "Xreader not installed!"
    exit
    
fi

sem=$1
str_num=$2

xreader -p $str_num $HOME/$home_dir/KORYAVNIKS/${sem}.djvu 2> /dev/null
