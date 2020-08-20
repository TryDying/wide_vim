
" When Vim Start
augroup vimrcEx
    autocmd!
    autocmd BufReadPost *
                \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
    autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
    autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
    autocmd FileType python,markdown setlocal textwidth=0
    autocmd BufNewFile,BufRead *.js,*.html,*.css setlocal
                \ softtabstop=2
                \ tabstop=2
                \ shiftwidth=2
                \ textwidth=0
augroup END


" Echodoc
if !empty(glob('~/.vim/bundle/echodoc.vim/plugin/echodoc.vim'))
    if has('nvim')
        let g:echodoc#enable_at_startup = 1
    else
        " set noshowmode
        set cmdheight=2
        let g:echodoc_enable_at_startup = 1
    endif
endif

" html 相关
" Emmet
if !empty(glob('~/.vim/bundle/emmet-vim'))
    let g:user_emmet_mode='i' " enable for insert mode
endif
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" CtrlSpace
if !empty(glob('~/.vim/bundle/vim-ctrlspace/plugin/ctrlspace.vim'))
    " hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold
    " hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
    " hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
    " hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
    if has('nvim')
        let g:CtrlSpaceDefaultMappingKey = "<C-space> "
    endif
    " ctrlspace rootdir mark
    let g:CtrlSpaceProjectRootMarkers = ['.root', '.svn', '.git', '.hg','.ccls',
                \'.project','.clang_complete']
endif


" Configure markdown
let g:vim_markdown_folding_disable = 0
let g:vim_markdown_math = 1 "支持LaTex math"
" highlight code
let g:markdown_fenced_languages = ['css', 'js=javascript']
set conceallevel=2
" Markdown Preview
if !empty(glob('~/.vim/bundle/markdown-preview.nvim/plugin/mkdp.vim'))
    let g:mkdp_auto_start = 0
    let g:mkdp_auto_close = 0
    " set to 1, preview server available to others in your network
    let g:mkdp_open_to_the_world = 0
    let g:mkdp_open_ip = '127.0.0.1'
    let g:mkdp_port = '10088'
    let g:mkdp_browser = "google-chrome-stable"
    " options for markdown render
    " mkit: markdown-it options for render
    " katex: katex options for math
    " uml: markdown-it-plantuml options
    " maid: mermaid options
    " disable_sync_scroll: if disable sync scroll, default 0
    " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
    "   middle: mean the cursor position alway show at the middle of the preview page
    "   top: mean the vim top viewport alway show at the top of the preview page
    "   relative: mean the cursor position alway show at the relative positon of the preview page
    " hide_yaml_meta: if hide yaml metadata, default is 1
    " sequence_diagrams: js-sequence-diagrams options
    " content_editable: if enable content editable for preview page, default: v:false
    let g:mkdp_preview_options = {
                \ 'mkit': {},
                \ 'katex': {},
                \ 'uml': {},
                \ 'maid': {},
                \ 'disable_sync_scroll': 0,
                \ 'sync_scroll_type': 'middle',
                \ 'hide_yaml_meta': 1,
                \ 'sequence_diagrams': {},
                \ 'flowchart_diagrams': {},
                \ 'content_editable': v:false
                \ }
    " use a custom markdown style must be absolute path
    " like '/Users/username/markdown.css' or expand('~/markdown.css')
    let g:mkdp_markdown_css = ''
    " use a custom highlight style must absolute path
    " like '/Users/username/highlight.css' or expand('~/highlight.css')
    let g:mkdp_highlight_css = ''
    " ${name} will be replace with the file name
    let g:mkdp_page_title = '「${name}」'
endif

" Snippets
let g:snips_author = 'trydying'
let g:snips_email = 'trydying@mail.ustc.edu.cn'
let g:snips_github = 'https://github.com/trydying'

"Nerd Commenter
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" visual-multi
if !empty(glob('~/.vim/bundle/vim-visual-multi/plugin/visual-multi.vim'))
    let g:VM_default_mappings = 0
    let g:VM_maps = {}
    let g:VM_maps["Add Cursor Down"]    = '<M-down>'   " new cursor down
    let g:VM_maps["Add Cursor Up"]      = '<M-up>'   " new cursor up
endif

" Terminal
if !empty(glob('~/.vim/bundle/vim-terminal-help/plugin/terminal_help.vim'))
    let g:terminal_height = 12
endif

" Skywind Preview
if !empty(glob('~/.vim/bundle/vim-preview/plugin/preview.vim'))
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

    noremap  <m-u>      :PreviewScroll           -1<cr>
    noremap  <m-d>      :PreviewScroll           +1<cr>
    inoremap <m-u>      <c-\><c-o>:PreviewScroll -1<cr>
    inoremap <m-d>      <c-\><c-o>:PreviewScroll +1<cr>
    noremap  <c-w><c-]> :PreviewSignature!<cr>
    noremap  <c-w>t     :PreviewGoto             tabe<cr>
    noremap  <C-]>      :PreviewTag<cr>
    noremap  <C-\>      :PreviewClose<cr>
endif

" Vimwiki
" need pip install vimwiki-markdown
if !empty(glob('~/.vim/bundle/vimwiki/plugin/vimwiki.vim'))
    let wide_wiki = {}
    let wide_wiki.name = 'TryDying'
    let wide_wiki.path = '~/.wide_wiki'
    let wide_wiki.path_html = '~/.wide_wiki_html'
    let wide_wiki.auto_toc = 1
    " for markdown
    let wide_wiki.template_path = '~/.vimwiki/templates/'
    let wide_wiki.template_default = 'default'
    let wide_wiki.syntax = 'markdown'
    let wide_wiki.ext = '.md'
    let wide_wiki.custom_wiki2html = 'vimwiki_markdown'
    let wide_wiki.template_ext = '.tpl'

    let g:vimwiki_list = [wide_wiki]

    let g:vimwiki_hl_cb_checked = 1
    let g:vimwiki_camel_case    = 0
    let g:vimwiki_CJK_length    = 1
    let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
    " let g:vimwiki_listsyms = '✗○◐●✓'
    let g:vimwiki_listsyms = ' ○◐●✓'
    let g:vimwiki_global_ext = 0

    "generate diary links
    command! Diary VimwikiDiaryIndex
    augroup vimwikigroup
        autocmd!
        " automatically update links on read diary
        autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
    augroup end



endif
