#!/bin/bash

sem=$1

KORYAVNIKS=(
[1]=https://lib.mipt.ru/book/267518/Koryavov-VP-Metody-resheniya-zadach-v-obschem-kurse-fiziki-Mehanika.djvu
[2]=https://lib.mipt.ru/book/265316/Koryavov-VP-Metody-resheniya-zadach-v-obschem-kurse-fiziki-Termodinamika-i-molekulyarnaya-fizika.djvu
[3]=https://lib.mipt.ru/book/282962/Koryavov-VP-Metody-resheniya-zadach-v-obschem-kurse-fiziki-Elektrichestvo-i-magnetizm.djvu
[4]=https://lib.mipt.ru/book/283050/Koryavov-VP-Metody-resheniya-zadach-v-obschem-kurse-fiziki-Optika.djvu
[5]=https://lib.mipt.ru/book/283202/Koryavov-VP-Metody-resheniya-zadach-v-obschem-kurse-fiziki-Atomnaya-i-yadernaya-fizika.djvu
)

cd .&& wget -O KORYAVNIKS/${sem}.djvu ${KORYAVNIKS[$sem]}
