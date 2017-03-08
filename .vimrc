set nocompatible

" Vundle stuff
" Need to turn on then off thanks to silly mac bug
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'

" Switch between .c file and .h file with :A
Plugin 'vim-scripts/a.vim'

" Up-to-date PHP syntax highlighting
Plugin 'StanAngeloff/php.vim'

" Better JavaScript syntax highlighting
Plugin 'pangloss/vim-javascript'

" JSX syntax highlighting
Plugin 'mxw/vim-jsx'

" Replace some Python/Haskell keywords with math symbols
"Plugin 'ehamberg/vim-cute-python'

" Handle keys like pgup/down more intelligently, hopefully
Plugin 'nacitar/terminalkeys.vim'

" Indentation markers for lines indented with spaces
" Screws up copying from iterm
" Plugin 'Yggdroot/indentLine'

" ack for files with :Ack
Plugin 'mileszs/ack.vim'

" Autocompletion
" Fix vim dynamically loading the system python by forcing it to load brew's.
" Restrict just to my laptop
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "Robs-Macbook-Pro-2.local"
    set pythondll=/usr/local/Cellar/python/2.7.13/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib
endif
Plugin 'Valloric/YouCompleteMe'

" Open up fuzzy file finder (,t)
Plugin 'vim-scripts/Command-T'
" Swap Command-T functionality to open in new tab
" automatically, and in same window with Ctrl-T
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

" View the undo tree (,g)
Plugin 'sjl/gundo.vim'

" Remove end of line whitespace (,w)
Plugin 'bronson/vim-trailing-whitespace'

" File browser (,n)
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" For status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"let g:airline_theme='simple'
set laststatus=2

"Plugin 'Twinside/vim-haskellConceal'

" Coq IDE
Plugin 'let-def/vimbufsync'
Plugin 'the-lambda-church/coquille'
" Automatically jump cursor to where CoqIDE is processing
let g:coquille_auto_move = 'true'
"Plugin 'vim-scripts/coqIDE'

" Fancy formatting of, e.g., multiple lines of = or :
" Easy Align is an alternative to Tabular
"Plugin 'junegunn/vim-easy-align'
"Plugin 'godlygeek/tabular'

" Linting tools
" ALE is an asynchronous alternative to syntastic
"Plugin 'w0rp/ale'
Plugin 'vim-syntastic/syntastic'

Plugin 'metakirby5/codi.vim'

" TODO
"Plugin 'devjoe/vim-codequery'
"http://cscope.sourceforge.net/cscope_vim_tutorial.html

" Sublime Text color scheme
"Plugin 'danilo-augusto/vim-afterglow'

" For light backgrounds
"Plugin 'vim-scripts/habiLight'

"Plugin 'rson/vim-conque'
"Plugin 'rbowden91/ocaml-vim'
"Plugin 'roman/golden-ratio'

call vundle#end()
filetype plugin indent on
" End Vundle stuff

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings

noremap - ,
let mapleader=","

function! ToggleMouse()
    if &mouse == 'a'
        set mouse=r
        set nonu
    else
        set mouse=a
        set nu
    endif
endfunction

nnoremap <F3> :call ToggleMouse()<CR>
nnoremap k gk
nnoremap j gj
nnoremap <leader>n :NERDTreeTabsToggle<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <leader>w :FixWhitespace<CR>
nnoremap <leader>g :GundoToggle<CR>
nnoremap <leader>c :CoqLaunch<CR>

" Switch between tabs
map <Tab> gt
map <S-Tab> gT

" May require disabling Mission Control Ctrl-directional shortcuts in OS X,
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

" CoqIDE Mappings
" May require disabling Mission Control Ctrl-directional shortcuts in OS X,
" or other global hotkeys
au FileType coq call coquille#CoqideMapping()
map <buffer> <silent> <C-S-Up>    :CoqUndo<CR>
map <buffer> <silent> <C-S-Left>  :CoqToCursor<CR>
map <buffer> <silent> <C-S-Down>  :CoqNext<CR>
map <buffer> <silent> <C-S-Right> :CoqToCursor<CR>

imap <buffer> <silent> <C-S-Up>    <C-\><C-o>:CoqUndo<CR>
imap <buffer> <silent> <C-S-Left>  <C-\><C-o>:CoqToCursor<CR>
imap <buffer> <silent> <C-S-Down>  <C-\><C-o>:CoqNext<CR>
imap <buffer> <silent> <C-S-Right> <C-\><C-o>:CoqToCursor<CR>

" Use w!! to save a file with sudo permissions
cmap w!! w !sudo tee % > /dev/null

" End Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme smyck

" repoen a file at the same line it was on when previously closed
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

runtime macros/matchit.vim

set pastetoggle=<F2>

" store all swp files here
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp
set viewdir=~/.vim/tmp

" use confirm instead of aborting an action
set confirm

" automatically save and open views (folds)
"set viewoptions-=options

" disable annoying beep on errors
set visualbell t_vb=
set nohidden
set backspace=indent,eol,start
set tabstop=8
set autoindent
set smartindent
set copyindent
set nu
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set mouse=a
set scrolloff=5

"set virtualedit=all

set foldmethod=indent
set foldlevel=999999
set textwidth=120
set undofile
set undolevels=1000
set history=1000

" This is set above, for airline plugin
" set laststatus=2

scriptencoding utf-8
set encoding=utf-8
set t_Co=256
syntax on
