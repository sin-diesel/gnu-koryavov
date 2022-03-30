#!/bin/bash

open() {

    sem=$1
    str_num=$2
    source ~/./gnu-koryavov/config.conf

    #positive=("Y" "y" "Yes" "yes")

    read -p "Открыть электронный корявник? (Д/н): " ans
        
    if [[ $ans == "y"* || $ans == "Y"* || $ans == "д"* || $ans == "Д"* ]]; then

        if [ ! -f "KORYAVNIKS/${sem}.djvu" ]; then
        
            #./${pdfviewer_script}
            #mkdir -p KORYAVNIKS/
            download.sh $sem
        
        fi
        
        ./${pdfviewer_script} $sem $str_num
        #./okular.sh $sem $str_num

    fi
}

download() {
    
    sem=$1
    source ~/./gnu-koryavov/config.conf

    cd ~/gnu-koryavov && wget -O KORYAVNIKS/${sem}.djvu ${KORYAVNIKS[$sem]}
}


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
    
    open $sem $str_num

else
    echo "Задача $zad не найдена в корявнике:("
fi
