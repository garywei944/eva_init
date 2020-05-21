#!/bin/bash

sudo tar cvpzf backup.tar.gz --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/lost+found --exclude=/tmp --exclude=/mnt --exclude=/media --exclude=/cdrom --exclude=backup.tar.gz --exclude=/swapfile --exclude=/var/lib/docker --exclude=/home/aris/vmware /

echo ARIS BACKUP SUCCESS
