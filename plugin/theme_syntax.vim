scriptencoding=utf-8
if !empty(glob('~/.vim/bundle/vim-airline/plugin/airline.vim'))
    "vim airline
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_powerline_fonts = 1 " 启用 powerline 字体
    let g:airline_theme='bubblegum'
    let g:airline_symbols.branch = ''
    let g:airline_symbols.notexists = ' '
    let g:airline_symbols.readonly = ''

    let g:airline#extensions#ale#error_symbol = ' '
    let g:airline#extensions#ale#warning_symbol = ' '
    let g:airline#extensions#ale#open_lnum_symbol = ' ➜ '
    let g:airline#extensions#ale#close_lnum_symbol = ''
    let g:airline_section_z =
                \ '%3p%%%#__accent_bold# ➜ %3l%#__restore__#%#__accent_bold#/%L%#__restore__# ➜ %3v'
    let g:airline#extensions#whitespace#trailing_format = 'trailing ➜ %s'

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#tab_nr_type = 2
    let g:airline_exclude_preview = 1
endif

if !empty(glob('~/.vim/bundle/rainbow_parentheses.vim/plugin/rainbow_parentheses.vim'))
    let g:rbpt_colorpairs = [
                \ ['brown',       'RoyalBlue3'],
                \ ['Darkblue',    'SeaGreen3'],
                \ ['darkgray',    'DarkOrchid3'],
                \ ['darkgreen',   'firebrick3'],
                \ ['darkcyan',    'RoyalBlue3'],
                \ ['darkred',     'SeaGreen3'],
                \ ['darkmagenta', 'DarkOrchid3'],
                \ ['brown',       'firebrick3'],
                \ ['gray',        'RoyalBlue3'],
                \ ['darkmagenta', 'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['darkgreen',   'RoyalBlue3'],
                \ ['darkcyan',    'SeaGreen3'],
                \ ['darkred',     'DarkOrchid3'],
                \ ['red',         'firebrick3'],
                \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces

endif

if !empty(glob('~/.vim/bundle/indentLine/after/plugin/indentLine.vim'))
    " " Vim
    let g:indentLine_color_term = 239

    " " GVim
    " let g:indentLine_color_gui = '#A4E57E'

    " none X terminal
    let g:indentLine_color_tty_light = 7 " (default: 4)
    let g:indentLine_color_dark = 1 " (default: 2)


    let g:indentLine_char_list = ['|', '¦', '┆', '┊']

    let g:indentLine_enabled = 1
endif

if !empty(glob('~/.vim/bundle/vim-bookmarks/plugin/bookmark.vim'))
    " highlight BookmarkSign ctermbg=NONE ctermfg=160
    " highlight BookmarkLine ctermbg=194 ctermfg=NONE

    let g:bookmark_sign = '♥'
    let g:bookmark_highlight_lines = 0

    let g:bookmark_location_list = 1
    let g:bookmark_auto_save = 1
    let g:bookmark_auto_close = 1
    let g:bookmark_disable_ctrlp = 1
    let g:bookmark_save_per_working_dir = 1
    let g:bookmark_auto_save_file = expand('~/.cache/vim-bookmarks')

    let g:bookmark_no_default_key_mappings = 1

    function! BookmarkMapKeys()
        nmap <leader>ma :BookmarkToggle<CR>
        nmap <leader>mi :BookmarkAnnotate<CR>
        nmap m] :BookmarkNext<CR>
        nmap m[ :BookmarkPrev<CR>
        nmap <leader>ms :BookmarkShowAll<CR>
        nmap <leader>mc :BookmarkClear
        nmap <leader>mx :BookmarkClearAll
        nmap <leader>mkk :BookmarkMoveUp<CR>
        nmap <leader>mjj :BookmarkMoveDown<CR>
    endfunction
    function! BookmarkUnmapKeys()
        unmap <leader>ms
        unmap <leader>mi
        unmap m[
        unmap m]
        unmap <leader>ma
        unmap <leader>mc
        unmap <leader>mx
        unmap <leader>mkk
        unmap <leader>mjj
    endfunction
    autocmd BufEnter * :call BookmarkMapKeys()
    autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
endif

if !empty(glob('~/.vim/bundle/vim-easy-align/plugin/easy_align.vim'))
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap <leader>ea <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap <leader>ea <Plug>(EasyAlign)

    " /后面加文本
    xmap <tab> :Tab<space>/

    " vim-table-mode
    noremap <leader>tm :TableModeToggle<CR>
endif

if !empty(glob('~/.vim/bundle/nerdtree/plugin/NERD_tree.vim'))
    " Nerd Tree
    let NERDChristmasTree=0
    let NERDTreeWinSize=30
    let NERDTreeChDirMode=2
    let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
    let NERDTreeShowBookrarks=1
    let NERDTreeWinPos="left"
    " synchronize
    let g:nerdtree_tabs_synchronize_view = 1
    let g:nerdtree_tabs_synchronize_focus = 1
    let g:nerdtree_tabs_open_on_console_startup=0

endif

if !empty(glob("~/.vim/bundle/vista.vim/plugin/vista.vim"))
    function! NearestMethodOrFunction() abort
        return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}
    " If you want to show the nearest function in your statusline automatically,
    " you can add the following line to your vimrc
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
    " How each level is indented and what to prepend.
    " e.g., more compact: ["▸ ", ""]
    " Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

    " Executive used when opening vista sidebar without specifying it.
    " See all the avaliable executives via `:echo g:vista#executives`.
    let g:vista_default_executive = 'ctags'

    " Set the executive for some filetypes explicitly. Use the explicit executive
    " instead of the default one for these filetypes when using `:Vista` without
    " specifying the executive.
    let g:vista_executive_for = {
                \ 'cpp': 'coc.nvim',
                \ 'php': 'coc.nvim',
                \ }

    " Declare the command including the executable and options used to generate ctags output
    " for some certain filetypes.The file path will be appened to your custom command.
    " For example:
    let g:vista_ctags_cmd = {
                \ 'haskell': 'hasktags -x -o - -c',
                \ }

    " To enable fzf's preview window set g:vista_fzf_preview.
    " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
    " For example:
    let g:vista_fzf_preview = ['right:50%']
    " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
    let g:vista#renderer#enable_icon = 1

    " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
    let g:vista#renderer#icons = {
                \   "function": "\uf794",
                \   "variable": "\uf71b",
                \  }
endif

if !empty(glob('~/.vim/bundle/vim-autoformat/plugin/autoformat.vim'))

endif
