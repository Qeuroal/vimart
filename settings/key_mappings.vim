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

"{{{> basic key mapping
" 查看 vimart 的help文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimart/docs/help.md<cr>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

" 相对行号的开启/关闭
nnoremap <silent> <leader>kn :call ToggleNumber()<cr>

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y

" 将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p

" 清理所有空行的空格
nnoremap <leader>ks :%s/^\s*$//g<cr>
"<}}}

"{{{> autocmd key mapping
" 手动触发 CursorHold 事件
nnoremap <leader>c :doautocmd CursorHold<cr>
"<}}}

"{{{> popup
" 滚动popup
nnoremap <F9> :call ScrollPopup(1)<CR>
nnoremap <F10> :call ScrollPopup(-1)<CR>
" 关闭popup
nnoremap <leader>pc :call popup_clear(1)<cr>
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
"<}}}


