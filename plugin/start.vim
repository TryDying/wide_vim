if !empty(glob('~/.vim/bundle/vim-quickui/plugin/quickui.vim'))
    " let g:quickui_color_scheme = 'grubvbox'
    let g:quickui_color_scheme = 'solarized'
    " let g:quickui_color_scheme = 'papercol dark'
    " let g:quickui_color_scheme = 'papercol light'

    let g:quickui_preview_w = 100
    let g:quickui_preview_h = 15

    call quickui#menu#reset()

    call quickui#menu#install("&File", [
                \ [ "&Open\t(:w)", 'call feedkeys(":tabe ")'],
                \ [ "&Save\t(:w)", 'write'],
                \ [ "--", ],
                \ [ "LeaderF &Function", 'LeaderfFunction ', 'Search function'],
                \ [ "LeaderF &Mru", 'Leaderf mru --regexMode', 'Open recently accessed files'],
                \ [ "LeaderF &Buffer", 'Leaderf buffer', 'List current buffers in leaderf'],
                \ [ "LeaderF &Tag", 'LeaderfTag', 'List tag in tag files '],
                \ [ "LeaderF &Rg", 'Leaderf rg', 'Leaderf Grep'],
                \ ["--",],
                \ [ "&Paps","!paps % | ps2pdf - %:r.pdf","Use paps to print pdf" ],
                \ ["&VimwikiAll2HTML", "VimwikiAll2HTML",''],
                \ ["--",],
                \ ["Bookmarks &Clean", "BookmarkClearAll", ""],
                \ ])


    call quickui#menu#install("&File", [
                \ [ "--", ],
                \ [ "E&xit", 'qa' ],
                \ ])

    call quickui#menu#install("&Edit", [
                \ [ "&Edit Snippets", 'CocCommand snippets.editSnippets ', ''],
                \ ["--",],
                \ ["Auto&Format", "Autoformat", "Autoformat"],
                \ ])

    call quickui#menu#install('&Symbol', [
                \ [ "Find &Definition\t(GNU Global)", 'execute "GscopeFind g " . expand("<cword>")', ''],
                \ [ "Find Declaration&0\t(GNU Global)", 'execute "GscopeFind a " . expand("<cword>")', ''],
                \ [ "S&ymbol References\t(GNU Global)", 'execute "GscopeFind s " . expand("<cword>")', ''],
                \ [ "Function &References\t(GNU Global)", 'execute "GscopeFind c " . expand("<cword>")', ''],
                \ [ "&Find Symbol\t(GNU Global)", 'execute "GscopeFind e " . expand("<cword>")', ''],
                \ [ "Jump &into Header\t(GNU Global)", 'execute "GscopeFind f " . expand("<cfile>")', ''],
                \ [ "Jump &out Header\t(GNU Global)", 'execute "GscopeFind i " . expand("<cfile>")', ''],
                \ [ "&Vdefi\t(Coc.nvim)", "call CocAction('jumpDefinition','vsplit')", ''],
                \ [ "&Sdefi\t(Coc.nvim)", "call CocAction('jumpDefinition','split')", ''],
                \ ])

    call quickui#menu#install('&Move', [
                \ ])

    call quickui#menu#install("&Debug", [
                \ ["&EditSpectorConfig",'exec "normal ,te"','Edit Spector Config'],
                \ ["-"],
                \ ["&Start",'call SetUpTerminal()','start or continue debug'],
                \ ["List &BreakPoint",'call vimspector#ListBreakpoints()','ListBreakpoints'],
                \ ["-"],
                \ ["Spector&Restart","silent call vimspector#Restart()", 'Reset spector'],
                \ ["StopDebug&Q",'silent call SpectorExit()','Stop'],
                \ ["SpectorReset&0\t","silent call vimspector#Reset()", 'Reset spector'],
                \ ["-"],
                \ ['Term&Debug', 'Termdebug', ],
                \ ])

    call quickui#menu#install("&Git", [
                \ ["git &diff", 'Gvdiff', "use fugitive's Gvdiff on current document"],
                \ ["git &status", 'Gstatus', "use fugitive's Gstatus on current document"],
                \ ])


    call quickui#menu#install('&Tools', [
                \ ['Display &Messages', 'call quickui#tools#display_messages()', ],
                \ ['--',''],
                \ ["&Indent Line", "IndentLinesToggle", "enable/disable IndentLine"],
                \ ['&Spell %{&spell? "Disable":"Enable"}', 'set spell!', 'Toggle spell check %{&spell? "off" : "on"}'],
                \ ["&Relative number %{&relativenumber? 'OFF':'ON'}", 'set relativenumber!'],
                \ ["Ignore&case %{&ignorecase? 'OFF':'ON'}", 'set ignorecase!'],
                \ ["&Termguicolor %{&termguicolors? 'OFF':'ON'}", 'set termguicolors!'],
                \ ])

    call quickui#menu#install('&Plugin', [
                \ ["&NERDTree\t<F5>", 'NERDTree', 'open nerdtree'],
                \ ["&Tagbar\t<F6>", 'Vista', 'Start Vista'],
                \ ["-"],
                \ [ "&Diagnostics", 'CocDiagnostics', ''],
                \ ["-"],
                \ ["Display &Calendar", "CalendarT", "display a calender"],
                \ ["--"],
                \ ["Plugin &Update", "PlugUpdate", "Update plugin"],
                \ ])

    call quickui#menu#install('Help (&?)', [
                \ ["&Index", 'tab help index', ''],
                \ ['Ti&ps', 'tab help tips', ''],
                \ ['--',''],
                \ ["&Tutorial", 'tab help tutor', ''],
                \ ['&Quick Reference', 'tab help quickref', ''],
                \ ['&Summary', 'tab help summary', ''],
                \ ['--',''],
                \ ['&Vim Script', 'tab help eval', ''],
                \ ['&Function List', 'tab help function-list', ''],
                \ ], 10000)

    let g:quickui_show_tip = 1

    "----------------------------------------------------------------------
    " context menu
    "----------------------------------------------------------------------
    let g:context_menu_k = [
                \ ['I&Python', "call Splite_IPython()", ''],
                \ ['VsIpython', "call Vsplit_IPython()", ''],
                \ ['&QuickfixToggle', "call ToggleQf()", ''],
                \ ['&LocalfixToggle', "call Location_toggle()", ''],
                \ ["&NERDTreeToggle", 'NERDTreeTabsToggle', 'toggle nerdtree'],
                \ ["&VistaToggle", 'Vista!!', 'toggle vista'],
                \ ["Ctrl&SFToggle", 'CtrlSFToggle', 'toggle ctrlsf'],
                \ ["&DiagnosticsToggle", "call CocAction('diagnosticToggle')"],
                \ ["&Markdown Preview", "MarkdownPreview"],
                \ ['P&ython Doc', 'call quickui#tools#python_help("")', 'python'],
                \ ]


    "----------------------------------------------------------------------
    " hotkey
    "----------------------------------------------------------------------
    " augroup MyQuickfixPreview
    " au!
    " au FileType qf noremap <silent><buffer> p :call quickui#tools#preview_quickfix()<cr>
    " augroup END

    nnoremap <silent> <space><space> :call quickui#menu#open()<cr>

    nnoremap <silent>M :call quickui#tools#clever_context('k', g:context_menu_k, {})<cr>
endif

" Toggle List
function! ToggleQf()
    for buffer in tabpagebuflist()
        if bufname(buffer) == ''
            " then it should be the quickfix window
            cclose
            return
        endif
    endfor
    copen
endfunction

nnoremap <m--> :call ToggleQf()<cr>
nnoremap <m-0> :call Location_toggle()<cr>

function! s:BufferCount() abort
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
function! Location_toggle()
    let buffer_count_before = s:BufferCount()
    silent! lclose
    silent! lclose
    if s:BufferCount() == buffer_count_before
        lopen
    endif
endfunction

au FileType localtio call AdjustWindowHeight_Lo(3, 10)
function! AdjustWindowHeight_Lo(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

if !empty(glob('~/.vim/bundle/vim-which-key/plugin/which_key.vim'))
    "whichkey
    " nnoremap <silent> <leader>      :WhichKey ','<CR>

    autocmd! User vim-which-key call which_key#register('<space>', 'g:which_key_map')

    nnoremap <silent> <leader><leader> :WhichKey ','<CR>
    vnoremap <silent> <leader><leader> :WhichKeyVisual ','<CR>


    nnoremap <silent> <space><leader> :WhichKey '<space>'<CR>
    vnoremap <silent> <space><leader> :WhichKeyVisual '<space>'<CR>

    let g:which_key_map =  {}
    let g:which_key_map.b = {
                \ 'name': '+buffer',
                \ }

    let g:which_key_map.f = { 'name' : '+file' }

endif

