#!/bin/bash

echo -n "Введите номер семестра: "
read sem

echo -n "Введите номер задачи: "
read zad

curl -s  "https://mipt1.ru/1_2_3_4_5_kor.php?sem=$sem&zad=$zad" |  iconv -f WINDOWS-1251 -t UTF-8 > tmp

status=$(egrep "Задача [[:digit:]]{1,2}\.[[:digit:]]{1,4} найдена" tmp)
rm tmp

if [[ $? -eq 0 ]]; then

    str_num=$(echo $status | sed -nr "s/.*на странице №([[:digit:]]{1,4})!.*/\1/p")
    echo "Задача $zad найдена на странице №$str_num!"
    
    ./open.sh $sem $str_num $zad

else
    echo "Задача $zad не найдена в корявнике:("
fi


