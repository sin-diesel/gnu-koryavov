#!/bin/bash

okular --version > /dev/null
if [[ $? != 0 ]]; then
    
    echo "Okular не установлен!"
    exit
    
fi

sem=$1
str_num=$2

okular -p $str_num KORYAVNIKS/${sem}.djvu
