#!/bin/bash

DIR=~/automation/

/bin/zsh $DIR/install_rust.sh 
/bin/zsh $DIR/install_homebrew.sh 
/bin/zsh $DIR/grub.sh

/bin/zsh $DIR/make_symlink.sh
