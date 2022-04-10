#!/bin/bash

open() {

    sem=$1
    str_num=$2

    source ~/gnu-koryavov/config.conf


    if [ ! -f ~/gnu-koryavov/KORYAVNIKS/${sem}.djvu ]; then
        download $sem
    fi
    
    ${pdfviewer_script} $sem $str_num

}

download() {
    
    sem=$1

    source ~/gnu-koryavov/config.conf

    cd ~/gnu-koryavov/KORYAVNIKS/ && wget -O ${sem}.djvu ${KORYAVNIKS[$sem]}

}


# get input options
while getopts ":s:n:o:h" opt; do
    case ${opt} in
        s) # -s <semester>
            arg="$OPTARG"
            echo "Выбранный семестр: $arg"
            sem=$arg
            ;;

        n) # -n <problem-number> 
            arg="$OPTARG"
            echo "Выбранная задача: $arg"
            zad=$arg
            ;;
        o) # -open
            open=true
            echo "Электронный корявник будет открыт"
            ;;
        \?|h)
            echo "Usage: TODO"
            exit 1
            ;;
    esac
done

# exit if no option is provided
if [ "$#" -lt 2 ]; then
    echo "Usage: TODO"
    exit 1
fi

shift $((OPTIND -1))

task_regex="[[:digit:]]+\.[[:digit:]]+"
if ! [[ $zad =~ $task_regex ]]; then
    echo "Укажите номер задачи корректно!"
    exit 1
fi


if [ ! -f /tmp/gnu-koryavov/${sem}-${zad}.tmp ]; then

    mkdir -p /tmp/gnu-koryavov/
    curl -s  "https://mipt1.ru/1_2_3_4_5_kor.php?sem=$sem&zad=$zad" |  iconv -f WINDOWS-1251 -t UTF-8 > /tmp/gnu-koryavov/${sem}-${zad}.tmp
    
fi

status=$(egrep "Задача [[:digit:]]{1,2}\.[[:digit:]]{1,4} найдена" /tmp/gnu-koryavov/${sem}-${zad}.tmp)

if [[ $? -eq 0 ]]; then

    str_num=$(echo $status | sed -nr "s/.*на странице №([[:digit:]]{1,4})!.*/\1/p")
    echo "Задача $zad найдена на странице №$str_num!"
    
    if [[ $open = true ]]; then
        open $sem $str_num
    fi

else
    echo "Задача $zad не найдена в корявнике :("
fi


# filesize=$(stat --format="%s" /tmp/gnu-koryavov/${sem}-${zad}.tmp)
# if [[ $filesize -eq 0 ]]; then

#     rm /tmp/gnu-koryavov/${sem}-${zad}.tmp
    
# fi
