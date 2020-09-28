if has('nvim')
    autocmd TermOpen * setlocal conceallevel=0 colorcolumn=1 nonu nornu
    let g:neoterm_autoscroll = 1
else
    autocmd TerminalOpen * setlocal conceallevel=0 colorcolumn=1 nonu nornu
endif
autocmd BufEnter term://* startinsert

packadd termdebug
let g:termdebug_wide = 1
function! s:termdebug_map()
    silent call EasyMotion_UnMaps()
    nmap <m-c> :Clear<cr>
    nmap <m-i> :Step<cr>
    nmap <m-n> :Over<cr>
    nmap <m-r> :Continue<cr>
    nmap <m-o> :Finish<cr>
    nmap <m-b> :Break<cr>
    nmap <m-e> :Evaluate<cr>
    vmap <m-e> :Evaluate<cr>
endfunction

function! s:termdebug_unmap()
    nunmap <m-c>
    nunmap <m-i>
    nunmap <m-n>
    nunmap <m-r>
    nunmap <m-o>
    nunmap <m-b>
    nunmap <m-e>
    vunmap <m-e>
    silent call EasyMotion_Init_Maps()
endfunction

if has('nvim')
    augroup TermDebug
        autocmd!
        autocmd TermOpen gdb call <SID>termdebug_map()
        autocmd TermClose gdb call <SID>termdebug_unmap()
    augroup end
else
    augroup TermDebug
        autocmd!
        autocmd TerminalOpen gdb call <SID>termdebug_map()
        autocmd TerminalClose gdb call <SID>termdebug_unmap()
    augroup end

endif

hi debugPC term=reverse ctermbg=darkblue guibg=teal
hi debugBreakpoint term=reverse ctermbg=red guibg=grey



if !empty(glob('~/.vim/bundle/vim-slime/plugin/slime.vim')) && has('nvim')
    let g:slime_target = 'neovim'
    " let g:slime_target = 'tmux'

    let g:slime_no_mappings = 1
    let g:slime_paste_file = "$HOME/.cache/.slime_paste"

    function! Slime_initmap()
        if g:slime_terminal_num == 1
            nmap <c-c> <Plug>SlimeSendCell
            xmap <c-c> <Plug>SlimeRegionSend
            nmap <c-l> :SlimeSend<cr>
            inoremap <c-l> <esc>:SlimeSend<cr>a
        elseif g:slime_terminal_num == 0
            nunmap <c-c>
            xunmap <c-c>
            nunmap <c-l>
            iunmap <c-l>
        endif
    endfunction

    " autocmd Filetype python let g:slime_python_ipython = 0
    autocmd Filetype python let b:slime_cell_delimiter = "# %%"
    autocmd BufEnter * call InitSlime()
    let g:last_terminal_job_id = 0
    let g:cur_terminal_job_id  = 0
    let g:slime_terminal_num         = 0

    augroup Terminal
        autocmd!
        autocmd TermOpen * let g:slime_terminal_num+=1
        autocmd TermOpen * call Slime_initmap()
        autocmd TermOpen,TermEnter * setlocal statusline=%{b:terminal_job_id}\:%{b:term_title}
        autocmd TermOpen,TermEnter * call TerminalIN()
        autocmd TermOpen *ipython* let g:slime_python_ipython = 1
        autocmd TermClose * call TerminalOUT()
        autocmd TermClose * let g:slime_terminal_num-=1
        autocmd TermClose *ipython* unlet g:slime_python_ipython
        autocmd TermClose * call Slime_initmap()
    augroup END

    function! Splite_IPython()
        " vsplit|terminal ipython -i %
        execute '12split | enew | terminal ipython -i ' . bufname("%")
        execute 'normal!' . "\<c-w>p"
    endfunction

    function! Vsplit_IPython()
        " vsplit|terminal ipython -i %
        execute '65vsplit | enew | terminal ipython -i ' . bufname("%")
        execute 'normal!' . "\<c-w>p"
    endfunction

    function! InitSlime()
        if g:cur_terminal_job_id
            let b:slime_config = {"jobid": g:cur_terminal_job_id}
        endif
    endfunction

    function! TerminalIN()
        if g:cur_terminal_job_id != b:terminal_job_id
            let g:last_terminal_job_id = g:cur_terminal_job_id
            let g:cur_terminal_job_id = b:terminal_job_id
        endif
    endfunction

    function! TerminalOUT()
        let g:cur_terminal_job_id = g:last_terminal_job_id
        let g:last_terminal_job_id = 0
    endfunction

endif

if !empty(glob('~/.vim/bundle/vimspector/plugin/vimspector.vim'))

    let g:vimspector_terminal_minwidth = 20
    let g:vimspector_sidebar_width     = 35
    let g:vimspector_bottombar_height  = 8
    let g:vimspector_code_minwidth     = 90

    function! s:read_template_into_buffer(template)
        execute '0r ~/.config/nvim/config/vimspector/'.a:template
    endfunction
    function! s:vimspector_create_config()
        if !filereadable('.vimspector.json')
            tabe .vimspector.json | LoadVimSpectorJsonTemplate
        else
            tabe .vimspector.json
        endif
    endfunction
    command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
                \   'source': 'ls -1 ~/.config/nvim/config/vimspector',
                \   'down': 10,
                \   'sink': function('<sid>read_template_into_buffer')
                \ })
    noremap <leader>ecs :call <sid>vimspector_create_config()<cr>
    sign define vimspectorBP text=☛ texthl=Normal
    sign define vimspectorBPDisabled text=☞ texthl=Normal

    function! s:CustomiseUI()
        " Customise the basic UI...
        " Close the output window
        " call win_gotoid( g:vimspector_session_windows.output )
    endfunction

    function s:InitTerminal()
        " Customise the terminal window size/position
        " For some reasons terminal buffers in Neovim have line numbers
        " call win_gotoid( g:vimspector_session_windows.terminal )
        set norelativenumber nonumber
        windo set wrap
    endfunction

    augroup MyVimspectorUICustomistaion
        autocmd!
        autocmd User VimspectorUICreated call s:CustomiseUI()
        autocmd User VimspectorTerminalOpened call s:InitTerminal()
    augroup END

    " Exit SpectorUI
    function! SpectorExit()
        nunmap <m-b>
        nunmap <m-B>
        nunmap <m-r>
        nunmap <m-f>
        nunmap <m-n>
        nunmap <m-i>
        nunmap <m-o>
        nunmap <m-w>
        nunmap <m-e>
        silent call EasyMotion_Init_Maps()
        call vimspector#Stop()
        call vimspector#Reset()
    endfunction

    function! SetUpTerminal()
        silent call EasyMotion_UnMaps()
        silent call vimspector#Reset()
        silent call vimspector#Continue()
        nmap <m-b> <Plug>VimspectorToggleBreakpoint
        nmap <m-f> <Plug>VimspectorAddFunctionBreakpoint
        nmap <m-r> <Plug>VimspectorContinue
        nmap <m-B> <Plug>VimspectorToggleConditionalBreakpoint
        nmap <m-n> <Plug>VimspectorStepOver
        nmap <m-i> <Plug>VimspectorStepInto
        nmap <m-o> <Plug>VimspectorStepOut
        nmap <m-w> :VimspectorWatch<space>
        nmap <m-e> :VimspectorEval<space>
    endfunction

endif

