if 0
    if !empty(glob('~/.vim/bundle/quickmenu.vim/autoload/quickmenu.vim'))
        " enable cursorline (L) and cmdline help (H)
        let g:quickmenu_options = "LH"

        " clear all the items
        call g:quickmenu#reset()

        " bind to map_key
        noremap <silent><space><space> :call quickmenu#toggle(0)<cr>
        " 打印
        command Paps !paps % | ps2pdf - %:r.pdf

        " new section
        call quickmenu#append("# LeaderF", '')
        call quickmenu#append("Function List", "LeaderfFunction", "Open function list")
        call quickmenu#append("Mru List", "LeaderfMru", "Open Mru list")
        call quickmenu#append("Tag List", "LeaderfTag", "Open Tag list")
        call quickmenu#append("LeaderF &Rg", 'Leaderf rg', 'Leaderf Grep')

        " doxygen
        call quickmenu#append("# Doxygen", '')
        call quickmenu#append("DoxAuthor", "DoxAuthor", "DoxAuthor")

        " new section
        call quickmenu#append("# Git", '')
        " use fugitive to show diff
        call quickmenu#append("git diff", 'Gvdiff', "use fugitive's Gvdiff on current document")
        call quickmenu#append("git status", 'Gstatus', "use fugitive's Gstatus on current document")

        " new section
        call quickmenu#append("# Others", '')
        call quickmenu#append("Turn spell %{&spell? 'off':'on'}", "set spell!", "enable/disable spell check (:set spell!)")
        call quickmenu#append("Indent Line", "IndentLinesToggle", "enable/disable IndentLine")
        call quickmenu#append("Autoformat", "Autoformat", "Autoformat")
        call quickmenu#append("Ignore&case %{&ignorecase? 'OFF':'ON'}", 'set ignorecase!')
        call quickmenu#append("Paps","Paps","Use paps to print pdf")

    endif

    " SimpyFold
    let g:SimpylFold_docstring_preview=1

    " Gutentags replaced with LeaderF
    if !empty(glob('~/.vim/bundle/vim-gutentags/plugin/gutentags.vim'))
        let g:gutentags_define_advanced_commands = 1
        " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
        let g:gutentags_project_root = ['.root']
        let g:gutentags_add_default_project_roots = 0

        " notags标志与.root标志同时存在时生效
        let g:gutentags_exclude_project_root = ['.notags']

        " 所生成的数据文件的名称
        let g:gutentags_ctags_tagfile = '.tags'

        " 同时开启ctags gtags：
        let g:gutentags_modules = []
        if executable('gtags-cscope') && executable('gtags')
            let g:gutentags_modules += ['gtags_cscope']
        endif
        if executable('ctags')
            let g:gutentags_modules += ['ctags']
        endif


        " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
        let s:vim_tags = expand('~/.cache/tags')
        let g:gutentags_cache_dir = s:vim_tags

        " 配置 ctags 的参数
        let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
        let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
        let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

        " 检测 ~/.cache/tags 不存在就新建
        if !isdirectory(s:vim_tags)
            silent! call mkdir(s:vim_tags, 'p')
        endif

        " 如果使用 universal ctags 需要增加下面一行
        let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

        " 禁用 gutentags 自动加载 gtags 数据库
        let g:gutentags_auto_add_cscope = 1
        let g:gutentags_auto_add_gtags_cscope = 0

        let $GTAGSLABEL = 'native-pygments'
        let $GTAGSCONF = expand('~/.local/share/gtags/gtags.conf')

        " Configure gutentags
        let g:gutentags_plus_nomap = 1
    endif

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


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "                           quickui-old-config                            "
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


endif
