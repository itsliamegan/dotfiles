""""""""""
" BASICS "
""""""""""

" Disable legacy vi compatibility and set character encoding.
set nocompatible
set encoding=utf-8

"""""""""""
" PLUGINS "
"""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'vundlevim/vundle.vim'

Plugin 'adelarsq/vim-matchit'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'romainl/vim-cool'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'wellle/targets.vim'

call vundle#end()

""""""""""""""""""""
" FILES AND EDITOR "
""""""""""""""""""""

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

" Restore normal backspace.
set backspace=indent,eol,start

" Use %% to expand to the directory of the current file.
cabbr <expr> %% expand('%:p:h')

"""""""""""""""""
" FUZZY FINDING "
"""""""""""""""""

" Show dotfiles in ctrlp.
let g:ctrlp_show_hidden = 1

" Ignore certain files and directories in ctrlp
set wildignore+=*.swp
let g:ctrlp_custom_ignore = "node_modules\|\.git"

""""""""""
" COLORS "
""""""""""

" Set the color scheme.
set background=dark
set termguicolors
colorscheme grb24bit

"""""""
" GUI "
"""""""
"
" Fancy status line.
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Show the tab bar, even when there's only one file open.
set showtabline=2

" Disable the visual & audio bell.
set vb t_vb=

"""""""""""""""
" kEYBINDINGS "
"""""""""""""""

" Set the leader key to Space.
let mapleader = " "

" Keybindings for testing.
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>
