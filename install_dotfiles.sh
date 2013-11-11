#!/bin/sh
set -e

# copy dotfiles over to home directory
repo_path="$HOME/github/desktop"

cd $repo_path
cp -r dotfiles/* $HOME
