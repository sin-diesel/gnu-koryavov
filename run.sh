#!/bin/bash

open() {

    sem=$1
    str_num=$2
    source ~/gnu-koryavov/config.conf

    read -p "Открыть электронный корявник? (Д/н): " ans
        
    if [[ $ans == "y"* || $ans == "Y"* || $ans == "д"* || $ans == "Д"* ]]; then

        if [ ! -f ~/gnu-koryavov/KORYAVNIKS/${sem}.djvu ]; then
        
            download $sem
        
        fi
        
        ${pdfviewer_script} $sem $str_num

    fi
}

download() {
    
    sem=$1
    source ~/gnu-koryavov/config.conf

    cd ~/gnu-koryavov/KORYAVNIKS/ && wget -O ${sem}.djvu ${KORYAVNIKS[$sem]}
}

# get input options
while getopts ":s:n:h" opt; do
    case ${opt} in
        s)
            arg="$OPTARG"
            echo "Выбранный семестр: $arg"
            sem=$arg
            ;;

        n)  
            arg="$OPTARG"
            echo "Выбранная задача: $arg"
            zad=$arg
            ;;
        ?|h)
            echo "Usage: TODO"
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

if [ ! -f /tmp/gnu-koryavov/${sem}-${zad}.tmp ]; then

    mkdir -p /tmp/gnu-koryavov/
    curl -s  "https://mipt1.ru/1_2_3_4_5_kor.php?sem=$sem&zad=$zad" |  iconv -f WINDOWS-1251 -t UTF-8 > /tmp/gnu-koryavov/${sem}-${zad}.tmp
    
fi

status=$(egrep "Задача [[:digit:]]{1,2}\.[[:digit:]]{1,4} найдена" /tmp/gnu-koryavov/${sem}-${zad}.tmp)

if [[ $? -eq 0 ]]; then

    str_num=$(echo $status | sed -nr "s/.*на странице №([[:digit:]]{1,4})!.*/\1/p")
    echo "Задача $zad найдена на странице №$str_num!"
    
    # open $sem $str_num

else
    echo "Задача $zad не найдена в корявнике :("
fi


# filesize=$(stat --format="%s" /tmp/gnu-koryavov/${sem}-${zad}.tmp)
# if [[ $filesize -eq 0 ]]; then

#     rm /tmp/gnu-koryavov/${sem}-${zad}.tmp
    
# fi
