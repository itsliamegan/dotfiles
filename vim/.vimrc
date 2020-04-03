" Disable legacy vi compatibility and set character encoding.
set nocompatible
set encoding=utf-8

" Start vundle and configure plugins.

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'vundlevim/vundle.vim'

Plugin 'adelarsq/vim-matchit'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/twilight256.vim'

call vundle#end()

" File syntax highlighting, detection, and indenting.
syntax on
filetype plugin indent on

" Show both relative and absolute line numbers.
set number relativenumber

" Tabs as two spaces.
set tabstop=2
set shiftwidth=2
set expandtab

" Show a ruler at 80 characters.
set textwidth=80
set colorcolumn=+1

" Improve search to be incremental and case-insensitive unless searches contain
" capitals.
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show dotfiles in ctrlp.
let g:ctrlp_show_hidden = 1

" Ignore certain folders in ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|\.git'

" Set color scheme.
colorscheme twilight256

" Set the leader key to Space.
let mapleader = " "

" Save a file with Ctrl+S.
map <C-s> :w<CR>

" Set all keybindings.

autocmd FileType ruby map <buffer> <Leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <buffer> <Leader>a :call RunAllSpecs()<CR>
