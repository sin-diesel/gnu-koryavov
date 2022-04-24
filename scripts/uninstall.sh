#!/bin/bash

home_dir=".gnu-koryavov"
scipts_dir="scripts"
gnukoryavov_name="gnu-koryavov"
tmp_dir="gnu-koryavov"

ubuntu_default_editor="atril"

read -p "Are you sure you want to remove gnu-koryavov from your system? (Y/n): " ans
if [[ $ans == "y"* || $ans == "Y"*  ]]; then

	rm -rf $HOME/$home_dir
	rm -rf /tmp/$tmp_dir
	sudo rm /usr/local/bin/gnukoryavov_name

    echo "gnu-koryavov successfully removed."

fi

