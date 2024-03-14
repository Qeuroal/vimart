""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用配置相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{> 判断是否已经加载过
if exists("s:did_load_configs_vim")
    finish
endif
let s:did_load_configs_vim = 1
" <}}}

" {{{> 通用设置
let mapleader = "\\"                    " 定义<leader>键
set nocompatible                        " 设置不兼容原始vi模式
filetype on                             " 设置开启文件类型侦测
filetype plugin on                      " 设置加载对应文件类型的插件
" set noeb                              " 关闭错误的提示
syntax enable                           " 开启语法高亮功能
syntax on                               " 自动语法高亮
set t_Co=256                            " 开启256色支持
set cmdheight=2                         " 设置命令行的高度
set showcmd                             " select模式下显示选中的行数
set ruler                               " 总是显示光标位置
set laststatus=2                        " 总是显示状态栏
set relativenumber number               " 开启行号显示: relative and number
set cursorline                          " 高亮显示当前行
set guicursor=n-v-c-i:block             " 设置光标为方块
" set guicursor=a:block                   " 设置光标为方块
set whichwrap+=<,>,h,l                  " 设置光标键跨行
set ttimeoutlen=0                       " 设置<ESC>键响应时间
set virtualedit=block,onemore           " 允许光标出现在最后一个字符的后面
set clipboard=unnamed                   " 设置 vim 与系统共用剪贴板
set foldmarker={{{>,<}}}                " 设置标志折叠的标志
set foldmethod=marker                   " 设置折叠为标志折叠
source $VIMRUNTIME/vimrc_example.vim    " 导入 Vim 的示例配置（这会打开一些有用的选项，如语法加亮、搜索加亮、命令历史、记住上次的文件位置，等等）
set mouse=""                            " 设置鼠标不可用
set splitbelow                          " 分割窗口, 默认在下方
set splitright                          " 分割窗口, 默认在右侧
if has("patch-7.4.710")
    set listchars=eol:↵,tab:»·,trail:╳,extends:»,precedes:«,space:_ " 设置不可见字符
else
    set listchars=eol:↵,tab:»·,trail:╳,extends:»,precedes:«         " 设置不可见字符
endif
" <}}}

" {{{> 代码缩进和排版
set autoindent                  " 设置自动缩进
set cindent                     " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0     " 设置C/C++语言的具体缩进方式
set smartindent                 " 智能的选择对其方式
filetype indent on              " 自适应不同语言的智能缩进
set expandtab                   " 将制表符扩展为空格
set tabstop=4                   " 设置编辑时制表符占用空格数
set shiftwidth=4                " 设置格式化时制表符占用空格数
set softtabstop=4               " 设置4个空格为制表符
set smarttab                    " 在行和段开始处使用制表符
" set nowrap                    " 禁止折行
set backspace=2                 " 使用回车键正常处理indent,eol,start等
set sidescroll=10               " 设置向右滚动字符数
" set nofoldenable              " 禁用折叠代码
" <}}}

" {{{> 代码补全
set wildmenu                                " vim自身命名行模式智能补全
set completeopt=menu,menuone,noselect       " 补全时不选择第一项
" <}}}

" {{{> 搜索设置
set hlsearch                " 高亮显示搜索结果
set incsearch               " 开启实时搜索功能
set ignorecase smartcase    " 智能大小写不敏感
set grepprg=rg\ --vimgrep\ --smart-case\ --follow " 设置grep 为 grepprg
" <}}}

" {{{> 缓存设置
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
" 保留跨会话撤销编辑的能力
if has('win32') || has('win64') || has('win16')
    set undodir=~\vimfiles\undodir
else
    set undodir=~/.vim/undodir
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p', 0700)
endif
" <}}}

" {{{> 编码设置
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=ucs-bom,utf-8,gb18030,latin1
" set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
" <}}}

" {{{> gvim/macvim 设置
if has("gui_running")
    if has('win32') || has('win64') || has('win16')
        set guifont=JetBrainsMono\ Nerd\ Font:h18                           " 设置字体: JetBrainsMono Nerd Font
    else
        let system = system('uname -s')
        if system == "Darwin\n"
            set guifont=JetBrainsMono\ Nerd\ Font:h18                       " 设置字体: JetBrainsMono Nerd Font
            " set guifont=JetBrains\ Mono:h18                               " 设置字体: Jetbrain Mono
            " set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h18       " 设置字体
            " set guifont=MesloLGS\ NF:h18                                  " 设置字体: MesloLGS NF
        else
            set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 18      " 设置字体
        endif
    endif

    set guioptions-=m               " 隐藏菜单栏
    set guioptions-=T               " 隐藏工具栏
    set guioptions-=L               " 隐藏左侧滚动条
    set guioptions-=r               " 隐藏右侧滚动条
    set guioptions-=b               " 隐藏底部滚动条
    set showtabline=0               " 隐藏Tab栏
    " set guicursor=n-v-c-i:block     " 设置光标为方块
endif
" <}}}

" {{{> 主题设置
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if has('termguicolors') &&
        \($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
        set termguicolors
    endif
endif

set background=dark
let g:onedark_termcolors=256
colorscheme onedark
" <}}}

"{{{> 会话相关
" 配置会话属性
set sessionoptions-=terminal
set sessionoptions+=options
"<}}}

"{{{> ctags设置: vim首先在当前目录里寻找tags文件，如果没有找到tags文件，或者没有找到对应的目标，就到父目录中查找，一直向上递归
set tags=tags;
" set autochdir     " 会导致 nerdtree 也变更目录, 使得无法使用 find 查找根目录的所有文件
"<}}}

"{{{> vim 与 tmux 兼容问题
if exists('$TMUX')
    set term=screen-256color
endif
"<}}}"

"{{{> vimrc_example 的设定修改
set scrolloff=0         " vimrc_example 设置值为5, 导致只要屏幕能滚动, 光标就移不到最上面的 4 行和最下面的 4 行里, 因为一移进去屏幕就会自动滚动
"<}}}






