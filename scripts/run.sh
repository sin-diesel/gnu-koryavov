#!/bin/bash
set -euo pipefail

open() {

    sem=$1
    str_num=$2

    source ~/gnu-koryavov/config.conf


    if [ ! -f ~/gnu-koryavov/KORYAVNIKS/${sem}.djvu ]; then
        download $sem
    fi
    
    echo "djvuviewer_script is $djvuviewer_script"
    ${djvuviewer_script} $sem $str_num

}

download() {
    
    sem=$1

    source ~/gnu-koryavov/config.conf

    cd ~/gnu-koryavov/KORYAVNIKS/ && wget -q --show-progress -O ${sem}.djvu ${KORYAVNIKS[$sem]}

}

help() {
    echo "Usage:"
    echo "gnu-koryavov [OPTIONS]"
    echo ""
    echo "-s <number-of-semester>    Koryavnik to search into"
    echo "-n <task-number>           Task to search in Koryavnik"
    echo "-o                         Open digital Koryavnik"
    echo "-h                         Print this information and exit"
}


should_open="false"

# get input options
while getopts ":s:n:oh" opt; do
    case ${opt} in
        s) # -s <semester>
            arg="$OPTARG"
            echo "Chosen semester: $arg"
            sem=$arg
            ;;

        n) # -n <problem-number> 
            arg="$OPTARG"
            echo "Chosen task: $arg"
            zad=$arg
            ;;
        o) # -open
            should_open="true"
            echo "Digital koryavov book will be opened."
            ;;
        \?|h)
            help
            exit 1
            ;;
    esac
done

# exit if no option is provided
if [ "$#" -lt 2 ]; then
    help
    exit 1
fi

shift $((OPTIND -1))

if [[ $sem -lt 1 ]]; then
    echo "Specify semester number correctly!"
    exit 1
elif (( $(echo "$zad < 1" | bc -l) )); then # compare task numer with 1
    echo "Specify task number correctly!"
    exit 1
fi

task_regex="[[:digit:]]+\.[[:digit:]]+"
if ! [[ $zad =~ $task_regex ]]; then
    echo "Specify task number correctly!"
    exit 1
fi


if [ ! -f /tmp/gnu-koryavov/${sem}-${zad}.tmp ]; then

    mkdir -p /tmp/gnu-koryavov/
    curl -s  "https://mipt1.ru/1_2_3_4_5_kor.php?sem=$sem&zad=$zad" |  iconv -f WINDOWS-1251 -t UTF-8 > /tmp/gnu-koryavov/${sem}-${zad}.tmp
    
fi

set +e
status=$(egrep "Задача [[:digit:]]{1,2}\.[[:digit:]]{1,4} найдена" /tmp/gnu-koryavov/${sem}-${zad}.tmp)
ret_code=$?
set -e

if [[ $ret_code -eq 0 ]]; then
    
    str_num=$(echo $status | sed -nr "s/.*на странице №([[:digit:]]{1,4})!.*/\1/p")
    echo "Task $zad found on page: $str_num!"
    
    if [[ $should_open == "true" ]]; then

        echo "Opening viewer on page $str_num."
        open $sem $str_num

    fi

else
    echo "Task $zad not found in Koryavov :("
fi

filesize=$(stat --format="%s" /tmp/gnu-koryavov/${sem}-${zad}.tmp)
if [[ $filesize -eq 0 ]]; then
    rm /tmp/gnu-koryavov/${sem}-${zad}.tmp
fi
