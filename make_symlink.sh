#!/bin/bash
# remove cache

GOINFRE="$HOME/goinfre"

GENERAL_CACHE="Library/Caches"
DOCKER_CACHE="Library/Containers/com.docker.docker"
CODE_WORKSPACE_STORAGE="Library/Application Support/Code/User/workspaceStorage"

mkdir -p "$GOINFRE/$DOCKER_CACHE"
mkdir -p "$GOINFRE/$GENERAL_CAHCE"
mkdir -p "$GOINFRE/$CODE_WORKSPACE_STORAGE"


if [ -d  "$HOME/$DOCKER_CACHE" ]
then
	echo "Docker: remove cahce in home/Library..." 
	rm -rf "$HOME/$DOCKER_CACHE"
	ln -s "$GOINFRE/$DOCKER_CACHE" "$HOME/$DOCKER_CACHE"
elif [ -L "$HOME/$DOCKER_CACHE"  ]
then
	echo "Docker: The symlink already set"
else
	echo "Docker: The file doesn't exist, so just make symlink"
	ln -s "$GOINFRE/$DOCKER_CACHE" "$HOME/$DOCKER_CACHE"
fi

if [ -d "$HOME/$GENERAL_CACHE" ]
then
	echo "Docker: remove cahce in home/Library..." 
	rm -rf "$HOME/$GENERAL_CACHE "
	ln -s "$GOINFRE/$GENERAL_CACHE" "$HOME/$GENERAL_CACHE"
elif [ -L "$GENERAL_CACHE"  ]
then
	echo "Docker: The symlink already set"
else
	echo "Docker: The file doesn't exist, so just make symlink"
	ln -s "$GOINFRE/$GENERAL_CACHE" "$HOME/$GENERAL_CACHE"
fi


if [ -d "$HOME/$CODE_WORKSPACE_STORAGE" ]
then
	echo "Docker: remove cahce in home/Library..." 
	rm -rf "$HOME/$CODE_WORKSPACE_STORAGE "
	ln -s "$GOINFRE/$CODE_WORKSPACE_STORAGE" "$HOME/$CODE_WORKSPACE_STORAGE"
elif [ -L "$HOME/$CODE_WORKSPACE_STORAGE"  ]
then
	echo "Docker: The symlink already set"
else
	echo "Docker: The file doesn't exist, so just make symlink"
	ln -s "$GOINFRE/$CODE_WORKSPACE_STORAGE" "$HOME/$CODE_WORKSPACE_STORAGE"
fi




echo "Done"
