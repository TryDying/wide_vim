if !empty(glob("~/.vim/bundle/YouCompleteMe/plugin/youcompleteme.vim"))
    "ycm-config
    " let g:ycm_error_symbol='✗'
    " let g:ycm_warning_symbol='☺'
    nnoremap <leader>gl :YcmCompleter GoToDeclaration<cr>
    nnoremap <leader>gd :YcmCompleter GoToDefinition<cr>
    nnoremap <leader>gr :YcmCompleter GoToReferences<cr>
    nnoremap <leader>gi :YcmCompleter GoToInclude<cr>
    nnoremap <leader>gt :YcmCompleter GetType<cr>
    nnoremap <leader>gp :YcmCompleter GetParent<cr>
    nnoremap <leader>gc :YcmCompleter GetDoc<cr>
    nnoremap <leader>ga :YcmCompleter RefactorRename<space>

    let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

    let g:ycm_collect_identifiers_from_tag_files = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_server_log_level = 'info'
    let g:ycm_confirm_extra_conf = 0
    let g:syntastic_always_populate_loc_list = 0
    let g:ycm_clangd_binary_path = '/usr/bin/clangd'
    set completeopt=menu,menuone
    let g:ycm_add_preview_to_completeopt = 0

    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_enable_diagnostic_highlighting = 0

    let g:ycm_semantic_triggers =  {
                \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                \ 'cs,lua,javascript': ['re!\w{2}'],
                \ }


    autocmd User YcmQuickFixOpened call s:CustomizeYcmWindow()
    autocmd User YcmLocationOpened call s:CustomizeYcmWindow()
    function! s:CustomizeYcmWindow()
        copen 8
        cclose
        copen 8
    endfunction

endif
