#!/bin/bash

evince --version 2> /dev/null
if [[ $? -ne 0 ]]; then
    
    echo "Evince not installed!"
    exit
    
fi

sem=$1
str_num=$2

evince -i $str_num ~/gnu-koryavov/KORYAVNIKS/${sem}.djvu 2> /dev/null
