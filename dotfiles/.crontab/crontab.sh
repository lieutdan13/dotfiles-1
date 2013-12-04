#!/bin/sh

#minute (0-59), hour (0-23, 0 = midnight), day (1-31), month (1-12), weekday (0-6, 0 = Sunday), command 

# update vundle
05 06 * * * $HOME/github/desktop/.crontab/update_bin.sh
