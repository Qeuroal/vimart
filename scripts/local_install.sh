#!/bin/bash
#
source ${PWD}/scripts/color_print.sh
source ${PWD}/scripts/shared_function.sh
source ${PWD}/scripts/install_function_on_linux.sh

function main() {
    curDir=${PWD}
    type=$(uname)
    echo "Platform type: "${type}

    if [ ${type} == "Darwin" ]; then
        color_print "error" "Not support now!!!"
    elif [ ${type} == "FreeBSD" ]; then
        # installVimartOnFreebsd
        echo "Not support now!!!"
    elif [ ${type} == "Linux" ]; then
        tp=$(uname -a)
        if [[ $tp =~ "Android" ]]; then
            echo "Android isn't suppoted now!!!"
            # installVimartOnAndroid
        else
            local_install_vimart_on_linux
        fi
    else
        echo "Not support platform type: "${type}
    fi

}

main
