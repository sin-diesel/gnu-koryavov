#!/bin/bash

sem=$1
str_num=$2

#positive=("Y" "y" "Yes" "yes")

echo -n "Открыть электронный корявник? (Д/н): "
read ans
    
if [[ $ans == "y"* || $ans == "Y"* || $ans == "д"* || $ans == "Д"* ]]; then

    if [ ! -f "KORYAVNIKS/${sem}.djvu" ]; then
    
        mkdir -p KORYAVNIKS/
        ./download.sh $sem
      
    fi
     
     #here you can place your pdf viewer script
    ./okular.sh $sem $str_num

fi
