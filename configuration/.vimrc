set nocompatible    " VI compatible mode is disabled so that VIm things work

"{{{> ====================== 加载插件 ======================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{> 卸载默认插件 Unplug
function! s:deregister(repo)
    let repo = substitute(a:repo, '[\/]\+$', '', '')
    let name = fnamemodify(repo, ':t:s?\.git$??')
    call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)
" <}}}

"{{{> 加载客制选项
" 导入用户配置
if filereadable(expand('~/.vimrc.custom.config'))
    source ~/.vimrc.custom.config
endif
" 补全方案
let g:completeScheme=get(g:, "completeScheme", 0)
"<}}}

" {{{> 插件
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/AnsiEsc.vim', { 'on': ['AnsiEsc'] }       " 高亮Ansi字符. 默认不加载, 使用 :AnsiEsc 加载插件
Plug 'easymotion/vim-easymotion'                    " EasyMotion, 移动指令增强
Plug 'tpope/vim-repeat'                             " 重复上一次操作
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }   " 更强大的文件和函数模糊搜索工具
Plug 'Yggdroot/indentLine'                          " 缩进线
Plug 'preservim/vimux'                              " 不离开vim在随意shell中随便运行命令
Plug 'christoomey/vim-tmux-navigator'               " vim与tmux无缝导航
Plug 'qeuroal/vim_tmux_events'                      " 支持FocusGained和FocusLost自动命令事件在终端vim中起作用
Plug 'mbbill/undotree'                              " 可视化undo历史, 浏览和切换undo分支
Plug 'vim-scripts/DoxygenToolkit.vim'               " Doxygen 注释
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }         " Fzf 搜索
Plug 'junegunn/fzf.vim'
Plug 'sirver/ultisnips', { 'for': ['tex', 'markdown'] }     " 管理片段
Plug 'lervag/vimtex', { 'for': ['tex'] }            " latex
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }   " markdown 即时预览
Plug 'jiangmiao/auto-pairs'                         " 自动匹配括号
Plug 'godlygeek/tabular'                            " 对齐插件
Plug 'preservim/vim-markdown', { 'for': ['markdown'] }      " 语法高亮, 匹配规则以及对原始Markdown的映射和拓展
Plug 'chxuan/prepare-code'                          " 新建文件时，生成预定义代码片段
Plug 'mhinz/vim-startify'                           " 开始页面
Plug 'preservim/tagbar'                             " 使用preservim/tagbar的最新版本，taglist的替代品，显示类/方法/变量
Plug 'preservim/nerdtree'                           " 代码资源管理器
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " highlight NerdTree文件类型高亮
Plug 'Xuyuanp/nerdtree-git-plugin'                  " NerdTree显示git状态
Plug 'tpope/vim-commentary'                         " 快速注释代码插件
Plug 'tpope/vim-endwise'                            " if/end/endif/endfunction补全
Plug 'tpope/vim-surround'                           " 自动增加、替换配对符的插件
Plug 'octol/vim-cpp-enhanced-highlight'             " 高亮
Plug 'vim-airline/vim-airline'                      " 可以取代powerline的状态栏美化插件
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'                       " 文件类型图标
Plug 'qeuroal/vimslash'                             " 优化搜索，移动光标后清除高亮
Plug 'Shougo/echodoc.vim'                           " 补全函数时在命令栏显示函数签名
Plug 'rhysd/clever-f.vim'                           " 强化f和F键
Plug 'vim-scripts/indentpython.vim'                 " 自动缩进
Plug 'junegunn/vim-peekaboo'                        " 显示寄存器的内容
Plug 'frazrepo/vim-rainbow'                         " 为括号涂上颜色

" 让翻页更顺畅
if exists('&smoothscroll')
    set smoothscroll                                " 仅在vim版本9后支持
else
    Plug 'psliwka/vim-smoothie'                     " 平滑插件
endif

" 加载补全插件
" if filereadable(expand('~/.vimrc.ycm.config'))
if g:completeScheme == 1
    "启用 ycm 插件
    if system("python3 --version | awk -F ' ' '{print $2}' | awk -F '.' '{print $2}'") > 8
        Plug 'Valloric/YouCompleteMe'                       " 基于语义的自动补全插件，支持C/C++、C#、Python、PHP等语言
    else
        Plug 'Qeuroal/YouCompleteMeLowVersion'              " YouCompleteMe低版本, 用以兼容低版本系统、低版本Python3 等等
    endif
elseif g:completeScheme == 2
    " Plug 'vim-scripts/AutoComplPop'                     " This is a mirror of 
    "                                                     " http://www.vim.org/scripts/script.php?script_id=1879
    Plug 'Qeuroal/vimautosense'                         " 自动补全插件, 默认: 不自动选择第一个匹配项
    Plug 'Qeuroal/vimdicts'                             " 补全词典
elseif g:completeScheme == 3
    Plug 'skywind3000/vim-auto-popmenu'                 " 基于上下文的自动提示功能
    Plug 'skywind3000/vim-dict'                         " 根据文件类型自动添加词典文件到当前缓存区
endif

" 加载自定义插件
if filereadable(expand('~/.vimrc.custom.plugins'))
    source ~/.vimrc.custom.plugins
endif

" 加载过去/待选的插件
source ~/.vim/settings/former_plugins.vim

call plug#end()
" <}}}

" {{{> load vim default plugin
runtime macros/matchit.vim
" <}}}

"====================== 加载插件 ====================== <}}}


"{{{> ====================== 加载通用配置 ======================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{> 加载外部配置
" source $VIMRUNTIME/vimrc_example.vim      " 导入 Vim 的示例配置（会打开一些有用的选项，如语法加亮、搜索加亮、命令历史、记住上次的文件位置，等等）
                                            " 这会加载一些不知道的选项, 不利于整体维护
                                            " 如果需要请自行添加
" <}}}

" {{{> 通用设置
let mapleader = ";"                     " 定义<leader>键
set nocompatible                        " 设置不兼容原始vi模式
filetype on                             " 设置开启文件类型侦测
filetype plugin on                      " 设置加载对应文件类型的插件
" set noeb                                " 关闭错误的提示
syntax enable                           " 开启语法高亮功能
syntax on                               " 自动语法高亮
set t_Co=256                            " 开启256色支持
set cmdheight=2                         " 设置命令行的高度
set showcmd                             " select模式下显示选中的行数
set ruler                               " 总是显示光标位置
set laststatus=2                        " 总是显示状态栏
set number                              " 开启行号显示
set cursorline                          " 高亮显示当前行
set whichwrap+=<,>,h,l                  " 设置光标键跨行
set ttimeoutlen=0                       " 设置<ESC>键响应时间
set timeoutlen=4000                     " 设置<leader>按键响应时间
set virtualedit=block,onemore           " 允许光标出现在最后一个字符的后面
set clipboard=unnamed                   " 设置 vim 与系统共用剪贴板
set foldmarker={{{>,<}}}                " 设置标志折叠的标志
set foldmethod=marker                   " 设置折叠为标志折叠
set mouse=""                            " 设置鼠标不可用
set splitbelow                          " 分割窗口, 默认在下方
" set splitright                          " 分割窗口, 默认在右侧
set noerrorbells visualbell t_vb=       " disable audible bell
if has("patch-7.4.710")
    set listchars=eol:↵,tab:»·,trail:╳,extends:»,precedes:«,space:_ " 设置不可见字符
else
    set listchars=eol:↵,tab:»·,trail:╳,extends:»,precedes:«         " 设置不可见字符
endif
" <}}}

" {{{> 代码缩进和排版
set autoindent                  " 设置自动缩进
set cindent                     " 设置使用C/C++语言的自动缩进方式
set cinoptions=:0,g0,N-s,(0,w1  " 设置C/C++语言的具体缩进方式
                                "   :0 表示 switch 下面的 case 语句不进行额外缩进
                                "   g0 代表作用域声明(public:、private: 等)不额外缩进
                                "   (0 和 w1 配合代表没结束的圆括号里的内容折行时不额外缩进
set smartindent                 " 智能的选择对其方式
filetype indent on              " 自适应不同语言的智能缩进
set expandtab                   " 将制表符<Tab>扩展为空格
set tabstop=4                   " 设置编辑和实际插入制表符占用的空格数, 即设置"硬"制表符为tabstop个空格
set shiftwidth=4                " 设置格式化时制表符和自动产生一个缩进占用的空格数
set softtabstop=4               " 设置4个空格为制表符, 即"软"制表符宽度.
                                " softtabstop看成"虚拟"的tapstop, 一旦设置了这个选项为非零值，再键入<Tab>和<BS>(退格键)
                                " 你就感觉像设置了这个宽度的 tabstop 一样, " 实际插入的仍受expandtab和tabstop两个选项控制
set smarttab                    " 在行和段开始处使用制表符
set wrap                        " 自动折行
" set nowrap                    " 禁止折行
set diffopt+=followwrap         " 设置 diff 默认跟随现有设置
set diffopt+=context:3          " 显示不同之处上下各3行文本
" set linebreak                   " 不会在单词内部折行
set backspace=2                 " 使用回车键正常处理indent,eol,start等
set sidescroll=10               " 设置向右滚动字符数
set nofoldenable                " 禁用折叠代码
" <}}}

"{{{> conceal opts
set conceallevel=2              " 隐藏水平
set concealcursor=""            " 设置在什么模式隐藏
"<}}}

" {{{> 代码补全
set wildmenu                                " vim自身命名行模式智能补全
set completeopt=menu,menuone,noselect       " 补全时不选择第一项
" <}}}

" {{{> 搜索设置
set hlsearch                " 高亮显示搜索结果
set incsearch               " 开启实时搜索功能
set ignorecase smartcase    " 智能大小写不敏感
set grepprg=rg\ --vimgrep\ --smart-case\ --follow\ --hidden\ --glob\ '!.git/**'     " 设置grep 为 grepprg
" <}}}

" {{{> 缓存设置
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
" 保留跨会话撤销编辑的能力
if has('persistent_undo')
    set undofile        " keep an undo file (undo changes after closing), 自动创建和保存历史记录
endif
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

" {{{> gvim/macvim 设置
if has("gui_running")
    " 无需配置windows系统相关
    let system = system('uname -s')
    if system == "Darwin\n"
        set guifont=JetBrainsMonoNL\ Nerd\ Font:h20                     " 设置字体: JetBrainsMonoNL Nerd Font
    else
        set guifont=JetBrainsMonoNL\ Nerd\ Font\ 16                     " 设置字体: JetBrainsMonoNL Nerd Font
    endif

    set guioptions-=m                   " 隐藏菜单栏
    set guioptions-=T                   " 隐藏工具栏
    set guioptions-=L                   " 隐藏左侧滚动条
    set guioptions-=r                   " 隐藏右侧滚动条
    set guioptions-=b                   " 隐藏底部滚动条
    set showtabline=0                   " 隐藏Tab栏
    " set guicursor=n-v-c-i:block         " 设置光标为方块
    set guicursor=a:block,a:blinkon0    " 设置光标为方块, 且光标不闪烁
    set lines=999 columns=999           " 设置启动为最大化窗口
elseif &term =~ 'xterm' || &term =~ 'screen' || &term == 'win32' || &term == 'alacritty' || &term =~ 'st'
    " Cursor settings:
    "  1 -> blinking block
    "  2 -> solid block
    "  3 -> blinking underscore
    "  4 -> solid underscore
    "  5 -> blinking vertical bar
    "  6 -> solid vertical bar

    " modes:
    " SI = INSERT mode
    " SR = REPLACE mode
    " EI = NORMAL mode (ELSE)

    " 使用 DECSCUSR 转义序列
    let &t_SI = "\e[2 q"
    let &t_SR = "\e[2 q"
    let &t_EI = "\e[2 q"
    " let &t_ti ..= "\e[2 q"
    " let &t_te ..= "\e[2 q"      " 缺省 (取决于终端，通常是闪烁块状)
    let &t_ti .= "\e[2 q"
    let &t_te .= "\e[2 q"       " 缺省 (取决于终端，通常是闪烁块状)
else
    echom "vimrc: not support term (" . &term . ")."
endif
" <}}}

"{{{> diff
" 新增的行
highlight DiffAdd ctermbg=235 ctermfg=108 guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
" 删除的行
highlight DiffDelete ctermbg=235 ctermfg=131 guibg=#262626 guifg=#af5f5f cterm=reverse gui=reverse
" 差异的行
highlight DiffChange ctermbg=235 ctermfg=103 guibg=#262626 guifg=#8787af cterm=reverse gui=reverse
" 差异的文字
highlight DiffText ctermbg=235 ctermfg=208 guibg=#262626 guifg=#ff8700 cterm=reverse gui=reverse
"<}}}

"====================== 加载通用配置 ====================== <}}}


"{{{> ====================== 加载自定义函数 ======================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{> 相对行号的开启/关闭
function! ToggleNumber()
    if (&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunction
"<}}}

"{{{> popup滚动
function! ScrollPopup(nlines=0)
    " let winids = popup_list()
    if (exists("*popup_list"))
        let winids = popup_list()
    else
        let winids = 0
    endif
    if len(winids) == 0
        return
    endif

    " Ignore hidden popups
    let prop = popup_getpos(winids[0])
    if prop.visible != 1
        return
    endif

    let firstline = prop.firstline + a:nlines
    let buf_lastline = str2nr(trim(win_execute(winids[0], "echo line('$')")))
    if firstline < 1
        let firstline = 1
    elseif prop.lastline + a:nlines > buf_lastline
        let firstline = buf_lastline + prop.firstline - prop.lastline
    endif

    call popup_setoptions(winids[0], {'firstline': firstline})
endfunction
"<}}}

"====================== 加载自定义函数 ====================== <}}}


"{{{> ====================== 加载插件配置 ======================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{> easymotion
map <Space> <Plug>(easymotion-prefix)
"<}}}

"{{{> LeaderF
nnoremap <silent> <leader>o :LeaderfFile .<CR>
nnoremap <silent> <leader>f :LeaderfFunction<CR>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_ShowHidden = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_CommandMap = {'<C-UP>': ['<S-tab>'], '<C-DOWN>': ['<tab>']}
"<}}}

"{{{> indentLine
let g:indentLine_setConceal = 0
" let g:indentLine_concealcursor = &concealcursor
" let g:indentLine_conceallevel = &conceallevel
"<}}}

"{{{> fzf
nnoremap <silent> <leader>s :RG<CR>
"<}}}

"{{{> ultisnips
" 设置 tab 触发
let g:UltiSnipsExpandTrigger="<tab>"
" 使用 tab 切换下一个触发点，
let g:UltiSnipsJumpForwardTrigger="<tab>"
" 使用 shit+tab 上一个触发点
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"
"<}}}

"{{{> markdown-preview
" set to 1, nvim will open the preview window after entering the markdown buffer (default: 0)
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change from markdown buffer to another buffer (default: 1)
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or leave from insert mode, default 0 is auto refresh markdown as you edit or move the cursor (default: 0)
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files, by default it can be use in markdown file (default: 0)
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network by default, the server listens on localhost (127.0.0.1) (default: 0)
let g:mkdp_open_to_the_world = 1
" use custom IP to open preview page useful when you work in remote vim and preview on local browser more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9 (default empty)
let g:mkdp_open_ip = '127.0.0.1'
" specify browser to open preview page for path with space valid: `/path/with\ space/xxx` invalid: `/path/with\\ space/xxx` (default: '')
let g:mkdp_browser = ''
" set to 1, echo preview page url in command line when open preview page (default is 0)
let g:mkdp_echo_preview_url = 1
" a custom vim function name to open preview page this function will receive url as param (default is empty)
let g:mkdp_browserfunc = ''
" use a custom port to start server or empty for random
let g:mkdp_port = '6886'
" preview page title, ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" recognized filetypes, these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
" " use a custom markdown style must be absolute path (like '/Users/username/markdown.css' or expand('~/markdown.css'))
" let g:mkdp_markdown_css = ''
" " use a custom highlight style must absolute path (like '/Users/username/highlight.css' or expand('~/highlight.css'))
" let g:mkdp_highlight_css = ''
" " set default theme (dark or light). By default the theme is define according to the preferences of the system
" let g:mkdp_theme = 'dark'
"<}}}

"{{{> tabular
"<}}}

"{{{> auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
" tex 文件不设置反引号括号匹配
au FileType tex let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''"}
"<}}}

"{{{> airline
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
"<}}}

"{{{> prepare-code
let g:prepare_code_plugin_path = expand("~/.vim/plugged/prepare-code")
"<}}}

"{{{> nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <leader>N :NERDTreeFind<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'
" 显示隐藏文件
let g:NERDTreeShowHidden=1
"<}}}

"{{{> vim-commentary
" 为 python, shell 等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
" 修改 java, c, cpp 注释风格
autocmd FileType java,c,cpp set commentstring=//\ %s
"<}}}

"{{{> tagbar
let g:tagbar_width = 30
let g:tagbar_sort = 0       " 根据位置排序
nnoremap <silent> <leader>t :TagbarToggle<cr>
" 支持markdown
let g:tagbar_type_markdown = {
            \ 'ctagsbin'  : '~/.vim/bin/mdctags',
            \ 'ctagsargs' : '',
            \ 'kinds'     : [
            \     'a:h1:0:0',
            \     'b:h2:0:0',
            \     'c:h3:0:0',
            \     'd:h4:0:0',
            \     'e:h5:0:0',
            \     'f:h6:0:0',
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \     'a' : 'h1',
            \     'b' : 'h2',
            \     'c' : 'h3',
            \     'd' : 'h4',
            \     'e' : 'h5',
            \     'f' : 'h6',
            \ },
            \ 'scope2kind' : {
            \     'h1' : 'a',
            \     'h2' : 'b',
            \     'h3' : 'c',
            \     'h4' : 'd',
            \     'h5' : 'e',
            \     'h6' : 'f',
            \}
            \}
"<}}}

"{{{> nerdtree-git-plugin
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
"<}}}

"{{{> echodoc.vim
let g:echodoc_enable_at_startup = 1
"<}}}

"{{{> 加载补全配置
" 补全方案
let g:completeScheme=get(g:, "completeScheme", 0)
" if filereadable(expand('~/.vimrc.ycm.config'))
if g:completeScheme == 1 && filereadable(expand('~/.vimrc.ycm.config'))
    source ~/.vimrc.ycm.config
elseif g:completeScheme == 3
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

if !(g:completeScheme == 1 && filereadable(expand('~/.vimrc.ycm.config')))
    " nop 按键
    imap <C-L> <C-N>
    nnoremap <leader>u <nop>
    nnoremap <leader>U <nop>
    nnoremap <leader>r <nop>
    nnoremap <leader>g <nop>
    nnoremap <leader>yt <nop>
    nnoremap <leader>yh <nop>
endif
"<}}}

"{{{> vimtex
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
" skim relative
if has('win32') || has('win64') || has('win16')
    let g:vimtex_view_method=''
else
    let system = system('uname -s')
    if system == "Darwin\n"
        let g:vimtex_view_method='skim'
        let g:vimtex_view_skim_sync=1
        let g:vimtex_view_skim_activate=0
    elseif system == "Linux\n"
        let g:vimtex_view_method='zathura'
    else
        let g:vimtex_view_method=''
    endif
endif
let g:vimtex_syntax_conceal = {
      \ 'accents': 1,
      \ 'ligatures': 1,
      \ 'cites': 1,
      \ 'fancy': 1,
      \ 'spacing': 0,
      \ 'greek': 1,
      \ 'math_bounds': 1,
      \ 'math_delimiters': 1,
      \ 'math_fracs': 1,
      \ 'math_super_sub': 1,
      \ 'math_symbols': 1,
      \ 'sections': 1,
      \ 'styles': 1,
      \}
    " default: {'math_super_sub': 1, 'accents': 1, 'greek': 1, 'styles': 1, 'math_fracs': 1, 'math_symbols': 1, 'spacing': 1, 'ligatures': 1 , 'fancy': 1, 'sections': 0, 'math_delimiters': 1, 'math_bounds': 1, 'cites': 1}
"<}}}

"{{{> DoxygenToolkit
let g:DoxygenToolkit_authorName="Qeuroal, Qeuroal@163.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_briefTag_pre="\\brief "
let g:DoxygenToolkit_paramTag_pre="\\param "
let g:DoxygenToolkit_returnTag="\\return "
" let g:DoxygenToolkit_commentType="Qt"
let g:DoxygenToolkit_commentType="C++"
"<}}}

"{{{> vim-rainbow
" autocmd VimEnter * :RainbowLoad
autocmd BufWinEnter *.* RainbowLoad
" 补充: 效果默认不自动启用，可以用 :RainbowToggle 命令来切换，或用 :RainbowLoad 命令来加载
"<}}}

"{{{> undotree
nnoremap <silent> <leader><F5> :TagbarClose<CR>:UndotreeToggle<CR>
let g:undotree_WindowLayout = 4
let g:undotree_CustomUndotreeCmd  = 'botright vertical 30 new'
let g:undotree_CustomDiffpanelCmd = 'botright 10 new'
let g:tagbar_map_showproto = '<leader><space>'
"<}}}

"{{{> vim-markdown
" 关闭自动折叠
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
"<}}}

"{{{> preservim/vimux
" Prompt for a command to run
nnoremap <silent> <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
nnoremap <silent> <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
nnoremap <silent> <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
nnoremap <silent> <leader>vz :VimuxZoomRunner<CR>
"<}}}

"====================== 加载插件配置 ====================== <}}}


"{{{> ====================== 加载指令配置 ======================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" save read-only files
command -nargs=0 Sudow w !sudo tee % >/dev/null

"{{{> generate ctags function based on filetype
function! s:generateTags(isForAll=0)
    if (a:isForAll != 0)
        call system("ctags --sort=foldcase -R .")
    elseif ((&filetype == "c") || (&filetype == "cpp"))
        call system("ctags --sort=foldcase --fields=+iaS --extra=+q --c-kinds=+p -R .")
    elseif (&filetype == "python")
        call system("ctags --sort=foldcase --fields=+l --languages=python -R .")
    else
        echom "The current file type is NOT supported!!!"
    endif
endfunction
" generate ctags based on filetype
command! -nargs=? Gtags call s:generateTags(<f-args>)
" <}}}

"{{{> buffer management
" delete other buffers
command! -nargs=0 Bonly %bd | e#
"<}}}

"{{{>
" 清理所有空行的空格
command! -nargs=0 DelBlankSpace :'<,'>s/^\s*$//g
command! -nargs=0 DelBlankSpaces :%s/^\s*$//g
"<}}}
"====================== 加载指令配置 ====================== <}}}


"{{{> ====================== 加载自动指令配置 ======================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{> 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
"<}}}

"{{{> 关闭自动折叠代码块(目前有bug: 导致buffer中的"撤销"和"重做"没有记录)
" autocmd! BufNewFile,BufRead * setlocal nofoldenable
"<}}}

"{{{> 自动创建视图
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview
"<}}}

"{{{> markdown 设置缩进为3个空格
" autocmd FileType markdown set shiftwidth=3 | set expandtab | set tabstop=3 | set softtabstop=3
augroup filetype_indent
    autocmd!
    autocmd FileType * if &filetype != 'markdown' | set shiftwidth=4 | set tabstop=4 | set softtabstop=4 | else | set shiftwidth=3 | set tabstop=3 | set softtabstop=3 | endif
augroup END
"<}}}

"{{{> quickfix 设置
" 设置 quickfix 窗口默认在最下面
autocmd FileType qf wincmd J
"<}}}

"{{{> 自动刷新文件命令
augroup auto_read
    autocmd!
    " autocmd FocusGained,BufEnter * checktime
    autocmd CursorHold,CursorHoldI * checktime
augroup END
"<}}}

""{{{> 自动换行
"autocmd FileType * setlocal textwidth=100 formatoptions+=t
""<}}}

"====================== 加载自动指令配置 ====================== <}}}


"{{{> ====================== 加载键盘映射 ======================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{> 解绑按键
" nmap Q <nop>
nmap <C-q> <nop>
"<}}}

"{{{> 端点
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
"<}}}

"{{{> basic key mapping
" 查看 vimart 的help文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimart/docs/help.md<cr>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

" 相对行号的开启/关闭
nnoremap <silent> <leader>kn :call ToggleNumber()<cr>

"<}}}

"{{{> autocmd key mapping
" 手动触发 CursorHold 事件
nnoremap <silent> <leader>c :doautocmd CursorHold<cr>
"<}}}

"{{{> popup
" 滚动popup
nnoremap <silent> <F9> :call ScrollPopup(1)<CR>
nnoremap <silent> <F10> :call ScrollPopup(-1)<CR>
" 关闭popup
nnoremap <silent> <leader>pc :call popup_clear(1)<cr>
"<}}}

"{{{> 会话相关
" 创建会话
nnoremap <leader>kss :mksession! .Session.vim<cr>
" 加载会话
nnoremap <leader>ksl :source .Session.vim<cr>
"<}}}

"{{{> 窗口相关
" 分屏窗口移动
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
"<}}}

"{{{> 跳转相关
" 将nj和nk加入跳转列表
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
"<}}}

"{{{> buffer
nnoremap <silent> <c-p> :bp<bar>if &bt!=''<bar>bp<bar>endif<cr>
nnoremap <silent> <c-n> :bn<bar>if &bt!=''<bar>bn<bar>endif<cr>
" 删除当前缓冲区
nnoremap <silent> <leader>d :bd<cr>
" 删除上一个缓冲区
nnoremap <silent> <leader>D :bd#<cr>
"<}}}

"{{{> window
nnoremap <silent> <leader>w :clo<cr>
"<}}}

"====================== 加载键盘映射 ====================== <}}}


"{{{> ====================== 加载用户配置 ======================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{> 加载用户自定义配置
if filereadable(expand('~/.vimrc.custom.config'))
    source ~/.vimrc.custom.config
endif
"<}}}

"====================== 加载用户配置 ====================== <}}}




