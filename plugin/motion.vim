if !empty(glob('~/.vim/bundle/vim-easymotion/plugin/EasyMotion.vim'))

    " EasyMotion
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    autocmd VimEnter * silent call EasyMotion_Init_Maps()
    let g:EasyMotion_do_mapping = 0

    function! EasyMotion_Init_Maps()
        nmap <m-n> <Plug>(easymotion-next)
        nmap <m-N> <Plug>(easymotion-prev)
        vmap <m-n> <Plug>(easymotion-next)
        vmap <m-N> <Plug>(easymotion-prev)
        " normal
        nnoremap <m-l> :call EasyMotion_Coc_NAction("l")<cr>
        nnoremap <m-j> :call EasyMotion_Coc_NAction("j")<cr>
        nnoremap <m-k> :call EasyMotion_Coc_NAction("k")<cr>
        nnoremap <m-.> :call EasyMotion_Coc_NAction(".")<cr>
        nnoremap <m-f> :call EasyMotion_Coc_NAction("f")<cr>
        nnoremap <m-F> :call EasyMotion_Coc_NAction("F")<cr>
        nnoremap <m-s> :call EasyMotion_Coc_NAction("s")<cr>
        nnoremap <m-e> :call EasyMotion_Coc_NAction("e")<cr>
        nnoremap <m-w> :call EasyMotion_Coc_NAction("w")<cr>
        nnoremap <m-b> :call EasyMotion_Coc_NAction("b")<cr>
        nnoremap <m-E> :call EasyMotion_Coc_NAction("E")<cr>
        nnoremap <m-W> :call EasyMotion_Coc_NAction("W")<cr>
        nnoremap <m-B> :call EasyMotion_Coc_NAction("B")<cr>
        nnoremap <space>jj :call EasyMotion_Coc_NAction("S")<cr>
        " visual
        vnoremap <m-j> <esc>:call EasyMotion_Coc_VAction("j")<cr>
        vnoremap <m-k> <esc>:call EasyMotion_Coc_VAction("k")<cr>
        vnoremap <m-.> <esc>:call EasyMotion_Coc_VAction(".")<cr>
        vnoremap <m-f> <esc>:call EasyMotion_Coc_VAction("f")<cr>
        vnoremap <m-F> <esc>:call EasyMotion_Coc_VAction("F")<cr>
        vnoremap <m-s> <esc>:call EasyMotion_Coc_VAction("s")<cr>
        vnoremap <m-e> <esc>:call EasyMotion_Coc_VAction("e")<cr>
        vnoremap <m-w> <esc>:call EasyMotion_Coc_VAction("w")<cr>
        vnoremap <m-b> <esc>:call EasyMotion_Coc_VAction("b")<cr>
        vnoremap <m-E> <esc>:call EasyMotion_Coc_VAction("E")<cr>
        vnoremap <m-W> <esc>:call EasyMotion_Coc_VAction("W")<cr>
        vnoremap <m-B> <esc>:call EasyMotion_Coc_VAction("B")<cr>
    endfunction

    function! EasyMotion_UnMaps()
        nunmap <m-n>
        nunmap <m-N>
        vunmap <m-n>
        vunmap <m-N>
        " normal
        nunmap <m-l>
        nunmap <m-j>
        nunmap <m-k>
        nunmap <m-.>
        nunmap <m-f>
        nunmap <m-F>
        nunmap <m-s>
        nunmap <m-e>
        nunmap <m-w>
        nunmap <m-b>
        nunmap <m-E>
        nunmap <m-W>
        nunmap <m-B>
        nunmap <space>jj
        " visua
        vunmap <m-j>
        vunmap <m-k>
        vunmap <m-.>
        vunmap <m-f>
        vunmap <m-F>
        vunmap <m-s>
        vunmap <m-e>
        vunmap <m-w>
        vunmap <m-b>
        vunmap <m-E>
        vunmap <m-W>
        vunmap <m-B>
    endfunctio


    function! EasyMotion_Coc_NAction(fn)
        silent CocDisable
        if a:fn ==# 'w'
            call EasyMotion#WB(0,0)
        elseif a:fn ==# 'b'
            call EasyMotion#WB(0,1)
        elseif a:fn ==# 'e'
            call EasyMotion#E(0,0)
        elseif a:fn ==# 's'
            call EasyMotion#S(2,0,2)
        elseif a:fn ==# 'S'
            call EasyMotion#S(1,0,2)
        elseif a:fn ==# 'f'
            call EasyMotion#S(1,0,0)
        elseif a:fn ==# 'F'
            call EasyMotion#S(1,0,1)
        elseif a:fn ==# 'l'
            call EasyMotion#overwin#line()
        elseif a:fn ==# 'j'
            call EasyMotion#JK(0,0)
        elseif a:fn ==# 'k'
            call EasyMotion#JK(0,1)
        elseif a:fn ==# '.'
            call EasyMotion#Repeat(0)
        elseif a:fn ==# 'W'
            call EasyMotion#WBW(0,0)
        elseif a:fn ==# 'E'
            call EasyMotion#EW(0,0)
        elseif a:fn ==# 'B'
            call EasyMotion#WBW(0,1)
        endif
        silent CocEnable
    endfunction

    function! EasyMotion_Coc_VAction(fn)
        silent CocDisable
        if a:fn ==# 'w'
            call EasyMotion#WB(1,0)
        elseif a:fn ==# 'b'
            call EasyMotion#WB(1,1)
        elseif a:fn ==# 'e'
            call EasyMotion#E(1,0)
        elseif a:fn ==# 's'
            call EasyMotion#S(2,1,2)
        elseif a:fn ==# 'f'
            call EasyMotion#S(1,1,0)
        elseif a:fn ==# 'F'
            call EasyMotion#S(1,1,1)
        elseif a:fn ==# 'j'
            call EasyMotion#JK(1,0)
        elseif a:fn ==# 'k'
            call EasyMotion#JK(1,1)
        elseif a:fn ==# '.'
            call EasyMotion#Repeat(1)
        elseif a:fn ==# 'W'
            call EasyMotion#WBW(1,0)
        elseif a:fn ==# 'E'
            call EasyMotion#EW(1,0)
        elseif a:fn ==# 'B'
            call EasyMotion#WBW(1,1)
        endif
        silent CocEnable
    endfunction
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !empty(glob('~/.vim/bundle/quick-scope/plugin/quick_scope.vim'))
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

    augroup qs_colors
        autocmd!
        autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
        autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
        nmap <m-p> <plug>(QuickScopeToggle)
        xmap <m-p> <plug>(QuickScopeToggle)
    augroup END

endif
