" ---------------------USABILITY  CONFIGURATION---------------------

" don't make vim compatible with vi
set nocompatible

" turn on syntax highlighting
syntax on " and show line numbers
set number

" turn on wild menu
set wildmenu

" set map leader
let mapleader = ","

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" brackets
set showmatch
set mat=2

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" reload files changed outside of vim
set autoread

" set encoding to utf 8
set encoding=utf-8
set fileencoding=utf-8

" set unix line endings
set fileformat=unix
" when reading files try unx line endings then dos
" also use unix for new buffers
set fileformats=unix,dos

" set no line wrap
set nowrap

" ---------------------PERSONAL  CONFIGURATION---------------------

set ruler

set hid

" indentation for all files
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
" set textwidth=79 
set expandtab 
set autoindent 
set smartindent
set fileformat=unix

" key mappings
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a
nnoremap <F5> :w<CR>:!clear; python %<CR>
inoremap <F5> <Esc>:w<CR>:!clear; python %<CR>i 
map <C-j> <C-W>j " switch to left window
map <C-k> <C-w>k " switch to bottom window
map <C-h> <C-W>h " swith to above window
map <C-l> <C-W>l " switch to right window

map <C-o> :BufExplorer<CR>
map <C-b> :NERDTree<CR>

map <silent> <leader><CR> :noh<CR>

nmap <Leader>q :Bdelete<CR>

" tab mappings
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" removing backup
set nobackup
set nowb
set noswapfile

" ---------------------VUNDLE  CONFIGURATION---------------------

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree' " tree file structure
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'kien/ctrlp.vim'
Plugin 'moll/vim-bbye'
Plugin 'vim-scripts/mayansmoke'
Plugin 'alvan/vim-closetag'
Plugin 'jiangmiao/auto-pairs'

" end plugin management
call vundle#end()
filetype plugin indent on

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set laststatus=2

set noshowmode

" everything related to colors and syntax highlighting
set background=dark
colorscheme peaksea
