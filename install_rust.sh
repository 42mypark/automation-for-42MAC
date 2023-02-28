#!/bin/zsh

which rustc > /dev/null

if [ $? -eq 1 ]
then

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $CARGO_HOME/env
rustup component add rust-src --toolchain nightly-x86_64-apple-darwin

else
	echo rust already installed

fi

