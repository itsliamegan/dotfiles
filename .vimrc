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

" Text objects and motions.
Plug 'adelarsq/vim-matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" Make search more ergonomic.
Plug 'romainl/vim-cool'

" IDE features: fuzzy finding, tab-complete, and go-to-definition.
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'ludovicchabant/vim-gutentags'

" Dictionary.
Plug 'fncll/wordnet.vim'

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

"""""""""""
" TESTING "
"""""""""""

function! RunCurrentTest()
  let l:filename = @%

  if &filetype == "ruby"
    let s:last_test_command = "!clear && bundle exec rake test TEST=" . l:filename
    execute s:last_test_command
  elseif &filetype == "javascript"
    let s:last_test_command = "!clear && yarn --silent test " . l:filename
    execute s:last_test_command
  endif
endfunction

function! RunAllTests()
  if &filetype == "ruby"
    let s:last_test_command = "!clear && bundle exec rake test"
    execute s:last_test_command
  elseif &filetype == "javascript"
    let s:last_test_command = "!clear && yarn --silent test"
    execute s:last_test_command
  endif
endfunction

function! RunLastTest()
  if exists("s:last_test_command")
    execute s:last_test_command
  endif
endfunction

"""""""""""""""
" KEYBINDINGS "
"""""""""""""""

" Set the leader key to Space.
let mapleader = " "

" Switching buffers.
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>

" Testing.
nnoremap <Leader>t :call RunCurrentTest()<CR>
nnoremap <Leader>a :call RunAllTests()<CR>
nnoremap <Leader>l :call RunLastTest()<CR>

" Looking up words.
noremap <Leader>wnd :call wordnet#overviews("<C-r>=expand("<cword>")<CR>")<CR>
noremap <Leader>wns :call wordnet#synonyms("<C-r>=expand("<cword>")<CR>")<CR>
noremap <leader>wnb :call wordnet#browse("<C-r>=expand("<cword>")<CR>")<CR>
