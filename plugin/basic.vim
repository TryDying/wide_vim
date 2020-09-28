set clipboard+=unnamedplus
set cursorline
" set cursorcolumn
set noeb vb t_vb=   " 关闭响铃
let mapleader = ","
set hidden
set backspace=2   " Backspace deletes like most programs in insert mode
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" don't give |ins-completion-menu| messages.
set shortmess+=c
set pumheight=9
set noswapfile
set history=500
set ruler         " show the cursor position all the time
set signcolumn=yes " always show signcolumns
set noshowmode
set showcmd       " display incomplete commands
set cmdheight=1
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set confirm       " Need confrimation while exit
set fileencodings=utf-8,gb18030,gbk,big5
set fdm=indent
set fdl=99
set ignorecase
set smartcase
set hlsearch
set mouse=a
set guifont=Monaco\ 12.5
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set t_Co=256
set splitbelow
set splitright
set termguicolors
" colorscheme dracula
colorscheme molokai

" highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
set textwidth=80
set colorcolumn=+1
set nu
set rnu
set numberwidth=5
set splitbelow
set splitright
set timeoutlen=350
set guioptions-=T
set guioptions-=L
set autochdir
set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.
"open buf in new tab
set switchbuf+=usetab,newtab
" set ssop=blank,buffers,curdir,folds,help,options
set tags=./.tags;,.tags

map K :tabnext<cr>
map J :tabprev<cr>
let g:last_active_tab = 1
autocmd TabLeave * let g:last_active_tab = tabpagenr()
nnoremap <C-t> :tabnew<cr>
inoremap <C-t> <ESC>:tabnew<CR>

nmap <F3> :Autoformat<CR>
vmap <F3> :Autoformat<CR>
nmap <F4> :ALEToggle<CR>
" nmap <F4> :call CocAction('diagnosticToggle')<cr>
" nmap <F5> :NERDTreeTabsToggle<cr>
" nmap <F6> :Vista!!<cr>
nnoremap <leader>` <c-^>
map <leader><space> :FixWhitespace<cr>

" help
nmap H :execute "tab h " . expand("<cword>")<cr>
vmap H y:tab h <C-R>=escape(@",'/\')<cr><cr>
" search visualed text
vnoremap // y/\V<C-R>=escape(@",'/\')<cr><cr>
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Maps move
imap <c-h> <bs>
noremap 0 ^
noremap ^ 0
inoremap fd  <esc>l
inoremap <m-q> <esc>l
nnoremap <m-q> <esc>
nnoremap \ %
vnoremap \ %

" INSERT MODE EDIT
imap <C-u> <C-o>d^
imap <C-k> <C-o>d$
imap <C-d> <Del>
imap <C-h> <BS>
imap <M-d> <C-o>de

" INSERT MODE MOTION
inoremap <C-a> <Home>
inoremap <m-e> <C-o>A
inoremap <M-f> <Esc>ea
inoremap <M-b> <Esc>bi
inoremap <M-o> <C-o>o
inoremap <M-O> <C-o>O
inoremap <M-k> <up>
inoremap <M-j> <down>
inoremap <M-l> <right>
inoremap <M-h> <left>

tnoremap <m-Q> <c-\><c-n>:q!<cr>
nnoremap <m-Q> :q!<cr>
tnoremap <m-J> <c-\><c-n><c-w>j
tnoremap <m-K> <c-\><c-n><c-w>k
tnoremap <m-L> <c-\><c-n><c-w>l
tnoremap <m-H> <c-\><c-n><c-w>h
nnoremap <m-J> <c-w>j
nnoremap <m-K> <c-w>k
nnoremap <m-L> <c-w>l
nnoremap <m-H> <c-w>h

nnoremap <c-x> :q<CR>
"
nmap -hl :nohlsearch<cr>
nmap +hl :set hlsearch<cr>

" winsize
noremap <c-left>  <c-w><
noremap <c-right> <c-w>>
noremap <c-down>  <c-w>-
noremap <c-up>    <c-w>+

" tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
nnoremap <leader>w  :w<CR>
nnoremap <leader>q  :q<CR>
