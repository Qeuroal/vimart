#!/bin/bash

# backup personal vim configure
function backup_vim_data() {
    # echo -e "\033[32m===> Backuping vim data...\033[0m"
    color_print "info" "Backuping vim data..."
}

function copy_files() {
    # echo -e "\033[32m===> Copying files...\033[0m"
    color_print "info" "Copying files..."

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

    # settings
    rm -rf ~/.vim/settings
    ln -s ${PWD}/settings ~/.vim/

    # ultisnips
    rm -rf ~/.vim/UltiSnips
    ln -s ${PWD}/plugin_configuration/UltiSnips ~/.vim/UltiSnips

    # .vimart
    rm -rf ~/.vimart
    ln -s ${PWD} ~/.vimart
}

# 判断文件是否存在
function is_exist_file()
{
    filename=$1
    if [ -f $filename ]; then
        echo 1
    else
        echo 0
    fi
}


function install_vim_plugins() {
    # echo -e "\033[32m===> Installing plugins...\033[0m"
    color_print "info" "Installing plugins..."
    vim -c "PlugInstall" -c "q" -c "q"

    # ycm_extra_conf 配置
    vimrc_ycm_config_path=${HOME}"/.vimrc.ycm.config"
    is_vimrc_ycm_config_exist=$(is_exist_file ${vimrc_ycm_config_path})
    if [ ${is_vimrc_ycm_config_exist} == 1 ]; then
        # 添加 ycm_extra_conf 文件
        # echo -e "\033[32m===>Coping the .ycm_tra_conf.py file...\033[0m"
        color_print "info" "Coping the .ycm_tra_conf.py file..."
        ycm_extra_conf_path=${PWD}"/configuration/.ycm_extra_conf.py"
        cp -f ${ycm_extra_conf_path} ~

        ################################################################################################################
        # # 使用自带的 ycm_extra_conf 文件 (!!!!!!!!!!!!!!!!!! 舍弃 !!!!!!!!!!!!!!!!!!)
        # isYcmExtraConfExist=$(is_exist_file ${ycm_extra_conf_path})
        # if [ ${isYcmExtraConfExist} == 0 ]; then
        #     ycm_extra_conf_path=${HOME}"/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"
        #     # echo -e "\033[32m===============================>Existing ${ycm_extra_conf_path}\033[0m"
        #     # color_print "info" "===============================>Existing ${ycm_extra_conf_path}"
        #     # cp -f ~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~
        # fi
        ################################################################################################################
    fi
}

function print_logo() {
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

# 获取linux发行版名称
function get_linux_distro()
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

# 获取当前时间戳
function get_now_timestamp() {
    cur_sec_and_ns=`date '+%s-%N'`
    echo ${cur_sec_and_ns%-*}
}

#{{{> configure fzf
function configure_fzf_on_linux() {
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

#{{{> config tmux
function configure_tmux {
    if test `cat ${HOME}/.tmux.conf | grep -c "# 配置vim-tmux-navigator冲突"` = 0
    then
        echo '' | tee -a ./.tmux.conf > /dev/null
        echo '# 配置vim-tmux-navigator冲突' | tee -a ./.tmux.conf > /dev/null
        echo 'is_vim="ps -o state= -o comm= -t '"'"'#{pane_tty}'"'"' \' | tee -a ./.tmux.conf > /dev/null
        echo '    | grep -iqE '"'"'^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"'"'"' | tee -a ./.tmux.conf > /dev/null
        echo '' | tee -a ./.tmux.conf > /dev/null
        echo 'is_fzf="ps -o state= -o comm= -t '"'"'#{pane_tty}'"'"' \' | tee -a ./.tmux.conf > /dev/null
        echo '    | grep -iqE '"'"'^[^TXZ ]+ +(\\S+\\/)?fzf$'"'"'"' | tee -a ./.tmux.conf > /dev/null
        echo 'bind -n C-h run "($is_vim && tmux send-keys C-h) || \' | tee -a ./.tmux.conf > /dev/null
        echo '                 tmux select-pane -L"' | tee -a ./.tmux.conf > /dev/null
        echo '' | tee -a ./.tmux.conf > /dev/null
        echo 'bind -n C-j run "($is_vim && tmux send-keys C-j)  || \' | tee -a ./.tmux.conf > /dev/null
        echo '                 ($is_fzf && tmux send-keys C-j) || \' | tee -a ./.tmux.conf > /dev/null
        echo '                 tmux select-pane -D"' | tee -a ./.tmux.conf > /dev/null
        echo '' | tee -a ./.tmux.conf > /dev/null
        echo 'bind -n C-k run "($is_vim && tmux send-keys C-k) || \' | tee -a ./.tmux.conf > /dev/null
        echo '                 ($is_fzf && tmux send-keys C-k)  || \' | tee -a ./.tmux.conf > /dev/null
        echo '                 tmux select-pane -U"' | tee -a ./.tmux.conf > /dev/null
        echo '' | tee -a ./.tmux.conf > /dev/null
        echo 'bind -n C-l run "($is_vim && tmux send-keys C-l) || \' | tee -a ./.tmux.conf > /dev/null
        echo '                 tmux select-pane -R"' | tee -a ./.tmux.conf > /dev/null
        echo '' | tee -a ./.tmux.conf > /dev/null
        echo '# bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"' | tee -a ./.tmux.conf > /dev/null
        echo 'if-shell -b '"'"'[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]'"'"' \' | tee -a ./.tmux.conf > /dev/null
        echo '    "bind-key -n '"'"'C-\\'"'"' if-shell \"$is_vim\" '"'"'send-keys C-\\'"'"'  '"'"'select-pane -l'"'"'"' | tee -a ./.tmux.conf > /dev/null
        echo 'if-shell -b '"'"'[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]'"'"' \' | tee -a ./.tmux.conf > /dev/null
        echo '    "bind-key -n '"'"'C-\\'"'"' if-shell \"$is_vim\" '"'"'send-keys C-\\\\'"'"'  '"'"'select-pane -l'"'"'"' | tee -a ./.tmux.conf > /dev/null
        echo '' | tee -a ./.tmux.conf > /dev/null
        echo '' | tee -a ./.tmux.conf > /dev/null
    fi
}
#<}}}


