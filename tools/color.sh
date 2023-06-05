#!/bin/bash
#

function cprint () {

    bgBlack="\033[40m"
    bgRed="\033[41m"
    bgGreen="\033[42m"
    bgYellow="\033[43m"
    bgBlue="\033[44m"
    bgPurple="\033[45m"
    bgCyan="\033[46m"
    bgWhite="\033[47m"

    fgBlack="\033[30m"
    fgRed="\033[31m"
    fgGreen="\033[32m"
    fgYellow="\033[33m"
    fgBlue="\033[34m"
    fgPurple="\033[35m"
    fgCyan="\033[36m"
    fgWhite="\033[37m"

    setClear="\033[0m"
    setBold="\033[1m"
    setUnderline="\033[4m"
    setFlash="\033[5m"

    mode="$1"
    case "${mode}" in
        "finish")
            color="${bgBlack}${fgGreen}"
            ;;
        "begin")
            color="${fgBlack}${fgGreen}"
            ;;
        "opt")
            color="${fgBlack}${fgYellow}"
            ;;
        "error")
            color="${bgBlack}${fgRed}${setBold}"
            ;;
        "warning")
            color="${bgYellow}${fgBlack}"
            ;;
        "info")
            color="${bgBlack}${fgPurple}"
            ;;
        *)
            ;;
    esac
    info="${color}===> $2${setClear}"
    if test "${mode}" == "opt"; then
        echo -e -n ${info}
    else
        echo -e ${info}
    fi
}

