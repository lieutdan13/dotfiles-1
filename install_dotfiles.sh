#!/bin/sh
set -e

# copy dotfiles over to home directory
repo_path="$HOME/github/desktop"

cp -r $repo_path/dotfiles/. $HOME
