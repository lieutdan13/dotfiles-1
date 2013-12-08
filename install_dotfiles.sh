#!/bin/bash
set -e

# copy dotfiles over to home directory
repo_path="$HOME/github/desktop"

files=(
    '.vim'
    '.vimrc'
    '.bashrc'
    '.crontab'
    '.i3'
    '.Xdefaults'
    '.Xmodmap'
)

for i in "${files[@]}"
do
    rm -rf $HOME/$i
    ln -s $repo_path/dotfiles/$i $HOME/$i
done
