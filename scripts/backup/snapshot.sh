#!/bin/bash

# A simple tool to make rotating snapshot backups with rsync

set e

# bin used
ECHO=/bin/echo;

MOUNT=/bin/mount;
RM=/bin/rm;
MV=/bin/mv;
CP=/bin/cp;
TOUCH=/bin/touch;

RSYNC=/usr/bin/rsync;

# File locations
# When I get another hard drive snapshots are going on 
# a seperate read-only partition
SNAPSHOT_DIR=/usr/local/share/snapshot;
IGNORE=$HOME/bin/backup/snapshot_ignore;

# dirs to backup
BACKUP_DIRS=(
    'music'
    'github'
    'books'
    'isos'
)

# delete oldest snapshot if exists
if [ -d $SNAPSHOT_DIR/home/hourly.3 ] ; then
    $RM -rf $SNAPSHOT_DIR/home/hourly.3 
fi

# shift the middle snapshots back
if [ -d $SNAPSHOT_DIR/home/hourly.2 ] ; then
    $MV $SNAPSHOT_DIR/home/hourly.2 $SNAPSHOT_DIR/home/hourly.3 
fi

if [ -d $SNAPSHOT_DIR/home/hourly.1 ] ; then
    $MV $SNAPSHOT_DIR/home/hourly.1 $SNAPSHOT_DIR/home/hourly.2 
fi

# make hard-link-only copy of latest snapshot
if [ -d $SNAPSHOT_DIR/home/hourly.0 ] ; then
    $CP -al $SNAPSHOT_DIR/home/hourly.0 $SNAPSHOT_DIR/home/hourly.1 ;
fi

# make snapshot dirs incase they don't exist
mkdir -p $SNAPSHOT_DIR/home/hourly.0
mkdir -p $SNAPSHOT_DIR/home/hourly.1
mkdir -p $SNAPSHOT_DIR/home/hourly.2
mkdir -p $SNAPSHOT_DIR/home/hourly.3

# rsync into the latest snapshot
for dir in "${BACKUP_DIRS[@]}"
do
    $RSYNC -a --delete --delete-excluded --exclude-from="$IGNORE" \
    --link-dest=$SNAPSHOT_DIR/home/hourly.1/$dir/ $HOME/$dir/ $SNAPSHOT_DIR/home/hourly.0/$dir/
done

# update mtime of hourly.0 to reflect successful snapshot
$TOUCH $SNAPSHOT_DIR/home/hourly.0
