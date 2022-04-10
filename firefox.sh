#!/bin/bash

firefox --version 2> /dev/null
if [[ $? -ne 0 ]]; then
    
    echo "Firefox не установлен!"
    exit
    
fi

sem=$1
str_num=$2

firefox ~/gnu-koryavov/KORYAVNIKS/${sem}.pdf#page=$str_num

#sudo apt install djvulibre-bin
#ps2pdf
