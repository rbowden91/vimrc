#!/usr/bin/env sh
# tested on Ubuntu 18.04

# mono takes a long time to install
# add PPA for Mono
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt-get update

sudo apt-get install -y curl

# install rust for YouCompleteMe
curl https://sh.rustup.rs -sSf > /tmp/rust.sh
sh /tmp/rust.sh -y
source ~/.cargo/env
rm -f /tmp/rust.sh

# build-essential, cmake, python3-dev: YouCompleteMe (https://github.com/Valloric/YouCompleteMe)
# nodejs, npm: YouCompleteMe JavaScript/TypeScript support
# clang, clang-tidy: YouCompleteMe C family support
# golang-go: YouCompleteMe Go support
# mono-complete (alternatively, just mono-devel): YouCompleteMe C# support
# openjdk-8-jre: YouCompleteMe Java support
# ack: ack.vim (https://github.com/mileszs/ack.vim)
# codequery: vim-codequery (https://github.com/devjoe/vim-codequery)
sudo apt-get install -y \
	build-essential \
	clang \
	clang-tidy \
	python2.7 \
	python-pip \
	python3 \
	python3-pip \
	ruby \
	python3-dev \
	python-dev  \
	git \
	libncurses-dev \
	nodejs \
	npm \
	cmake \
	ctags \
	ack \
	codequery \
	golang-go \
	mono-complete \
	openjdk-8-jre

# https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install -y

pip install pycscope
sudo gem install starscope
sudo npm install -g typescript # for YouCompleteMe JavaScript/TypeScript support

# use newest vim from github
git clone --depth 1 https://github.com/vim/vim /tmp/vim
cd /tmp/vim
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
make
sudo make install

# download actual vimrc files
rm -rf /tmp/vim ~/.vim ~/.vimrc
git clone https://github.com/rbowden91/vimrc.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.vim/.vimrc ~/.vimrc
vim +PluginInstall +qall

# finish YouCompleteMe installation
cd ~/.vim/bundle/YouCompleteMe
./install.py --cs-completer --go-completer --rust-completer --java-completer --clang-completer
