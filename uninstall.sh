#!/usr/bin/env bash

# 判断文件是否存在
function isExistFile()
{
    filename=$1
    if [ -f $filename ]; then
        echo 1
    else
        echo 0
    fi
}

# 判断目录是否存在
function isExistDir()
{
    dir=$1
    if [ -d $dir ]; then
        echo 1
    else
        echo 0
    fi
}

# delete .vim
vimPath=${HOME}"/.vim"
isExist=$(isExistDir ${vimPath})
if [ ${isExist} == 1 ]; then
    echo -e "\033[31mRemove ${vimPath}\033[0m"
    rm -rf ${vimPath}
fi

# delete .viminfo
viminfoPath=${HOME}"/.viminfo"
isExist=$(isExistFile ${viminfoPath})
if [ ${isExist} == 1 ]; then
    echo -e "\033[31mRemove ${viminfoPath}\033[0m"
    rm -rf ${viminfoPath}
fi

# delete .vimrc
vimrcPath=${HOME}"/.vimrc"
isExist=$(isExistFile ${vimrcPath})
if [ ${isExist} == 1 ]; then
    echo -e "\033[31mRemove ${vimrcPath}\033[0m"
    rm -rf ${vimrcPath}
fi

# delete .vimart
vimartPath=${HOME}"/.vimart"
isExist=$(isExistDir ${vimartPath})
if [ ${isExist} == 1 ]; then
    echo -e "\033[31mRemove ${vimartPath}\033[0m"
    rm -rf ${vimartPath}
fi

# delete .vimrc.ycm.config
vimrcYcmConfigPath=${HOME}"/.vimrc.ycm.config"
isExist=$(isExistFile ${vimrcYcmConfigPath})
if [ ${isExist} == 1 ]; then
    echo -e "\033[31mRemove ${vimrcYcmConfigPath}\033[0m"
    rm -rf ${vimrcYcmConfigPath}
fi

# delete ycm_extra_conf
ycmExtConfPath=${HOME}"/.ycm_extra_conf.py" 
isExist=$(isExistFile ${ycmExtConfPath})
if [ ${isExist} == 1 ]; then
    # echo "${ycmExtConfPath}"
    echo -e "\033[31mRemove ${ycmExtConfPath}\033[0m"
    rm -rf ${ycmExtConfPath}
fi

# delete custom config data
echo -e -n "\033[32m===> Can you want to remove your custom config? [Y/N]\033[0m"
choice=n
read -n1 -p "" choice
echo ""
if [ "${choice}" == 'y' -o "${choice}" == 'Y' ]; then
    echo -e "\033[31mRemove your custom config\033[0m"
    rm -rf ${HOME}"/.vimrc.custom.config" ${HOME}"/.vimrc.custom.plugins"
fi
 
echo -e "\033[32m===> Done!!! \033[0m"


