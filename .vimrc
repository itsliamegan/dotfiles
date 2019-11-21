" Start the pathogen plugin manager
execute pathogen#infect()

" Disable legacy vi compatibility and set character encoding
set nocompatible
set encoding=utf-8

" File syntax highlighting and indenting
syntax on
filetype plugin indent on

" Line numbering, tabs as 2 spaces, backspace everything, color column at 81
" chars
set relativenumber
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set cc=81

" Improve search to be incremental and case-insensitive unless searches contain
" capitals
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show .dotfiles in CtrlP's fuzzy finder
let g:ctrlp_show_hidden = 1

" Ignore certain folders in CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|\.git'

" Set the character that will trigger UltiSnips' snippets to Tab
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" Open a split when editing snippets
let g:UltiSnipsEditSplit="vertical"

" Map Ctrl+S to save a file
map <C-s> :w<CR>

" Map Ctrl+L to run a command
map <C-l> :!
