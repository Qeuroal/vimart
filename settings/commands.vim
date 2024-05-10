""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{> 判断是否已经加载过
if exists("s:did_load_commands_vim")
    finish
endif
let s:did_load_commands_vim = 1
" <}}}

" save read-only files
command -nargs=0 sudow w !sudo tee % >/dev/null



