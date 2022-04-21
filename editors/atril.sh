#!/bin/bash
set -euo pipefail

atril --version 2> /dev/null
if [[ $? -ne 0 ]]; then
    
    echo "Atril not installed!"
    exit
    
fi

sem=$1
str_num=$2

echo "Launching atril on page $str_num..."
atril -p $str_num ~/gnu-koryavov/KORYAVNIKS/${sem}.djvu
