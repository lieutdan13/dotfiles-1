#!/bin/sh
set -e

cd $HOME/desktop

/bin/sh install_dotfiles.sh
/bin/sh install_bin.sh
/bin/sh install_i3.sh
