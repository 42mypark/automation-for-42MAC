#!/bin/bash
DST_DIR=~/goinfre/
SRC_DIR=~/

echo $SCRIPT_PATH

set -e

function make_symlink() {
	local dst=$1
	local src=$2
	mkdir -p "$dst"
	rm -rf "$src"
	ln -s "$dst" "$src"
}

PREV=$IFS

IFS="	
"

list=($(cat ./sym_list | awk -F',' -v dst=$DST_DIR -v src=$SRC_DIR  '{printf "%s%s\t%s%s\n", dst, $1, src, $1}' ))

for ((i=0; i < ${#list[@]}; i+=2 ))
do
	dst=${list[i]}
	src=${list[i+1]}
	make_symlink $dst $src
done

IFS=$PREV
