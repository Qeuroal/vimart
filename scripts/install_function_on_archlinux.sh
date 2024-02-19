
function install_software_on_archlinux() {
    # sudo pacman -S --noconfirm vim ctags automake gcc cmake python3 python2 ack git fontconfig
    # sudo ln -s /usr/lib/libtinfo.so.6 /usr/lib/libtinfo.so.5
    sudo pacman -S --noconfirm vim ctags automake gcc cmake python3 python2 ack git fontconfig
    sudo ln -s /usr/lib/libtinfo.so.6 /usr/lib/libtinfo.so.5
}

function install_ycm_on_archlinux() {
    install_choice=n
    read -n1 -p "Would you like to install ycm? [y/n]" install_choice
    echo ""
    if [ "${install_choice}" != 'y' -a "${install_choice}" != 'Y' ]; then
        echo "don't install ycm"
        # echo -e "\033[31m===> Canceling install ycm...\033[0m"
        color_print "warning" "Canceling install ycm..."
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

    install_choice=n
    read -n1 -p "Would you like to install dependencies of ycm? [y/n]" install_choice
    echo ""
    if [ "${install_choice}" = 'y' -o "${install_choice}" = 'Y' ]; then
        color_print "warning" "Installing dependencies of ycm..."
        # install go on archlinux
        sudo pacman -S --noconfirm go
        # install npm on archlinux
        sudo pacman -S --noconfirm npm
        # install java on archlinux
        sudo pacman -S --noconfirm jdk8-openjdk
    fi
}

#{{{> configure fzf
function configure_fzf_on_archlinux() {
    # configure in zshrc
    if test `cat ${HOME}/.zshrc | grep -c "# fzf:FZF_DEFAULT_COMMAND"` = 0
    then
        echo "# fzf:FZF_DEFAULT_COMMAND" | tee -a ${HOME}/.zshrc > /dev/null
        echo "if type rg &> /dev/null; then" | tee -a ${HOME}/.zshrc > /dev/null
        echo "  export FZF_DEFAULT_COMMAND='rg --files'" | tee -a ${HOME}/.zshrc > /dev/null
        echo "  export FZF_DEFAULT_OPTS='-m'" | tee -a ${HOME}/.zshrc > /dev/null
        echo "fi" | tee -a ${HOME}/.zshrc > /dev/null
    fi

    # configure in bashrc
    if test `cat ${HOME}/.bashrc | grep -c "# fzf:FZF_DEFAULT_COMMAND"` = 0
    then
        echo "# fzf:FZF_DEFAULT_COMMAND" | tee -a ${HOME}/.bashrc > /dev/null
        echo "if type rg &> /dev/null; then" | tee -a ${HOME}/.bashrc > /dev/null
        echo "  export FZF_DEFAULT_COMMAND='rg --files'" | tee -a ${HOME}/.bashrc > /dev/null
        echo "  export FZF_DEFAULT_OPTS='-m'" | tee -a ${HOME}/.bashrc > /dev/null
        echo "fi" | tee -a ${HOME}/.bashrc > /dev/null
    fi
}
#<}}}

#{{{> configure plugins
function configure_plugins_on_archlinux() {
    configure_fzf_on_archlinux
}
#<}}}

# {{{> 在archlinux安装vimart
function install_vimart_on_archlinux() {
    # backup data
    backup_vim_data
    # install prepare software
    install_software_on_archlinux

    # copy files
    copy_files
    # install fonts
    install_fonts_on_linux
    # install ycm
    install_ycm_on_archlinux
    # install vim plugins
    install_vim_plugins
    # configure vim plugins
    configure_plugins_on_archlinux
    # print end
    print_logo
}
# <}}}
