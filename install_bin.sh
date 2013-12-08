#!/bin/bash
set -e

# utilities
util_programs=(
    'ranger'
    'weechat-curses'
    'xpdf'
)

for i in "${util_programs[@]}"
do
    apt-get install $i
done

# media
media_programs=(
    'vlc'
    'firefox'
)

for i in "${media_programs[@]}"
do
    apt-get install $i
done

# development tools
devtools=(
    'vim-gtk'
    'git'
    'valgrind'
    'gcc'
    'build-essential'
)

for i in "${devtools[@]}"
do
    apt-get install $i
done
