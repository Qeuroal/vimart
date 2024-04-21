#!/bin/bash
#
source ${PWD}/scripts/color_print.sh
source ${PWD}/scripts/shared_function.sh
source ${PWD}/scripts/install_function_on_linux.sh

function exportEnv() {
    color_print "warning" "Please to set env to install vim locally? If not exist, please enter directly!!!"

	if [ "${VIMART_SRC_PATH}" = "" ]; then
		read -p "VIMART_SRC_PATH:" curEnv
		if [ "${curEnv}" != "" ]; then
			export VIMART_SRC_PATH=${curEnv}
		fi
	fi

	if [ "${VIMART_DEST_PATH}" = "" ]; then
		read -p "VIMART_DEST_PATH:" curEnv
		if [ "${curEnv}" != "" ]; then
			export VIMART_DEST_PATH=${curEnv}
		fi
	fi

	if [ "${VIMART_REFERENCE_USER}" = "" ]; then
		read -p "VIMART_REFERENCE_USER:" curEnv
		if [ "${curEnv}" != "" ]; then
			export VIMART_REFERENCE_USER=${curEnv}
		fi
	fi

	if [ "${VIMART_CHOWN_USER}" = "" ]; then
		read -p "VIMART_CHOWN_USER:" curEnv
		if [ "${curEnv}" != "" ]; then
			export VIMART_CHOWN_USER=${curEnv}
		fi
	fi
}

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
            exportEnv
            local_install_vimart_on_linux
        fi
    else
        echo "Not support platform type: "${type}
    fi

}

main
