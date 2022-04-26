#!/bin/bash

set -uo pipefail

home_dir=".gnu-koryavov"
gnukoryavov_name="gnu-koryavov"
tmp_dir="gnu-koryavov"

echo "The following files will be deleted:"
echo "$HOME/$home_dir"
echo "/usr/local/bin/$gnukoryavov_name"
echo "/tmp/$tmp_dir"
echo ""

read -p "Are you sure you want to remove gnu-koryavov from your system? (Y/n): " ans
if [[ $ans == "y"* || $ans == "Y"*  ]]; then

	rm -r $HOME/$home_dir
	rm -rf /tmp/$tmp_dir
	sudo rm /usr/local/bin/$gnukoryavov_name

    echo "gnu-koryavov successfully removed."

fi

