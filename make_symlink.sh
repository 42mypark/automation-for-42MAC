#!/bin/bash
# remove cache

GOINFRE="$HOME/goinfre"

GENERAL_CACHE="Library/Caches"
DOCKER_CACHE="Library/Containers/com.docker.docker"
DOCKER_CACHE2="Library/Containers/com.docker.helper"
CODE_WORKSPACE_STORAGE="Library/Application Support/Code/User/workspaceStorage"

make_links () {

	mkdir -p "$GOINFRE/$1"

	if [ -d  "$HOME/$1" ]
	then
		echo "remove cahce in home/Library :$1" 
		cp -R "$HOME/$1/" "$GOINFRE/$1" 2> /dev/null
		rm -rf "$HOME/$1" 2> /dev/null
		ln -s "$GOINFRE/$1" "$HOME/$1" 2> /dev/null
	elif [ -L "$HOME/$1"  ]
	then
		echo "The symlink already set :$1"
	else
		echo "The file doesn't exist, so just make symlink :$1"
		ln -s "$GOINFRE/$1" "$HOME/$1"
	fi
}


make_links "$GENERAL_CACHE"
make_links "$DOCKER_CACHE"
make_links "$DOCKER_CACHE2"
make_links "$CODE_WORKSPACE_STORAGE"

echo "Done"
