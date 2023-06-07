"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<space>"              " 定义<leader>键
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
set whichwrap+=<,>,h,l                  " 设置光标键跨行
set ttimeoutlen=0                       " 设置<ESC>键响应时间
set virtualedit=block,onemore           " 允许光标出现在最后一个字符的后面
set clipboard=unnamed                   " 设置 vim 与系统共用剪贴板


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 端点
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 括号
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 定义跳出括号函数，用于跳出括号
    " func SkipPair()
    "     if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
    "         return "\<ESC>la"
    "     else
    "         return "\t"
    "     endif
    " endfunc
    " 将tab键绑定为跳出括号
    " inoremap <TAB> <c-r>=SkipPair()<CR>
    " inoremap \"<LEFT><CR> <CR>\"<ESC><UP>o
    " inoremap '<LEFT><CR> <CR>'<ESC><UP>o
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap }<LEFT><CR> <CR>}<ESC><UP>o
inoremap ]<LEFT><CR> <CR>]<ESC><UP>o
inoremap )<LEFT><CR> <CR><BS><BS>)<ESC><UP>o<BS>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                                " vim自身命名行模式智能补全
set completeopt=menu,menuone,noselect       " 补全时不选择第一项


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                " 高亮显示搜索结果
set incsearch               " 开启实时搜索功能
set ignorecase smartcase    " 智能大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macvim 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let system = system('uname -s')
    if system == "Darwin\n"
        set guifont=JetBrains\ Mono:h18                                 " 设置字体: Jetbrain Mono
        " set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h18       " 设置字体
        " set guifont=MesloLGS\ NF:h18                                  " 设置字体: MesloLGS NF
    else
        set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 18      " 设置字体
    endif
    set guioptions-=m           " 隐藏菜单栏
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L           " 隐藏左侧滚动条
    set guioptions-=r           " 隐藏右侧滚动条
    set guioptions-=b           " 隐藏底部滚动条
    set showtabline=0           " 隐藏Tab栏
    set guicursor=n-v-c:ver5    " 设置光标为竖线
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 卸载默认插件 Unplug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'                          " 对齐插件
Plug 'chxuan/prepare-code'                        " 新建文件时，生成预定义代码片段
Plug 'mhinz/vim-startify'                         " 开始页面
Plug 'preservim/tagbar'                           " 使用preservim/tagbar的最新版本，taglist的替代品，显示类/方法/变量
Plug 'preservim/nerdtree'                         " 代码资源管理器
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'    " highlight	NerdTree文件类型高亮
Plug 'Xuyuanp/nerdtree-git-plugin'                " NerdTree显示git状态
Plug 'tpope/vim-commentary'                       " 快速注释代码插件
Plug 'tpope/vim-endwise'                          " if/end/endif/endfunction补全
Plug 'octol/vim-cpp-enhanced-highlight'           " 高亮
Plug 'vim-airline/vim-airline'                    " 可以取代powerline的状态栏美化插件
Plug 'vim-airline/vim-airline-themes'             
Plug 'ryanoasis/vim-devicons'                     " 文件类型图标
Plug 'junegunn/vim-slash'                         " 优化搜索，移动光标后清除高亮
Plug 'Shougo/echodoc.vim'                         " 补全函数时在命令栏显示函数签名
Plug 'terryma/vim-smooth-scroll'                  " 让翻页更顺畅
Plug 'rhysd/clever-f.vim'                         " 强化f和F键
Plug 'vim-scripts/indentpython.vim'               " 自动缩进
Plug 'junegunn/vim-peekaboo'                      " 显示寄存器的内容

" 加载补全插件
if filereadable(expand($HOME . '/.vimrc.ycm.config'))
    "启用 ycm 插件
    Plug 'Valloric/YouCompleteMe'                     " 基于语义的自动补全插件，支持C/C++、C#、Python、PHP等语言
else
    Plug 'skywind3000/vim-auto-popmenu'               " 基于上下文的自动提示功能
    Plug 'skywind3000/vim-dict'                       " 根据文件类型自动添加词典文件到当前缓存区
endif

" 加载自定义插件
if filereadable(expand($HOME . '/.vimrc.custom.plugins'))
    source $HOME/.vimrc.custom.plugins
endif

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load vim default plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime macros/matchit.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 绑定按键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编辑vimrc相关配置文件
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>vc :edit ~/.vimrc.custom.config<cr>
nnoremap <leader>vp :edit ~/.vimrc.custom.plugins<cr>

" 查看 vimart 的help文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimart/tools/help.md<cr>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

" 重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 分屏窗口移动
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l

" 复制当前选中到系统剪切板
" vmap <leader><leader>y "+y

" 将系统剪切板内容粘贴到vim
" nnoremap <leader><leader>p "+p

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" 主题设置
set background=dark
let g:onedark_termcolors=256
colorscheme onedark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" prepare-code
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

" vim-commentary
" 为 python, shell 等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
" 修改 java, c, cpp 注释风格
autocmd FileType java,c,cpp set commentstring=//\ %s

" tagbar
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

" echodoc.vim
let g:echodoc_enable_at_startup = 1

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


" 加载 ycm or (vim-auto-popmenu + vim-dcit) 配置
if filereadable(expand($HOME . '/.vimrc.ycm.config'))
    source $HOME/.vimrc.ycm.config
else
    " vim-auto-popmenu 配置
    " enable this plugin for filetypes, '*' for all files.
    let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1, '*':1}
    " source for dictionary, current or other loaded buffers, see ':help cpt'
    set cpt=.,k,w,b
    " 关闭状态栏的消息。(suppress annoy messages.)
    set shortmess+=c
    " 启动该插件。(Default: 1. Set to 0 to disable this plugin.)
    let g:apc_enable = 1
    " 提示最小值。(Default: 2 Minimal characters to trigger the completion popup menu.)
    let g:apc_min_length = 1

    " vim-dict 配置
    " 添加额外的字典文件夹
    let g:vim_dict_dict = [
        \ '~/.vim/dict',
        \ ]
    " 覆盖文件类型：即一个文件类型使用其他文件类型的字典文件。下面的 html 使用 html,javascript,css 三个文件类型的字典
    let g:vim_dict_config = {'html':'html,javascript,css', 'markdown':'text'}
    " 禁用某些类型的字典
    let g:vim_dict_config = {'text': ''}
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 加载配置环境
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 加载通用配置
source $HOME/.vim/settings/configs.vim
" 加载插件配置
source $HOME/.vim/settings/plugins.vim
" 加载自定义函数
source $HOME/.vim/settings/functions.vim
" 加载键盘映射
source $HOME/.vim/settings/key_mappings.vim
" 加载自动指令配置
source $HOME/.vim/settings/command_automation.vim

" 加载用户自定义配置
if filereadable(expand($HOME . '/.vimrc.custom.config'))
    source $HOME/.vimrc.custom.config
endif













