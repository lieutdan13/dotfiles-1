#!/bin/bash

set -eu
set -o pipefail

sudo service bumblebeed start || true
sudo modprobe bbswitch
optirun true
intel-virtual-output

xrandr --output VIRTUAL1 --mode VIRTUAL1.735-1920x1080
xrandr --output VIRTUAL1 --right-of LVDS1
