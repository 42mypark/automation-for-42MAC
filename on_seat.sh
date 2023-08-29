#!/bin/zsh

DIR=~/automation/

$DIR/install_rust.sh 
$DIR/install_homebrew.sh 
$DIR/grub.sh

$DIR/docker_symlink.sh
