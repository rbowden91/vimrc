## Installation:

iTerm color scheme fixes are in colors/

For Ruby issues, see http://blog.parkermoore.de/2014/01/02/installing-command-t-with-os-x-mavericks-built-in-vim/

    mkdir ~/.vim
    git clone git@github.com:rbowden91/vimrc.git ~/.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ln -s ~/.vim/.vimrc ~/.vimrc
    vim +PluginInstall +qall

    # compile Command-T stuff
    cd ~/.vim/bundle/Command-T/ruby/command-t
    ruby extconf.rb
    make

## Shortcuts

* `,n`: Toggle NERDTree
* `,t`: Show Command-T
* `,w`: Remove whitespace at end of lines
* `,g`: Toggle UNDO tree
* `,/`: Clears out leftover search highlighting

* ~~`,c`: Send OCaml code to toplevel using either a motion or visual mode~~
* ~~`,e`: Send the current "block" (between ';;'s) of OCaml code to toplevel~~
* ~~`,f`: Send entire file to OCaml toplevel~~
