#!/bin/sh
set -e

repo_path="$HOME/github/desktop"
cd $repo_path

/bin/sh install_dotfiles.sh
/bin/sh install_bin.sh
/bin/sh install_i3.sh
