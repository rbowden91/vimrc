#!/usr/bin/env bash
# tested on Ubuntu 18.04, 20.04
# developed in but not re-run in mojave 1/30/2019

if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    CODENAME=$VERSION_CODENAME
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
    CODENAME=$(lsb_release -sc)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    ...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    ...
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi

if [[ "$OS" == "Darwin" ]]; then
        # Mac OSX
	# xcode cli tools need to be installed, as does brew

	# brew install python3 needs this to exist
	sudo mkdir -p /usr/local/Frameworks
	sudo chown rbowden /usr/local/Frameworks

	# couldn't find clang-tidy, *-dev, openjdk-8-jre
	brew install ack python2 python3 nodejs ruby cmake ctags codequery golang mono

	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm get-pip.py
	PIPPATH=$(find /usr/local/Cellar/python/*/Frameworks/Python.framework/Versions/* -name bin)
	PIPPATH="$PIPPATH/pip"

	sudo ln -s $PIPPATH /usr/local/bin/pip3
elif [[ "$OS" == "Arch Linux" ]]; then
	# couldn't find openjdk-8-jre, clang-tidy
	sudo pacman -S --noconfirm ack python2 python3 nodejs ruby cmake ctags mono

	# for codequery
	sudo pacman -S qt5-tools
	git clone https://aur.archlinux.org/codequery.git
        $(cd codequery && makepkg -Acsy)
	rm -rf codequery
elif [[ "$OS" == "Ubuntu" ]]; then
    # mono takes a long time to install
    # add PPA for Mono
    # TODO: make this idempotent
    #sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
    # TODO: focal still used bionic?
    #echo "deb https://download.mono-project.com/repo/ubuntu stable-$CODENAME main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
    sudo apt-get update
    if [[ "$CODENAME" == "focal" ]]; then
	sudo apt-get install -y \
	        curl \
		build-essential \
		clang \
		clang-tidy \
		python2.7 \
		python3 \
		python3-pip \
		ruby \
		ruby-dev \
		python3-dev \
		python-dev  \
		git \
		libncurses5-dev \
		libgtk2.0-dev \
		libatk1.0-dev \
		libcairo2-dev \
		libx11-dev \
		libxpm-dev \
		libxt-dev \
		nodejs \
		npm \
		cmake \
		exuberant-ctags \
		ack \
		codequery \
		golang-go \
		mono-complete \
		openjdk-8-jre
    else

	sudo apt-get install -y \
	        curl \
		build-essential \
		clang \
		clang-tidy \
		python2.7 \
		python-pip \
		python3 \
		python3-pip \
		ruby \
		ruby-dev \
		python3-dev \
		python-dev  \
		git \
		libncurses5-dev \
		libgnome2-dev \
		libgtk2.0-dev \
		libatk1.0-dev \
		libgnomeui-dev \
		libbonoboui2-dev \
		libcairo2-dev \
		libx11-dev \
		libxpm-dev \
		libxt-dev \
		nodejs \
		npm \
		cmake \
		exuberant-ctags \
		ack \
		codequery \
		golang-go \
		mono-complete \
		openjdk-8-jre
    fi
else
        # Unknown.
	exit
fi

# install rust for YouCompleteMe
# TODO: didn't seem to work for Arch
curl https://sh.rustup.rs -sSf > /tmp/rust.sh
sh /tmp/rust.sh -y
source ~/.cargo/env
rm -f /tmp/rust.sh

# https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --update-rc

# TODO: pip vs pip3
pip3 install pycscope
sudo gem install starscope
sudo npm install -g typescript # for YouCompleteMe JavaScript/TypeScript support

# use newest vim from github
git clone --depth 1 https://github.com/vim/vim /tmp/vim
cd /tmp/vim
./configure --prefix=/usr/local \
	    --enable-gui=auto \
	    --without-x \
	    --disable-nls \
	    --enable-multibyte \
	    --with-tlib=ncurses \
	    --enable-pythoninterp \
	    --enable-python3interp \
	    --enable-rubyinterp \
	    --enable-cscope \
	    --with-features=huge \
	    --with-clientserver
make
sudo make install
rm -rf /tmp/vim

# download actual vimrc files
cd ~
rm -rf ~/.vim ~/.vimrc
git clone https://github.com/rbowden91/vimrc.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.vim/.vimrc ~/.vimrc
vim +PluginInstall +qall

# finish YouCompleteMe installation
cd ~/.vim/bundle/YouCompleteMe
# TODO: osx and arch don't have java-completer
./install.py --cs-completer --go-completer --rust-completer --java-completer --clang-completer
