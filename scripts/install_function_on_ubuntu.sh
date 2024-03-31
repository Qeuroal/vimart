#!/bin/bash

source ${PWD}/scripts/color_print.sh

# {{{> 获取ubuntu版本
function get_ubuntu_version() {
    line=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")
    arr=(${line//=/ })
    version=(${arr[1]//./ })

    echo ${version[0]}
}
# <}}}

# {{{> 在ubuntu上源代码安装vim
function compile_vim_on_ubuntu() {
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
# <}}}

# {{{> 安装ubuntu必备软件
function install_software_on_ubuntu() {
    # echo -e "\033[32m===> Installing softwares...\033[0m"
    color_print "info" "Installing softwares..."
    sudo apt-get update

    version=$(get_ubuntu_version)
    if [ $version -eq 14 ];then
        sudo apt-get install -y cmake3
    else
        sudo apt-get install -y cmake
    fi

    sudo apt-get install -y build-essential fontconfig libfile-next-perl ack-grep git ripgrep
    # sudo apt-get install -y python3-dev python python-dev
    sudo apt-get install -y python3 python3-dev
    sudo apt-get install -y universal-ctags || sudo apt-get install -y exuberant-ctags
    
    if [ $version -ge 18 ];then
        sudo apt-get install -y vim vim-gtk
    else
        compile_vim_on_ubuntu
    fi
}
# <}}}

# {{{> install_ycm_on_ubuntu
function install_ycm_on_ubuntu() {
    install_choice=n
    read -n1 -p "Would you like to install ycm? [y/n]" install_choice
    echo ""
    if [ "${install_choice}" != 'y' -a "${install_choice}" != 'Y' ]; then
        echo "don't install ycm"
        # echo -e "\033[31m===> Canceling install ycm...\033[0m"
        color_print "warning" "Canceling install ycm..."
        sed -i 's/let g:completeScheme=1/let g:completeScheme=2/g' ~/.vimrc.custom.config
        return 0
    fi

    # echo -e "\033[41;32m===> Installing ycm...\033[0m"
    color_print "warning" "Installing ycm..."

    ##################################################################################
    ## python3 install.py --all --verbose # 需要安装的依赖                            ##
    ##################################################################################
    # 添加 vim.ycm.config
    rm -rf ~/.vimrc.ycm.config
    ln -s ${PWD}/configuration/vimrc.ycm.config ~/.vimrc.ycm.config

    # install dependency
    install_choice=n
    read -n1 -p "Would you like to install dependencies of ycm? [y/n]" install_choice
    echo ""
    if [ "${install_choice}" = 'y' -o "${install_choice}" = 'Y' ]; then
        color_print "warning" "Installing dependencies of ycm..."
        # install golang on Ubuntu
        sudo apt install -y golang
        # install npm on Ubuntu
        sudo apt install -y npm
        # install java on Ubuntu
        sudo apt install -y openjdk-8-jdk
    fi

    # python 编译
    # python3 ~/.vim/plugged/YouCompleteMe/install.py --all

}
# <}}}

#{{{> configure fzf
function configure_fzf_on_ubuntu() {
    # configure in zshrc
    if [[ -f ${HOME}/.zshrc ]]
    then
        if test `cat ${HOME}/.zshrc | grep -c "# fzf:FZF_DEFAULT_COMMAND"` = 0
        then
            echo "" | tee -a ${HOME}/.zshrc > /dev/null
            echo "# fzf:FZF_DEFAULT_COMMAND" | tee -a ${HOME}/.zshrc > /dev/null
            echo "if type rg &> /dev/null; then" | tee -a ${HOME}/.zshrc > /dev/null
            echo "  export FZF_DEFAULT_COMMAND='rg --files'" | tee -a ${HOME}/.zshrc > /dev/null
            echo "  export FZF_DEFAULT_OPTS='-m'" | tee -a ${HOME}/.zshrc > /dev/null
            echo "fi" | tee -a ${HOME}/.zshrc > /dev/null
            echo "" | tee -a ${HOME}/.zshrc > /dev/null
        fi
    fi

    # configure in bashrc
    if test `cat ${HOME}/.bashrc | grep -c "# fzf:FZF_DEFAULT_COMMAND"` = 0
    then
        echo "" | tee -a ${HOME}/.bashrc > /dev/null
        echo "# fzf:FZF_DEFAULT_COMMAND" | tee -a ${HOME}/.bashrc > /dev/null
        echo "if type rg &> /dev/null; then" | tee -a ${HOME}/.bashrc > /dev/null
        echo "  export FZF_DEFAULT_COMMAND='rg --files'" | tee -a ${HOME}/.bashrc > /dev/null
        echo "  export FZF_DEFAULT_OPTS='-m'" | tee -a ${HOME}/.bashrc > /dev/null
        echo "fi" | tee -a ${HOME}/.bashrc > /dev/null
        echo "" | tee -a ${HOME}/.bashrc > /dev/null
    fi
}
#<}}}

#{{{> configure plugins
function configure_plugins_on_ubuntu() {
    configure_fzf_on_ubuntu
}
#<}}}

# {{{> 在ubuntu上安装vimart
function install_vimart_on_ubuntu() {
    # backup data
    backup_vim_data
    # install prepare software
    install_software_on_ubuntu

    # copy files
    copy_files
    # install fonts
    install_fonts_on_linux
    # install ycm
    install_ycm_on_ubuntu
    # install vim plugins
    install_vim_plugins
    # configure vim plugins
    configure_plugins_on_ubuntu
    # print end
    print_logo
}
# <}}}

