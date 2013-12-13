#!/bin/bash
set -e

# copy dotfiles over to home directory
repo_path="$HOME/github/desktop"

files=(
    '.vim'
    '.vimrc'
    '.bashrc'
    '.bash_aliases'
    '.crontab'
    '.i3'
    '.Xdefaults'
    '.Xmodmap'
    '.gitignore_global'
    '.tmux.conf'
)

for i in "${files[@]}"
do
    unlink $HOME/$i
    ln -s $repo_path/dotfiles/$i $HOME/$i
done

unlink $HOME/bin
ln -s $repo_path/scripts $HOME/bin

# install vundle
if [ ! -d $repo_path/dotfiles/.vim/bundle/vundle ]
then
    git clone https://github.com/gmarik/vundle.git $repo_path/dotfiles/.vim/bundle/vundle
    vim +BundleInstall +qall
fi
