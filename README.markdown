## Installation:

If using RVM, you'll want to do

    rvm use system

Before installing!

    yum -y install make ruby ruby-devel vim
    mkdir ~/.vim
    git clone git://github.com/rbowden91/vimrc.git ~/.vim
    ln -s ~/.vim/.vimrc ~/.vimrc
    vim +BundleInstall +qall

And then

    cd ~/.vim/bundle/Smyck-Color-Scheme/
    mkdir colors
    mv * colors 2> /dev/null
    cd ~/.vim/bundle/Command-T/ruby/command-t
    ruby extconf.rb
    make

## Shortcuts

* `,o`: Toggle NERDTree
* `,t`: Show Command-T
* `,w`: Remove whitespace at end of lines
* `,y`: Toggle yank ring
* `,g`: Toggle UNDO tree
* `Ctrl+{h,j,k,l}`: Move among windows
