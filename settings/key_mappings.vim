""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键盘映射配置
" Tips: 如何查看映射的按键: `:map <mapping_key>`
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 判断是否已经加载过
if exists("s:did_load_mappings_vim")
    finish
endif
let s:did_load_mappings_vim = 1

"{{{> import vim scripts
" 导入 functions.vim
source ${HOME}/.vim/settings/functions.vim
"<}}}

"{{{> 端点
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
"<}}}

"{{{> 括号
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
" inoremap }<LEFT><CR> <CR>}<ESC><UP>o
" inoremap ]<LEFT><CR> <CR>]<ESC><UP>o
" inoremap )<LEFT><CR> <CR><BS><BS>)<ESC><UP>o<BS>
"<}}}

"{{{> 正常模式绑定按键
" 编辑vimrc相关配置文件
" nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>evc :edit ~/.vimrc.custom.config<cr>
nnoremap <leader>evp :edit ~/.vimrc.custom.plugins<cr>
" 重新加载vimrc文件
" nnoremap <leader>s :source $MYVIMRC<cr>

" 查看 vimart 的help文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimart/docs/help.md<cr>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

" 安装、更新、删除插件
nnoremap <leader>kpi :PlugInstall<cr>
nnoremap <leader>kpu :PlugUpdate<cr>
nnoremap <leader>kpc :PlugClean<cr>

" 相对行号的开启/关闭
nnoremap <silent> <leader>kn :call ToggleNumber()<cr>

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y

" 将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p

" 清理所有空行的空格
nnoremap <leader>ks :%s/^\s*$//g<cr>

" 手动触发 CursorHold 事件
nnoremap <leader>kh :doautocmd CursorHold<cr>
" 关闭popup
nnoremap <leader>kc :call popup_clear(1)<cr>
"<}}}

"{{{> 会话相关
" 创建会话
nnoremap <silent> <leader>kss :mksession! .Session.vim<cr>
" 加载会话
nnoremap <silent> <leader>ksl :source .Session.vim<cr>
"<}}}

"{{{> 窗口相关
" 分屏窗口移动
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" 设置c-tab和c-s-tab
" nnoremap <C-Tab>   <C-W>w
" inoremap <C-Tab>   <C-O><C-W>w
" nnoremap <C-S-Tab> <C-W>W
" inoremap <C-S-Tab> <C-O><C-W>W
"<}}}


