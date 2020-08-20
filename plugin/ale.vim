if !empty(glob('~/.vim/bundle/ale/plugin/ale.vim'))
    " configure syntastic syntax checking to check on open as well as save
    let g:ale_sign_column_always         = 1
    let g:ale_set_highlights             = 1
    " let g:ale_sign_error                 = '✗'
    let g:ale_sign_error                 = ''
    let g:ale_sign_warning               = '!'
    let g:airline#extensions#ale#enabled = 1
    let g:ale_set_localist               = 1
    let g:ale_set_quickfix               = 0
    let g:ale_open_list                  = 0
    let g:ale_keep_list_window_open      = 0
    let g:ale_lint_on_enter              = 0
    let g:ale_lint_on_save               = 1

    let g:ale_disable_lsp = 1

    " let g:ale_completion_enabled         = 0

    hi! clear SpellBad
    hi! clear SpellCap
    hi! clear SpellRare
    hi! SpellBad gui=undercurl guisp=red
    hi! SpellCap gui=undercurl guisp=blue
    hi! SpellRare gui=undercurl guisp=magenta

    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)

    " " 启用某种语法检查
    if empty(glob('~/.vim/bundle/coc.nvim/plugin/coc.vim'))
        let g:ale_linters = {'c':'clang'}
        let g:ale_linters = {'c++':'clang++'}
    endif

    let g:ale_pattern_options = {
                \   '.*\.json$': {'ale_enabled': 0},
                \   '.md': {'ale_enabled': 0},
                \}
endif
