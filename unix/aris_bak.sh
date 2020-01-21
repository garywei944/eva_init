#!/bin/bash
# root

tar cvpzf backup.tar.gz --exclude=/proc --exclude=/sys --exclude=/lost+found --exclude=/mnt --exclude=/media --exclude=/cdrom --exclude=backup.tar.gz /

echo ARIS BACKUP SUCCESS
