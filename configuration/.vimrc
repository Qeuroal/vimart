"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 加载配置环境
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 加载用户自定义配置
if filereadable(expand($HOME . '/.vimrc.custom.config'))
    source $HOME/.vimrc.custom.config
endif

" 加载通用配置
source $HOME/.vim/settings/configs.vim
" 加载插件
source $HOME/.vim/settings/plugins.vim
" 加载插件配置
source $HOME/.vim/settings/plugins_config.vim
" 加载自定义函数
source $HOME/.vim/settings/functions.vim
" 加载键盘映射
source $HOME/.vim/settings/key_mappings.vim
" 加载自动指令配置
source $HOME/.vim/settings/command_automation.vim




