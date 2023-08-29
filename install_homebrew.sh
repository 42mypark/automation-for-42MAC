#!/bin/zsh

function brew_install() {

	brew list $1 > /dev/null
	if [ $? -eq 1 ]
	then
		brew install $1
	else
		echo $1 already installed
	fi
}

which brew > /dev/null
if [ $? -eq 1 ]
then
	git clone --depth=1 https://github.com/Homebrew/brew $HOME/goinfre/.brew && echo 'export PATH=$HOME/goinfre/.brew/bin:$PATH' >> $HOME/.zshrc && source $HOME/.zshrc && brew update
else
	echo brew already installed
fi

#brew_install i686-elf-binutils
#brew_install i686-elf-gcc
brew_install qemu
brew_install xorriso

