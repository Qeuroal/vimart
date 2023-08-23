#!/bin/bash

source ${PWD}/scripts/color_print.sh

# {{{> install softwares
function install_softwares_on_mac() {
    # echo -e "\033[32m===> Installing softwares...\033[0m"
    color_print "info" "Installing softwares..."
    # xcode-select --install
    brew install vim gcc cmake ctags-exuberant ack

}
# <}}}

# {{{> install fonts
function install_fonts_on_mac() {
    # echo -e "\033[32m===> Installing fonts...\033[0m"
    color_print "info" "Installing fonts..."
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
# <}}}

# {{{> install ycm
function install_ycm_on_mac() {
    install_choice=n
    read -n1 -p "Can you want to install ycm? [y/n]" install_choice
    echo ""
    if [ "${install_choice}" != 'y' -a "${install_choice}" != 'Y' ]; then
        # echo -e "\033[31m===> Canceling install ycm...\033[0m"
        color_print "warning" "Canceling install ycm..."
        return 0
    fi

    # echo -e "\033[41;32m===> Installing ycm...\033[0m"
    color_print "warning" "Installing ycm..."

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
# <}}}

# {{{> install vimart
function install_vimart_on_mac() {
    # backup data
    backup_vim_data
    # install prepare software
    install_softwares_on_mac
    # copy files
    copy_files
    #install fonts
    install_fonts_on_mac
    # install ycm
    install_ycm_on_mac
    # install vim plugin
    install_vim_plugins
    # print end
    print_logo
}
# <}}}




