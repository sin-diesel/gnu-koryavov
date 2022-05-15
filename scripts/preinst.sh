set -uo pipefail


install_config=../configs/install.conf
source $install_config


echo "Checking dependencies..."
for utility in ${dependencies[*]}; do

    $utility --version &> /dev/null
    if [[ $? != 0 ]]; then
        echo "$utility is not installed!"
        exit 1
    fi

done

exit 0

