## Installation:

Vim 8 is required for some features! May need to install from source (https://github.com/vim/vim).

Install fzf by following https://github.com/junegunn/fzf

Requires ack (for ack.vim), cmake (for YouCompleteMe), codequery for vim-codequery

    sudo pip install pycscope
    sudo gem install starscope

iTerm color scheme fixes are in colors/

For YouCompleteMe issues, see https://github.com/Valloric/YouCompleteMe. In particular, a brew-installed python might
conflict with the version vim is using

    mkdir ~/.vim
    git clone git@github.com:rbowden91/vimrc.git ~/.vim
    # alternatively:
    # git clone https://github.com/rbowden91/vimrc.git ~/.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ln -s ~/.vim/.vimrc ~/.vimrc
    vim +PluginInstall +qall

    # compile YouCompleteMe stuff
    cd ~/.vim/bundle/YouCompleteMe
    # tern-completer requires node and npm, clang-completer requires clang
    ./install.py --clang-completer --tern-completer


If resorting to recompiling Vim from scratch for Ruby support, I used:

    ./configure --prefix=/usr/local \
	--enable-gui=no \
    	--without-x \
    	--disable-nls \
    	--enable-multibyte \
    	--with-tlib=ncurses \
    	--enable-pythoninterp \
    	--enable-python3interp \
    	--enable-rubyinterp \
    	--enable-cscope \
    	--with-features=huge

Make sure after installing that the `vim` command refers to the newly compiled vim!



## Shortcuts

* `,n`: Toggle NERDTree
* `,t`: Show fzf
* `,w`: Remove whitespace at end of lines
* `,g`: Toggle UNDO tree
* `,/`: Clears out leftover search highlighting
* `,c:`: Active CoqIDE Mode
* ~~`,c`: Send OCaml code to toplevel using either a motion or visual mode~~
* ~~`,e`: Send the current "block" (between ';;'s) of OCaml code to toplevel~~
* ~~`,f`: Send entire file to OCaml toplevel~~
