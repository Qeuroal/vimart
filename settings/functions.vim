""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 函数相关配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 判断是否已经加载过
if exists("s:did_load_functions_vim")
    finish
endif
let s:did_load_functions_vim = 1

" 相对行号的开启/关闭
function! ToggleNumber()
    if (&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

" popup滚动
function ScrollPopup(up=0)
    if (len(popup_list()) >= 1)
        let popid = popup_list()[0]
        let firstline = popup_getoptions(popid)['firstline']
        if (a:up)
            call popup_setoptions(popid, {'firstline': max([1, firstline-1])})
        else
            call popup_setoptions(popid, {'firstline': firstline+1})
        endif
    endif
endfunc



