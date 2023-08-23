""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 判断是否已经加载过
if exists("s:did_load_plugins_vim")
    finish
endif
let s:did_load_plugins_vim = 1

" {{{> 卸载默认插件 Unplug
function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)
" <}}}

" {{{> 插件
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex', { 'for': ['tex'] }            " latex
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }   " markdown 即时预览
Plug 'chxuan/vim-buffer'                            " buffer 管理
Plug 'jiangmiao/auto-pairs'                         " 自动匹配括号
Plug 'godlygeek/tabular'                            " 对齐插件
Plug 'chxuan/prepare-code'                          " 新建文件时，生成预定义代码片段
Plug 'mhinz/vim-startify'                           " 开始页面
Plug 'preservim/tagbar'                             " 使用preservim/tagbar的最新版本，taglist的替代品，显示类/方法/变量
Plug 'preservim/nerdtree'                           " 代码资源管理器
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " highlight	NerdTree文件类型高亮
Plug 'Xuyuanp/nerdtree-git-plugin'                  " NerdTree显示git状态
Plug 'tpope/vim-commentary'                         " 快速注释代码插件
Plug 'tpope/vim-endwise'                            " if/end/endif/endfunction补全
Plug 'tpope/vim-surround'                           " 自动增加、替换配对符的插件
Plug 'octol/vim-cpp-enhanced-highlight'             " 高亮
Plug 'vim-airline/vim-airline'                      " 可以取代powerline的状态栏美化插件
Plug 'vim-airline/vim-airline-themes'             
Plug 'ryanoasis/vim-devicons'                       " 文件类型图标
Plug 'junegunn/vim-slash'                           " 优化搜索，移动光标后清除高亮
Plug 'Shougo/echodoc.vim'                           " 补全函数时在命令栏显示函数签名
Plug 'terryma/vim-smooth-scroll'                    " 让翻页更顺畅
Plug 'rhysd/clever-f.vim'                           " 强化f和F键
Plug 'vim-scripts/indentpython.vim'                 " 自动缩进
Plug 'junegunn/vim-peekaboo'                        " 显示寄存器的内容

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
" <}}}

" {{{> load vim default plugin
runtime macros/matchit.vim
" <}}}

