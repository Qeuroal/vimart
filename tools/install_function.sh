#!/bin/bash
function backupVimData() {
    echo -e "\033[32m===> Backuping vim data...\033[0m"
}

function installSoftwaresOnMac() {
    echo -e "\033[32m===> Installing softwares...\033[0m"
    # xcode-select --install
    brew install vim gcc cmake ctags-exuberant ack

}

function copyFiles() {
    echo -e "\033[32m===> Copying files...\033[0m"

    # .vimrc
    rm -rf ~/.vimrc
    ln -s ${PWD}/configuration/.vimrc ~

    # vim-plug by download from github
        # curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

    # .vimrc.custom.plugins
    rm -rf ~/.vimrc.custom.plugins
    cp ${PWD}/configuration/.vimrc.custom.plugins ~

    # .vimrc.custom.config
    rm -rf ~/.vimrc.custom.config
    cp ${PWD}/configuration/.vimrc.custom.config ~

    # .vim/color
    mkdir ~/.vim
    rm -rf ~/.vim/colors
    ln -s ${PWD}/colors ~/.vim/

    # vim-plug by copy
    cp -rf ./autoload ~/.vim/

    # ftplugin
    rm -rf ~/.vim/ftplugin
    ln -s ${PWD}/ftplugin ~/.vim/

    # .vimart
    rm -rf ~/.vimart
    ln -s ${PWD} ~/.vimart
}

function installFontsOnMac() {
    echo -e "\033[32m===> Installing fonts...\033[0m"
    # remove Droid Sans 字体
    rm -rf ~/Library/Fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/Library/Fonts

    #################################################################
    ## 待测试
    #################################################################
    # # rm MesloLGS
    # rm -rf ~/Library/Fonts/MesloLGS\ NF\ Bold\ Italic.ttf
    # rm -rf ~/Library/Fonts/MesloLGS\ NF\ Bold.ttf
    # rm -rf ~/Library/Fonts/MesloLGS\ NF\ Italic.ttf
    # rm -rf ~/Library/Fonts/MesloLGS\ NF\ Regular.ttf

    # # cp MesloLGS to fonts
    # cp -f ./fonts/MesloLGS\ NF\ Bold\ Italic.ttf ~/Library/Fonts
    # cp -f ./fonts/MesloLGS\ NF\ Bold.ttf ~/Library/Fonts
    # cp -f ./fonts/MesloLGS\ NF\ Italic.ttf ~/Library/Fonts
    # cp -f ./fonts/MesloLGS\ NF\ Regular.ttf ~/Library/Fonts
}

function installYcmOnMac() {
    installChoice=n
    read -n1 -p "Can you want to install ycm? [y/n]" installChoice
    echo ""
    if [ "${installChoice}" != 'y' -a "${installChoice}" != 'Y' ]; then
        echo "don't install ycm"
        echo -e "\033[31m===> Canceling install ycm...\033[0m"
        return 0
    fi

    echo -e "\033[41;32m===> Installing ycm...\033[0m"

    #########################################
    ## 待测试 !!!!!!!!!!!!!!!!!!!           ##
    #########################################
    # 添加 vim.ycm.config
    rm -rf ~/.vimrc.ycm.config
    ln -s ${PWD}/configuration/vimrc.ycm.config ~/.vimrc.ycm.config

    # install dependency
    brew install cmake python go nodejs
    # brew install java


    # python 编译
    # python3 ~/.vim/plugged/YouCompleteMe/install.py --all

}

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

function installVimPlugins() {
    echo -e "\033[32m===> Installing plugins...\033[0m"
    vim -c "PlugInstall" -c "q" -c "q"

    # ycm_extra_conf 配置
    vimrcYcmConfigPath=${HOME}"/.vimrc.ycm.config"
    isVimrcYcmConfigExist=$(isExistFile ${vimrcYcmConfigPath})
    if [ ${isVimrcYcmConfigExist} == 1 ]; then
        # 添加 ycm_extra_conf 文件
        ycmExtraConfPath=${HOME}"/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py"
        isYcmExtraConfExist=$(isExistFile ${ycmExtraConfPath})
        if [ ${isYcmExtraConfExist} == 0 ]; then
            ycmExtraConfPath=${PWD}"/configuration/.ycm_extra_conf.py"
            # echo -e "\033[32m===============================>Existing ${ycmExtraConfPath}\033[0m"
            # cp -f ~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~
        fi
        cp -f ${ycmExtraConfPath} ~
    fi
}

function printLogo() {
    color="$(tput setaf 6)"
    normal="$(tput sgr0)"
    printf "${color}"
    echo ''
    echo '888     888 d8b                      d8888         888    '
    echo '888     888 Y8P                     d88888         888    '
    echo '888     888                        d88P888         888    '
    echo 'Y88b   d88P 888 88888b.d88b.      d88P 888 888d888 888888 '
    echo ' Y88b d88P  888 888 "888 "88b    d88P  888 888P"   888    '
    echo '  Y88o88P   888 888  888  888   d88P   888 888     888    '
    echo '   Y888P    888 888  888  888  d8888888888 888     Y88b.  '
    echo '    Y8P     888 888  888  888 d88P     888 888      "Y888 by Qeuroal.'
    echo ''
    echo 'Finish vimart installment!'
    echo 'Just enjoy it!'
    echo ''
    printf "${normal}"
}

function installVimartOnMac() {
    # backup data
    backupVimData
    # install prepare software
    installSoftwaresOnMac
    # copy files
    copyFiles
    #install fonts
    installFontsOnMac
    # install ycm
    installYcmOnMac
    # install vim plugin
    installVimPlugins
    # print end
    printLogo
}


# 获取linux发行版名称
function getLinuxDistro()
{
    if grep -Eq "Ubuntu" /etc/*-release; then
        echo "Ubuntu"
    elif grep -Eq "Deepin" /etc/*-release; then
        echo "Deepin"
    elif grep -Eq "Raspbian" /etc/*-release; then
        echo "Raspbian"
    elif grep -Eq "uos" /etc/*-release; then
        echo "UOS"
    elif grep -Eq "LinuxMint" /etc/*-release; then
        echo "LinuxMint"
    elif grep -Eq "elementary" /etc/*-release; then
        echo "elementaryOS"
    elif grep -Eq "Debian" /etc/*-release; then
        echo "Debian"
    elif grep -Eq "Kali" /etc/*-release; then
        echo "Kali"
    elif grep -Eq "Parrot" /etc/*-release; then
        echo "Parrot"
    elif grep -Eq "CentOS" /etc/*-release; then
        echo "CentOS"
    elif grep -Eq "fedora" /etc/*-release; then
        echo "fedora"
    elif grep -Eq "openSUSE" /etc/*-release; then
        echo "openSUSE"
    elif grep -Eq "Arch Linux" /etc/*-release; then
        echo "ArchLinux"
    elif grep -Eq "ManjaroLinux" /etc/*-release; then
        echo "ManjaroLinux"
    elif grep -Eq "Gentoo" /etc/*-release; then
        echo "Gentoo"
    elif grep -Eq "alpine" /etc/*-release; then
        echo "Alpine"
    else
        echo "Unknown"
    fi
}

# 获取ubuntu版本
function getUbuntuVersion()
{
    line=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")
    arr=(${line//=/ })
    version=(${arr[1]//./ })

    echo ${version[0]}
}

# 在ubuntu上源代码安装vim
function compileVimOnUbuntu()
{
    sudo apt-get install -y libncurses5-dev libncurses5 libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev

    rm -rf ~/vim82
    git clone https://gitee.com/chxuan/vim82.git ~/vim82
    cd ~/vim82
    ./configure --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp \
        --enable-pythoninterp \
        --enable-perlinterp \
        --enable-luainterp \
        --enable-gui=gtk2 \
        --enable-cscope \
        --prefix=/usr
    make
    sudo make install
    cd -
}

# 安装ubuntu必备软件
function installSoftwareOnUbuntu()
{
    echo -e "\033[32m===> Installing softwares...\033[0m"
    sudo apt-get update

    version=$(getUbuntuVersion)
    if [ $version -eq 14 ];then
        sudo apt-get install -y cmake3
    else
        sudo apt-get install -y cmake
    fi

    sudo apt-get install -y build-essential fontconfig libfile-next-perl ack-grep git
    # sudo apt-get install -y python3-dev python python-dev
    sudo apt-get install -y python3 python3-dev
    sudo apt-get install -y universal-ctags || sudo apt-get install -y exuberant-ctags
    
    if [ $version -ge 18 ];then
        sudo apt-get install -y vim
    else
        compileVimOnUbuntu
    fi
}

# 安装linux平台字体
function installFontsOnLinux()
{
    echo -e "\033[32m===> Installing fonts...\033[0m"
    mkdir -p ~/.local/share/fonts
    rm -rf ~/.local/share/fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/.local/share/fonts

    # rm MesloLGS
    rm -rf ~/.local/share/fonts/MesloLGS\ NF\ Bold\ Italic.ttf
    rm -rf ~/.local/share/fonts/MesloLGS\ NF\ Bold.ttf
    rm -rf ~/.local/share/fonts/MesloLGS\ NF\ Italic.ttf
    rm -rf ~/.local/share/fonts/MesloLGS\ NF\ Regular.ttf

    # cp MesloLGS to fonts
    cp -f ./fonts/MesloLGS\ NF\ Bold\ Italic.ttf ~/.local/share/fonts
    cp -f ./fonts/MesloLGS\ NF\ Bold.ttf ~/.local/share/fonts
    cp -f ./fonts/MesloLGS\ NF\ Italic.ttf ~/.local/share/fonts
    cp -f ./fonts/MesloLGS\ NF\ Regular.ttf ~/.local/share/fonts

    fc-cache -vf ~/.local/share/fonts
}

function installYcmOnUbuntu() {
    installChoice=n
    read -n1 -p "Can you want to install ycm? [y/n]" installChoice
    echo ""
    if [ "${installChoice}" != 'y' -a "${installChoice}" != 'Y' ]; then
        echo "don't install ycm"
        echo -e "\033[31m===> Canceling install ycm...\033[0m"
        return 0
    fi

    echo -e "\033[41;32m===> Installing ycm...\033[0m"

    ##################################################################################
    ## python3 install.py --all --verbose # 需要安装的依赖                            ##
    ##################################################################################
    # 添加 vim.ycm.config
    rm -rf ~/.vimrc.ycm.config
    ln -s ${PWD}/configuration/vimrc.ycm.config ~/.vimrc.ycm.config

    # install golang on Ubuntu
    sudo apt install -y golang
    # install npm on Ubuntu
    sudo apt install -y npm
    # install java on Ubuntu
    sudo apt install -y openjdk-8-jdk

    # python 编译
    # python3 ~/.vim/plugged/YouCompleteMe/install.py --all

}

# 在ubuntu上安装vimart
function installVimartOnUbuntu()
{
    # backup data
    backupVimData
    # install prepare software
    installSoftwareOnUbuntu

    # copy files
    copyFiles
    # install fonts
    installFontsOnLinux
    # install ycm
    installYcmOnUbuntu
    # install vim plugin
    installVimPlugins
    # print end
    printLogo
}


# 在linux平上台安装vimart
function installVimartOnLinux()
{
    distro=`getLinuxDistro`
    echo "Linux distro: "${distro}

    if [ ${distro} == "Ubuntu" ]; then
        installVimartOnUbuntu
    elif [ ${distro} == "Deepin" ]; then
        echo "not support ${distro}"
        # installVimpmarsnUbuntuLike
    elif [ ${distro} == "LinuxMint" ]; then
        echo "not support ${distro}"
        # installVimpmarsnUbuntuLike
    elif [ ${distro} == "elementaryOS" ]; then
        echo "not support ${distro}"
        # installVimpmarsnUbuntuLike
    elif [ ${distro} == "Debian" ]; then
        echo "not support ${distro}"
        # installVimpmarsnDebian
    elif [ ${distro} == "Raspbian" ]; then
        echo "not support ${distro}"
        # installVimpmarsnDebian
    elif [ ${distro} == "UOS" ]; then
        echo "not support ${distro}"
        # installVimpmarsnDebian
    elif [ ${distro} == "Kali" ]; then
        echo "not support ${distro}"
        # installVimpmarsnDebian
    elif [ ${distro} == "Parrot" ]; then
        echo "not support ${distro}"
        # installVimartOnParrot
    elif [ ${distro} == "CentOS" ]; then
        echo "not support ${distro}"
        # installVimartOnCentos
    elif [ ${distro} == "fedora" ]; then
        echo "not support ${distro}"
        # installVimartOnFedora
    elif [ ${distro} == "openSUSE" ]; then
        echo "not support ${distro}"
        # installVimartOnOpensuse
    elif [ ${distro} == "ArchLinux" ]; then
        echo "not support ${distro}"
        # installVimartOnArchlinux
    elif [ ${distro} == "ManjaroLinux" ]; then
        echo "not support ${distro}"
        # installVimartOnArchlinux
    elif [ ${distro} == "Gentoo" ]; then
        echo "not support ${distro}"
        # installVimartOnGentoo
    elif [ ${distro} == "Alpine" ]; then
        echo "not support ${distro}"
        # installVimartOnAlpine
    else
        echo "Not support linux distro: "${distro}
    fi
}


# 获取当前时间戳
function getNowTimestamp() {
    curSecAndNs=`date '+%s-%N'`
    echo ${curSecAndNs%-*}
}

function main() {
    # 获取时间
    begin=`getNowTimestamp`
    # 平台类型
    type=$(uname)
    echo "Platform type: "${type}


    if [ ${type} == "Darwin" ]; then
        installVimartOnMac
    elif [ ${type} == "FreeBSD" ]; then
        # installVimartOnFreebsd
        echo "Not support now!!!"
    elif [ ${type} == "Linux" ]; then
        tp=$(uname -a)
        if [[ $tp =~ "Android" ]]; then
            echo "Android isn't suppoted now!!!"
            # installVimartOnAndroid
        else
            installVimartOnLinux
        fi
    else
        echo "Not support platform type: "${type}
    fi

    # 结束时间
    end=`getNowTimestamp`
    # 共运行时间
    second=`expr ${end} - ${begin}`
    min=`expr ${second} / 60`
    echo "It takes "${min}" minutes."
}


