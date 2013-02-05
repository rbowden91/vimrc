set nocompatible
" Vundle stuff
" Need to turn on then off thanks to silly mac bug
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/Command-T'
Bundle 'vim-scripts/a.vim'
Bundle 'scrooloose/nerdtree'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'sjl/gundo.vim'
Bundle 'php.vim--Garvin'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'rson/vim-conque'
Bundle 'rbowden91/ocaml-vim'

Bundle 'hukl/Smyck-Color-Scheme'
Bundle 'vim-scripts/habiLight'
Bundle 'jcf/vim-latex'
"Bundle 'roman/golden-ratio'
"filetype plugin on
" End Vundle stuff

runtime macros/matchit.vim

" disable annoying beep on errors
set visualbell t_vb=

noremap - ,
let mapleader=","

set nohidden
set tabstop=4
set backspace=indent,eol,start
set autoindent
set smartindent
set copyindent
set nu
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set expandtab
set smarttab
set hlsearch
set incsearch
set pastetoggle=<F2>
set mouse=a
set scrolloff=5

"set virtualedit=all

function! ToggleMouse()
    if &mouse == 'a'
        set mouse=r
        set nonu
    else
        set mouse=a
        set nu
    endif
endfunction

inoremap jk <esc>

nnoremap <F3> :call ToggleMouse()<CR>
nnoremap k gk
nnoremap j gj
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <leader>y :YRShow<CR>
nnoremap <leader>w :FixWhitespace<CR>
nnoremap <leader>g :GundoToggle<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-i> gt

" repoen a file at the same line it was on when previously closed
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

" store all swp files here
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp
set viewdir=~/.vim/tmp

" use confirm instead of aborting an action
set confirm

" automatically save and open views (folds)
"set viewoptions-=options

augroup vimrc
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END

set foldmethod=indent
set foldlevel=999999
set textwidth=120
set undofile
set undolevels=1000
set history=1000

scriptencoding utf-8
set encoding=utf-8
set t_Co=256
colorscheme smyck
syntax on
