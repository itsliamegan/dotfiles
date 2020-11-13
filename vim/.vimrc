" Disable legacy vi compatibility and set character encoding.
set nocompatible
set encoding=utf-8

" Start vundle and configure plugins.

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'vundlevim/vundle.vim'

Plugin 'adelarsq/vim-matchit'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

call vundle#end()

" File syntax highlighting, detection, and indenting.
syntax on
filetype plugin indent on

" Show both absolute line numbers and relative line numbers.
set number
set relativenumber

" Tabs as two spaces.
set tabstop=2
set shiftwidth=2
set expandtab

" Improve search to be incremental and case-insensitive unless searches contain
" capitals.
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show dotfiles in ctrlp.
let g:ctrlp_show_hidden = 1

" Ignore certain files and directories in ctrlp
set wildignore+=*.swp
let g:ctrlp_custom_ignore = "node_modules\|\.git"

" Set the color scheme.
set background=dark
set termguicolors
colorscheme grb24bit

" Fancy status line.
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Show the tab bar, even when there's only one file open.
set showtabline=2

" Disable the visual & audio bell.
set vb t_vb=

" Set the leader key to Space.
let mapleader = " "

" Set all keybindings.

map <D-s> :w<kEnter>
imap <D-s> <Esc>:w<kEnter>i
