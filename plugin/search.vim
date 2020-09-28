if !empty(glob('~/.vim/bundle/LeaderF/plugin/leaderf.vim'))
    let g:Lf_ShortcutF = '<c-p>'
    " noremap <m-p> :LeaderfFunction!<cr>
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    let g:Lf_PreviewInPopup = 1

    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git', '.ccls']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_GtagsAutoGenerate = 0
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand('~/.cache')
    let g:Lf_ShowRelativePath = 0
    let g:Lf_HideHelp = 1
    let g:Lf_StlColorscheme = 'gruvbox_material'
    let g:Lf_PreviewResult = {
            \ 'File': 0,
            \ 'Buffer': 0,
            \ 'Mru': 0,
            \ 'Tag': 0,
            \ 'BufTag': 0,
            \ 'Function': 1,
            \ 'Line': 0,
            \ 'Colorscheme': 0,
            \ 'Rg': 1,
            \ 'Gtags': 1
            \}

    let g:Lf_Gtagsconf = expand('~/.local/share/gtags/gtags.conf')
    let g:Lf_Gtagslabel = 'native-pygments'

    let g:Lf_NormalMap = {
                \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
                \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
                \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
                \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
                \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
                \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
                \ }

    nnoremap <space>lf :Leaderf<space>
    nnoremap <silent><nowait> <space>lj  :Leaderf --next<CR>
    nnoremap <silent><nowait> <space>lk  :Leaderf --previous<CR>
    nnoremap <silent><nowait> <space>lp  :Leaderf --recall<CR>
    nnoremap <space>gr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
    nnoremap <space>gd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>

endif

if !empty(glob('~/.vim/bundle/ctrlsf.vim/plugin/ctrlsf.vim'))
    nmap <leader>cf <Plug>CtrlSFPrompt
    let g:ctrlsf_position = 'left'
    let g:ctrlsf_selected_line_hl = 'op'
    let g:ctrlsf_winsize = '30%'
    let g:ctrlsf_auto_close = {"normal":0,"compact":0}

    function! g:CtrlSFAfterMainWindowInit()
        setl wrap
    endfunction
endif


" Skywind Preview
if !empty(glob('~/.vim/bundle/vim-preview/plugin/preview.vim'))
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

    noremap  <m-U>      :PreviewScroll           -1<cr>
    noremap  <m-D>      :PreviewScroll           +1<cr>
    inoremap <m-U>      <c-\><c-o>:PreviewScroll -1<cr>
    inoremap <m-D>      <c-\><c-o>:PreviewScroll +1<cr>
    noremap  <c-w><c-]> :PreviewSignature!<cr>
    noremap  <c-w>t     :PreviewGoto             tabe<cr>
    noremap  <C-]>      :PreviewTag<cr>
    noremap  <C-\>      :PreviewClose<cr>
endif

