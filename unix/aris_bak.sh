#!/bin/bash

sudo tar cvpzf /mnt/adam/backup.tar.gz --exclude=/proc --exclude=/sys --exclude=/dev --exclude=/lost+found --exclude=/tmp --exclude=/mnt --exclude=/media --exclude=/cdrom --exclude=backup.tar.gz /

echo ARIS BACKUP SUCCESS
