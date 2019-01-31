set nocompatible

" Vundle stuff
" Need to turn on then off thanks to silly mac bug
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" Need to install fzf
set rtp+=~/.fzf

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

" ack for files with :Ack
Plugin 'mileszs/ack.vim'

" Autocompletion
" Fix vim dynamically loading the system python by forcing it to load brew's.
" Restrict just to my laptop
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "Robs-Macbook-Pro-2.local"
    set pythondll=/usr/local/Cellar/python\@2/2.7.15_2/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib
endif
"Plugin 'Valloric/YouCompleteMe'

" View the undo tree (,g)
Plugin 'sjl/gundo.vim'

" Remove end of line whitespace (,w)
Plugin 'bronson/vim-trailing-whitespace'

" File browser (,n)
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeQuitOnOpen=1

" For status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"let g:airline_theme='simple'
set laststatus=2

" Fancy formatting of, e.g., multiple lines of = or :
" Easy Align is an alternative to Tabular
"Plugin 'junegunn/vim-easy-align'
"Plugin 'godlygeek/tabular'

" Linting tools
" ALE is an asynchronous alternative to syntastic
" Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'

" Allow for Ctrl-{h,j,k,l} to swap between tmux and vim splits
Plugin 'christoomey/vim-tmux-navigator'

" Dim inactive vim splits
Plugin 'blueyed/vim-diminactive'

" Fuzzy file finder (,t). Replaced Command-T
Plugin 'junegunn/fzf.vim'

"let g:session_default_to_last='yes'
let g:session_autoload='no'
let g:session_autosave='yes'
let g:session_autosave_periodic=1
let g:session_autosave_silent=1
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" TODO
Plugin 'Shougo/unite.vim'
Plugin 'devjoe/vim-codequery'
"http://cscope.sourceforge.net/cscope_vim_tutorial.html

" Sublime Text color scheme
"Plugin 'danilo-augusto/vim-afterglow'

" For light backgrounds
"Plugin 'vim-scripts/habiLight'

" Hard-coded into this vimrc repo
" https://github.com/hukl/Smyck-Color-Scheme
colorscheme smyck

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

" fzf
nnoremap <leader>p :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" Switch between tabs
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

" May require disabling Mission Control Ctrl-directional shortcuts in OS X,
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

" Use w!! to save a file with sudo permissions
cmap w!! w !sudo tee % > /dev/null

" End Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" repoen a file at the same line it was on when previously closed
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/.viminfo

" Extends matches of opening and closing tags to more than just one character
" https://github.com/tmhedberg/matchit
runtime macros/matchit.vim

set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//
set viewdir=~/.vim/tmp//

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

set foldmethod=indent
set foldlevel=999999
set textwidth=120
set undofile
set undolevels=1000
set history=1000

scriptencoding utf-8
set encoding=utf-8
set t_Co=256
syntax on
