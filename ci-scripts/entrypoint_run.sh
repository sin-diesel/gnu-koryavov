#!/bin/sh


install_dir="scripts/"
workingdir="/home/gnu-koryavov"


echo "$PWD contents:"
ls -la

cd $workingdir && \
echo "Searching $install_dir directory in $PWD..."

cd $install_dir && \
ls -la &&
echo "Running install.sh..." &&
chmod +x install.sh && \
yes | ./install.sh


semester="3"
task="4.23"

./run.sh -s $semester -n $task > output.tmp
output_task=$(grep "Выбранный семестр:" | sed -nr 's/.*([[:digit:]]{1,4}).*/\1/p')

if [[ $output_task != $task ]]; then
    echo "Run FAILED: expected task=$task, got task=$output_task"
    exit 1
fi

# Выбранная задача: 4.23
# Задача 4.23 найдена на странице №134!output.tmp 