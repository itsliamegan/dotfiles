" Start the vundle plugin manager
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'

Plugin 'adelarsq/vim-matchit'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sirver/ultisnips'
Plugin 'stanangeloff/php.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/xoria256.vim'
Plugin 'vim-scripts/twilight256.vim'

" Finish vundle setup
call vundle#end()

" Disable legacy vi compatibility and set character encoding
set nocompatible
set encoding=utf-8

" File syntax highlighting and indenting
syntax on
filetype plugin indent on

" Set color scheme
colorscheme twilight256

" Line numbering, tabs as 2 spaces, backspace everything, text width of 80 chars
" and color column after that
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set textwidth=80
set colorcolumn=+1

" Improve search to be incremental and case-insensitive unless searches contain
" capitals
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show .dotfiles in CtrlP's fuzzy finder
let g:ctrlp_show_hidden = 1

" Ignore certain folders in CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|\.git\|tmp'

" Set the character that will trigger UltiSnips' snippets to Tab
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" Open a split when editing snippets
let g:UltiSnipsEditSplit="vertical"

" Map Ctrl+S to save a file
map <C-s> :w<CR>

" Map Ctrl+L to run a command
map <C-l> :!

" Map Ctrl+I to run a test for the current file in Ruby
autocmd FileType ruby map <buffer> <C-i> :!rake spec %<CR>

" Map Ctrl+K to run the whole test suite in Ruby
autocmd FileType ruby map <buffer> <C-k> :!rake spec<CR>

" Map Ctrl+I to run a test for the current file in Elixir
autocmd FileType elixir map <buffer> <C-i> :!mix test %<CR>

" Map Ctrl+K to run the whole test suite in Elixir
autocmd FileType elixir map <buffer> <C-k> :!mix test<CR>

" Map Ctrl+K to run the whole test suite in Crystal
autocmd FileType crystal map <buffer> <C-k> :!crystal spec<CR>

" Map Ctrl+I to run a test for the current file in Elixir
autocmd FileType crystal map <buffer> <C-i> :!crystal spec %<CR>
