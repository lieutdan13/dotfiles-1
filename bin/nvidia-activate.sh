#!/bin/bash

set -eu
set -o pipefail

sudo service bumblebeed start || true
sudo modprobe bbswitch
optirun true
intel-virtual-output

xrandr --output VIRTUAL6 --mode VIRTUAL6.758-2560-1440
xrandr --output VIRTUAL6 --right-of LVDS1
