#!/usr/bin/env bash

set -eu
set -o pipefail

### bin
RM="/bin/rm"
LN="/bin/ln"
repo_path="$HOME/git/dotfiles"

### functions
link_dotfiles() {

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

    for i in "${dotfiles[@]}"; do

        if [ -e "$HOME/$i" ]; then
            $RM "$HOME/$i"
        fi

        $LN -s "$repo_path/dotfiles/$i" "$HOME/$i"

    done

}

link_bin() {

    if [ -e "$HOME/bin" ]; then
        $RM "$HOME/bin"
    fi

    $LN -s "$repo_path/bin" "$HOME/bin"

}

main() {
    link_dotfiles
    link_bin
}

main
