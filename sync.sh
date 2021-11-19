#!/bin/bash

mkdir -p ~/lockdir/

if [ -f ~/lockdir/rsync.lock ] 
then
    exit
else
    touch ~/lockdir/rsync.lock
    docker run --rm -v /mnt:/mnt eeacms/rsync rsync -a --delete /mnt/docker/shared/* /mnt/data/share/ &> /dev/null
    rm -f ~/lockdir/rsync.lock
fi
