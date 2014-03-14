#!/bin/bash
set -e

# copy dotfiles over to home directory
repo_path="$HOME/github/desktop"

files=(
    '.vim'
    '.vimrc'
    '.bashrc'
    '.bash_aliases'
    '.bash_logout'
    '.crontab'
    '.i3'
    '.Xdefaults'
    '.Xresources'
    '.Xmodmap'
    '.gitignore_global'
    '.tmux.conf'
    '.gdbinit'
    '.git-completion.bash'
    '.gitconfig'
)

for i in "${files[@]}"
do
    # check to make sure the file doesn't exist
    if [ -e $HOME/$i ]
    then
        rm $HOME/$i
    fi

    ln -s $repo_path/dotfiles/$i $HOME/$i

done

if [ -e $HOME/bin ]
then
    rm $HOME/bin
fi
ln -s $repo_path/scripts $HOME/bin

# install vundle
if [ ! -d $repo_path/dotfiles/.vim/bundle/vundle ]
then
    git clone https://github.com/gmarik/vundle.git $repo_path/dotfiles/.vim/bundle/vundle
    vim +BundleInstall +qall
fi
