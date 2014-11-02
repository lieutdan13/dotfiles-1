#!/bin/bash

set -eu
set -o pipefail

sudo service bumblebeed start || true
sudo modprobe bbswitch
optirun true
intel-virtual-output

xrandr --output VIRTUAL3 --mode VIRTUAL3.737-1920x1080
xrandr --output VIRTUAL3 --right-of LVDS1
