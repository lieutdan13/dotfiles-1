#!/usr/bin/env bash

set -eu
set -o pipefail

### bin
RM="/bin/rm"
LN="/bin/ln"
repo_path="$HOME/git/dotfiles"

### globals
dotfiles=(
    '.vim'
    '.vimrc'
    '.bashrc'
    '.bash_aliases'
    '.bash_logout'
    '.crontab'
    '.Xdefaults'
    '.Xresources'
    '.Xmodmap'
    '.gitignore_global'
    '.tmux.conf'
    '.gdbinit'
    '.git-completion.bash'
    '.gitconfig'
    '.git-prompt.sh'
    '.ssh'
)

### functions
link_dotfiles() {

for i in "${dotfiles[@]}"; do

    if [ -e $HOME/$i ]; then
        $RM $HOME/$i
    fi

    $LN -s $repo_path/dotfiles/$i $HOME/$i

done

}

link_bin() {

    if [ -e $HOME/bin ]; then
        $RM $HOME/bin
    fi

    $LN -s $repo_path/dotfiles/bin $HOME/bin

}

usage() {
    echo "Does something"
}

main() {
    link_dotfiles
    link_bin
}

main
