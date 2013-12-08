#!/bin/bash

# Update our vimrc and push it to github
set -e

cd $HOME/github/desktop/

git add dotfiles/.vimrc && \
git add -u && \
git commit -m "Quick update to vimrc" && \
git push -u origin master
