if !empty(glob('~/.vim/bundle/clang_complete/plugin/clang_complete.vim'))
    " let g:clang_c_options = '-std=gnu11'
    " let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
    let g:clang_library_path = '/usr/lib/libclang.so'
    let g:clang_complete = 0 "automatically selects the first entry in the popup menu
    let g:clang_complete_auto = 0
    let g:clang_close_preview = 1
    let g:clang_auto_select = 0

    set completefunc=syntaxcomplete#Complete
    set completeopt=longest,menuone

    let g:clang_jumpto_back_key = "<C-O>"

    let g:clang_snippets=1
    let g:clang_snippets_engine="ultisnips"
    let g:clang_complete_optional_args_in_snippets = 1
    let g:clang_trailing_placeholder = 1

endif

if !empty(glob('~/.vim/bundle/supertab/plugin/supertab.vim'))

    let g:AutoPairsMapCR = 0
    imap <silent><CR> <CR><Plug>AutoPairsReturn
    let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
    let g:SuperTabContextDefaultCompletionType='<c-n>'

endif

if !empty(glob('~/.vim/bundle/ultisnips/plugin/UltiSnips.vim'))
    if has('nvim')
        let g:UltiSnipsExpandTrigger   = "<c-e>"
    else
        " let g:UltiSnipsExpandTrigger   = "<c-e>"
        let g:UltiSnipsExpandTrigger   = "<NUL>"
    endif
    let g:UltiSnipsListSnippets        = "<c-j>"
    let g:UltiSnipsJumpForwardTrigger  = "<c-e>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
    let g:UltiSnipsEditSplit           = "horizontal"
    let g:UltiSnipsSnippetDirectories  = ["ultisnips"]
    let g:UltiSnipsEnableSnipMate      = 0
endif
