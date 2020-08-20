if !empty(glob('~/.vim/bundle/LeaderF/plugin/leaderf.vim'))
    let g:Lf_ShortcutF = '<c-p>'
    " noremap <m-p> :LeaderfFunction!<cr>
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    let g:Lf_PreviewInPopup = 1

    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand('~/.cache')
    let g:Lf_ShowRelativePath = 0
    let g:Lf_HideHelp = 1
    let g:Lf_StlColorscheme = 'airline'
    let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
    nmap <leader>rg :Leaderf! rg<space>-e<space>
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

if !empty(glob('~/.vim/bundle/vim-gutentags/plugin/gutentags.vim'))
    let g:gutentags_define_advanced_commands = 1
    " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
    let g:gutentags_project_root = ['.root', '.ccls', '.clang_complete']
    let g:gutentags_add_default_project_roots = 0

    " notags标志与.root标志同时存在时生效
    let g:gutentags_exclude_project_root = ['.notags']

    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'

    " 同时开启 ctags 和 gtags 支持：
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

    let g:gutentags_plus_nomap = 1
    " Configure gutentags

    let $GTAGSLABEL = 'native-pygments'
    " let $GTAGSCONF = expand('~/.local/share/gtags/gtags.conf')

endif
