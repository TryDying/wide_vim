set nocompatible
filetype off

call plug#begin('~/.vim/bundle')

" Develop
Plug 'jpalardy/vim-slime'
Plug 'machakann/vim-sandwich' "surround edit
Plug 'tpope/vim-repeat'
Plug 'dense-analysis/ale'
Plug 'skywind3000/vim-terminal-help'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'dyng/ctrlsf.vim'
Plug 'Yggdroot/LeaderF'
Plug 'puremourning/vimspector', {'do':'./install_gadget.py --enable-c
            \ --enable-python --enable-go',
            \ 'for':['c', 'cpp', 'python', 'go']}

" Edit Support
Plug 'scrooloose/nerdcommenter'
Plug 'Lokaltog/vim-easymotion'
Plug 'unblevable/quick-scope'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Chiel92/vim-autoformat'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-expand-region'
Plug 'markonm/traces.vim'  " View replace
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'

" Filetype Syntax
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim',              { 'for':'html'}
Plug 'vim-scripts/openscad.vim' ,    { 'for':['scad']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for':'markdown'}
Plug 'mzlogin/vim-markdown-toc'
Plug 'shime/vim-livedown',           { 'for':['html','javascript','css']}
Plug 'dhruvasagar/vim-table-mode',   { 'for': ['text', 'markdown'] }

" UI
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'liuchengxu/vista.vim'
Plug '~/.vim/bundle/vim-ctrlspace'
Plug 'skywind3000/vim-preview'
Plug 'skywind3000/vim-quickui'
Plug 'liuchengxu/vim-which-key', {'on': ['WhichKey', 'WhichKey!']}
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/vim-peekaboo'        " view registers
Plug 'ryanoasis/vim-devicons'       " view contents of registers
Plug 'kshenoy/vim-signature'        " show marks
Plug 'kien/rainbow_parentheses.vim' " enhance pairs's color

" vimwiki,个人笔记;calendar管理
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'


call plug#end()
filetype plugin indent on
runtime ftplugin/man.vim
