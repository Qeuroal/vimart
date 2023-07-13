""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 判断是否已经加载过
if exists("s:did_load_plugins_vim")
    finish
endif
let s:did_load_plugins_vim = 1

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

Plug 'chxuan/vim-buffer'                          " buffer 管理
Plug 'jiangmiao/auto-pairs'                       " 自动匹配括号
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
" 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-buffer
nnoremap <silent> <c-p> :PreviousBuffer<cr>
nnoremap <silent> <c-n> :NextBuffer<cr>
nnoremap <silent> <leader>d :CloseBuffer<cr>
nnoremap <silent> <leader>D :BufOnly<cr>

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
" 显示隐藏文件
let g:NERDTreeShowHidden=1

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


