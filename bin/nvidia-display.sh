#!/bin/bash

set -eu
set -o pipefail

sudo service bumblebeed start || true
sudo modprobe bbswitch
optirun true
intel-virtual-output

