#!/bin/bash

set -eu
set -o pipefail

sudo modprobe bbswitch
optirun true
intel-virtual-output
