set nocompatible

"
" vim tricks: https://www.hillelwayne.com/post/intermediate-vim/
" TODO: investigate these:
" https://github.com/sheerun/vim-polyglot
" https://github.com/svermeulen/vim-subversive

" Vundle stuff
" Need to turn on then off thanks to silly mac bug
filetype on
filetype off

let $CACHE=$HOME."/.cache/vim"
let $CONFIG=$HOME."/.config/vim"
let $MYVIMRC=$CONFIG.'/vimrc'

" https://tlvince.com/vim-respect-xdg
let &directory=$CACHE
let &backupdir=$CACHE
let &undodir=$CACHE
let &viewdir=$CACHE
let &viminfo="%,<800,'10,/50,:100,h,f0,n".$CACHE."/viminfo"

let &runtimepath=$CONFIG.','
let &runtimepath.=$CONFIG.'/after,'
let &runtimepath.=$VIM.','
let &runtimepath.=$VIMRUNTIME.','
let &runtimepath.=$CONFIG.'/bundle/Vundle.vim,'
let &runtimepath.=$HOME.'/.config/fzf,'.$HOME.'/.fzf'

call vundle#begin($CONFIG.'/bundle')

Plugin 'VundleVim/Vundle.vim'

" MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space case (cr<space>), and Title Case (crt) are all just 3 keystrokes away.

Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-unimpaired'

Plugin 'scrooloose/nerdcommenter'

" Syntax highlighting
Plugin 'StanAngeloff/php.vim' " php
Plugin 'pangloss/vim-javascript' " javascript
Plugin 'mxw/vim-jsx' " jsx
Plugin 'hjson/vim-hjson' " hjson
Plugin 'Glench/Vim-Jinja2-Syntax'

" Switch between .c file and .h file with :A
Plugin 'vim-scripts/a.vim'


" Python
" Plugin 'python-mode/python-mode'
Plugin 'fisadev/vim-isort'
" let g:vim_isort_map = '<C-i>'
" :Isort
" Give vim access to virtualenv's python
" TODO: is this needed with python-mode??
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'jeetsukumaran/vim-pythonsense'
" google/yapf: python formatting
" Chiel92/vim-autoformat
" ALEFix?
"
" let b:ale_fixers = [
"       'remove_trailing_lines',
"       'isort',
"       'ale#fixers#generic_python#BreakUpLongLines',
"       'yapf',
" ]
"
" python-mode/python-mode (hi pythonSelf ctermfg=68 guifg=#5f87d7 cterm=bold gui=bold
" Yggdroot/indentLine or nathanaelkane/vim-indent-guides
" vim-fz fzy vs fzf
"




" Replace some Python/Haskell keywords with math symbols
"Plugin 'ehamberg/vim-cute-python'

" Handle keys like pgup/down more intelligently, hopefully
Plugin 'nacitar/terminalkeys.vim'

" ack for files with :Ack
Plugin 'mileszs/ack.vim'

" Autocompletion
"Plugin 'Valloric/YouCompleteMe'

" View the undo tree (,g)
" Plugin 'sjl/gundo.vim'
Plugin 'mbbill/undotree'

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
" flake8 also exists
let g:ale_linters = { 'python': ['mypy']} ", 'pylint'] }
let g:ale_python_auto_pipenv = 1

" Allow for Ctrl-{h,j,k,l} to swap between tmux and vim splits
Plugin 'christoomey/vim-tmux-navigator'

" Dim inactive vim splits
Plugin 'TaDaa/vimade'

" Fuzzy file finder (,t). Replaced Command-T
Plugin 'junegunn/fzf.vim'

"let g:session_default_to_last='yes'
" TODO: need to handle where sessions are stored...
"let g:session_autoload='no'
"let g:session_autosave='yes'
"let g:session_autosave_periodic=1
"let g:session_autosave_silent=1
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-session'

" Autodetect paste in terminals that support bracketed pastes
Plugin 'ConradIrwin/vim-bracketed-paste'

" automatic very magic mode
"Plugin 'coot/CRDispatcher'
"Plugin 'vim-scripts/Enchanted-Vim'
"Plugin 'coot/cmdalias_vim'
"CmdAlias h\%[elp] top\ help   " very useful if you use 'splitbelow', but you want help to split above
"CmdAlias re reg\ "0-*+/ 1
"CmdAlias rn reg\ 123456789 1
"CmdAlias ra reg abcdefghijklmnopqrstuwxyz 1
"CmdAlias bc\%[close] BufClose
"CmdAlias s %s

Plugin 'chrisbra/Colorizer'
"set termguicolors=1


" TODO
Plugin 'Shougo/unite.vim'
Plugin 'devjoe/vim-codequery'
"http://cscope.sourceforge.net/cscope_vim_tutorial.html

" tex
Plugin 'lervag/vimtex'
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'

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
let maplocalleader = "\\"

"""""""""""""""""""""""""""""""""""""
" Map key to toggle opt
" https://vim.fandom.com/wiki/Quick_generic_option_toggling
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

MapToggle <F2> paste
set pastetoggle=<F2>
" Display-altering option toggles
" MapToggle <F1> hlsearch
" MapToggle <F2> wrap
" MapToggle <F3> list
" Behavior-altering option toggles
" MapToggle <F10> scrollbind
" MapToggle <F11> ignorecase

"""""""""""""""""""""""""""""""""""""
" Toggle mouse support, often for copying text from the terminal with mouse highlighting
function ToggleMouse()
    if &mouse == 'a'
        set mouse=r
        set nonu
    else
        set mouse=a
        set nu
    endif
endfunction
nnoremap <F3> :call ToggleMouse()<CR>

"""""""""""""""""""""""""""""""""""""



nnoremap k gk
nnoremap j gj
nnoremap <leader>n :NERDTreeTabsToggle<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <leader>w :FixWhitespace<CR>
nnoremap <leader>a :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap <leader>2 :so $VIMRUNTIME/syntax/hitest.vim

nnoremap <leader>g :UndotreeToggle<CR>
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
set expandtab
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab


" Extends matches of opening and closing tags to more than just one character
" https://github.com/tmhedberg/matchit
runtime macros/matchit.vim


" use confirm instead of aborting an action
set confirm

" automatically save and open views (folds)
"set viewoptions-=options

set pastetoggle=<F2>
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

"vnoremap <space> zf
"au FileType py set autoindent
"au FileType py set smartindent
"au Filetype py set foldmethod=indent
"au FileType py set textwidth=79 " PEP-8 Friendly
"au FileType py nnoremap <space> za


scriptencoding utf-8
set encoding=utf-8
set t_Co=256

" reformat paragraphs automatically to match 80 char textwidth
autocmd FileType tex setlocal textwidth=80
			    \ formatoptions+=a2t
			    \ shiftwidth=2
			    \ tabstop=2

syntax on
