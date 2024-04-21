#!/bin/bash
#
source ${PWD}/scripts/color_print.sh
source ${PWD}/scripts/shared_function.sh
source ${PWD}/scripts/install_function_on_linux.sh

function exportEnv() {
    color_print "warning" "Please to ensure env to install vim locally? Where if not exist, please enter directly!!!"

    srcPath=${PWD}
    if [ -e ${srcPath}/vimart_envs ]; then
        cp -f ${srcPath}/configuration/.vimart_envs ${srcPath}/vimart_envs
    fi
    source ${srcPath}/vimart_envs

    color_print "info" "VIMART_SRC_PATH (vimart directory): " ${VIMART_SRC_PATH}
    color_print "info" "VIMART_DEST_PATH (destination HOME path): " ${VIMART_DEST_PATH}
    color_print "info" "VIMART_REFERENCE_USER (user by copied): " ${VIMART_REFERENCE_USER}
    color_print "info" "VIMART_CHOWN_USER (owner of copied files): " ${VIMART_CHOWN_USER}

    local opt="y"
    color_print "warning" "Is this right? [y/n]"
    read -n 1 opt
    if [ "${opt}" != 'y' -a "${opt}" != 'Y' ]; then
        exit
    fi


    # if [ "${VIMART_SRC_PATH}" = "" ]; then
    #     read -p "VIMART_SRC_PATH (vimart directory): " curEnv
    #     if [ "${curEnv}" != "" ]; then
    #         export VIMART_SRC_PATH=${curEnv}
    #     fi
    # fi

    # if [ "${VIMART_DEST_PATH}" = "" ]; then
    #     read -p "VIMART_DEST_PATH (destination HOME path):" curEnv
    #     if [ "${curEnv}" != "" ]; then
    #         export VIMART_DEST_PATH=${curEnv}
    #     fi
    # fi

    # if [ "${VIMART_REFERENCE_USER}" = "" ]; then
    #     read -p "VIMART_REFERENCE_USER (user by copied): " curEnv
    #     if [ "${curEnv}" != "" ]; then
    #         export VIMART_REFERENCE_USER=${curEnv}
    #     fi
    # fi

    # if [ "${VIMART_CHOWN_USER}" = "" ]; then
    #     read -p "VIMART_CHOWN_USER (owner of copied files): " curEnv
    #     if [ "${curEnv}" != "" ]; then
    #         export VIMART_CHOWN_USER=${curEnv}
    #     fi
    # fi
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
