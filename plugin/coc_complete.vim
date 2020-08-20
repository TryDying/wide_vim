if !empty(glob('~/.vim/bundle/coc.nvim/plugin/coc.vim'))

    " extensions
    let g:coc_global_extensions = [
                \ 'coc-git',
                \ 'coc-go',
                \ 'coc-html',
                \ 'coc-java',
                \ 'coc-json',
                \ 'coc-marketplace',
                \ 'coc-prettier',
                \ 'coc-snippets',
                \ 'coc-tsserver',
                \ 'coc-actions',
                \ 'coc-css',
                \ 'coc-diagnostic',
                \ 'coc-syntax',
                \ 'coc-vimlsp',
                \ 'coc-yank',
                \ 'coc-lists',
                \ 'coc-python',
                \ 'coc-pairs'
                \]


    " Remap keys
    nmap <silent> <leader>gd <Plug>(coc-definition)
    nmap <silent> <leader>gD :call CocAction('jumpDefinition',"tabe")<cr>
    nmap <silent> <leader>gl <Plug>(coc-declaration)
    nmap <silent> <leader>gt <Plug>(coc-type-definition)
    nmap <silent> <leader>gi <Plug>(coc-implementation)
    nmap <silent> <leader>gr <Plug>(coc-references)
    nmap <silent> <leader>ga <Plug>(coc-refactor)
    nmap <silent> <leader>gn <Plug>(coc-rename)
    nmap <silent> <leader>gc :call <SID>show_documentation()<CR>

    " CocCommand
    xmap <leader>fm  <Plug>(coc-format-selected)
    nmap <leader>fm  <Plug>(coc-format)

    nmap <space>m  :CocCommand<space>
    vmap <space>m  :CocCommand<space>
    nmap <space>rn :CocCommand workspace.renameCurrentFile<cr>

    "Fix
    nmap <leader>fa  <Plug>(coc-fix-current)
    nmap <leader>fl  :CocFix<cr>

    " DocList
    nmap <silent> <c-k> <Plug>(coc-diagnostic-prev)
    nmap <silent> <c-j> <Plug>(coc-diagnostic-next)

    nnoremap <silent><nowait> <space>d  :CocList --normal diagnostics<cr>
    nnoremap <silent><nowait> <space>e  :CocList extensions<cr>
    nnoremap <silent><nowait> <space>c  :CocList commands<cr>
    nnoremap <silent><nowait> <space>o  :CocList outline<cr>
    nnoremap <silent><nowait> <space>s  :CocList -I symbols<cr>
    nnoremap <silent><nowait> <space>j  :CocNext<CR>
    nnoremap <silent><nowait> <space>k  :CocPrev<CR>
    nnoremap <silent><nowait> <space>p  :CocListResume<CR>
    nnoremap <silent><nowait> <space>y  :CocList -A --normal yank<cr>

    nnoremap <nowait><space>l  :<C-u>CocList<space>

    " snippet
    let g:coc_snippet_next = '<c-e>'
    let g:coc_snippet_prev = '<c-b>'
    " imap <C-e> <Plug>(coc-snippets-expand)

    " float windows scroll
    nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
    nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

    augroup mygroup
        autocmd!
        " Update signature help on jump placeholder
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        " Highlight symbol under cursor on CursorHold
        autocmd CursorHold * silent call CocActionAsync('highlight')
        " Autopairs
        autocmd FileType tex let b:coc_pairs = [["$", "$"]]
        autocmd FileType markdown let b:coc_pairs_disabled = ['`']
    augroup end

    " Status line
    let g:airline#extensions#coc#enabled = 1

    " Select Obj
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Select Range
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " trigger expand
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    inoremap <silent><expr> <c-space> pumvisible() ? coc#_select_confirm() :
                \"\<C-g>u"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Document
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction


endif
