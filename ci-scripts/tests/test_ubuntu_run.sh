#!/bin/bash


# install_dir="scripts/"
# workingdir="/home/gnu-koryavov"


# echo "$PWD contents:"
# ls -la

# cd $workingdir && \
# echo "Searching $install_dir directory in $PWD..."

# cd $install_dir && \
# ls -la &&
# echo "Running install.sh..." &&
# chmod +x install.sh && \
# yes | ./install.sh


semester="3"
task="4.23"
page="134"

/home/gnu-koryavov/scripts/run.sh -s $semester -n $task -o > output.tmp
grep "found on page: " output.tmp
output_page=$(grep "found on page: " output.tmp | sed -nr "s/.* found on page: ([[:digit:]]{1,3})!.*/\1/p")
cat output.tmp

if [[ $output_page != $page ]]; then
    echo "Run FAILED: expected page=$page, got task=$output_page"
    exit 1
fi

# Выбранная задача: 4.23
# Задача 4.23 найдена на странице №134!output.tmp 