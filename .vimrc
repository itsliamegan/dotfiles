""""""""""
" BASICS "
""""""""""

" Disable legacy vi compatibility and set character encoding.
set nocompatible
set encoding=utf-8

"""""""""""
" PLUGINS "
"""""""""""

call plug#begin('~/.vim/plug')

Plug 'adelarsq/vim-matchit'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'fncll/wordnet.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'romainl/vim-cool'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

call plug#end()

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

" Automatically wrap at 80 characters.
set textwidth=79
set formatoptions+=t

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
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|node_modules)'
  \ }

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

" Fancy status line.
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Disable the visual & audio bell.
set vb t_vb=

"""""""""""""""
" kEYBINDINGS "
"""""""""""""""

" Set the leader key to Space.
let mapleader = " "

" Testing.
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

" Looking up words.
noremap <Leader>wnd :call wordnet#overviews("<C-r>=expand("<cword>")<CR>")<CR>
noremap <Leader>wns :call wordnet#synonyms("<C-r>=expand("<cword>")<CR>")<CR>
noremap <leader>wnb :call wordnet#browse("<C-r>=expand("<cword>")<CR>")<CR>
