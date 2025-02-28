call plug#begin()
Plug 'whatyouhide/vim-gotham'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
call plug#end()

set laststatus=2
set nocompatible
filetype off
syntax on
silent! colorscheme gotham256
filetype plugin indent on

set list
set lcs+=eol:
set lcs+=space:·

set number
set modelines=0

set ttyfast

set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0

set scrolloff=5

let g:lightline = {
    \ 'colorscheme': 'gotham256',
    \ 'active' : {
    \   'left': [ [ 'mode', 'paste' ],
    \            [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'rust': ['rustfmt'],
    \ }

set noshowmode

map <C-o> :NERDTreeToggle<CR>
