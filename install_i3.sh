#!/bin/sh
set -e

# install i3 wm
apt-get install i3-wm
update-alternatives --set x-window-manager /usr/bin/i3
