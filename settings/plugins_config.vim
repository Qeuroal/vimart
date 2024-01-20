""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{> 判断是否已经加载过该配置文件
if exists("s:did_load_plugins_config_vim")
    finish
endif
let s:did_load_plugins_config_vim = 1
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
nnoremap <leader><leader>l :Tab /\|<cr>
nnoremap <leader><leader>= :Tab /=<cr>
"<}}}

"{{{> auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
" tex 文件不设置反引号括号匹配
au FileType tex let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''"}
"<}}}

"{{{> vim-buffer
nnoremap <silent> <c-p> :PreviousBuffer<cr>
nnoremap <silent> <c-n> :NextBuffer<cr>
nnoremap <silent> <leader>d :CloseBuffer<cr>
nnoremap <silent> <leader>D :BufOnly<cr>
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
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")
"<}}}

"{{{> nerdtree
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
"<}}}

"{{{> vim-commentary
" 为 python, shell 等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
" 修改 java, c, cpp 注释风格
autocmd FileType java,c,cpp set commentstring=//\ %s
"<}}}

"{{{> tagbar
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>
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

"{{{> vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"<}}}

"{{{> 加载 ycm or (vim-auto-popmenu + vim-dcit) 配置
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
"<}}}

"{{{> vimtex
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" skim relative
if has('win32') || has('win64') || has('win16')
    let g:vimtex_view_method=''
else
    let system = system('uname -s')
    if system == "Darwin\n"
        let g:vimtex_view_method='skim'
        let g:vimtex_view_skim_sync=1
        let g:vimtex_view_skim_activate=1
    elseif system == "Linux\n"
        let g:vimtex_view_method='zathura'
    else
        let g:vimtex_view_method=''
    endif
endif
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

"{{{> cpp-mode
nnoremap <leader>y :CopyCode<cr>
nnoremap <leader>p :PasteCode<cr>
nnoremap <leader>U :GoToFunImpl<cr>
nnoremap <silent> <leader>a :Switch<cr>
nnoremap <leader><leader>fp :FormatFunParam<cr>
nnoremap <leader><leader>if :FormatIf<cr>
nnoremap <leader><leader>t dd :GenTryCatch<cr>
xnoremap <leader><leader>t d :GenTryCatch<cr>
"<}}}



