#!/bin/bash

sudo tar cvpzf backup.tar.gz --exclude=/proc --exclude=/sys --exclude=/dev --exclude=lost+found --exclude=/tmp --exclude=/var/log --exclude=/var/cache --exclude=.cache --exclude=/mnt --exclude=/media --exclude=/cdrom --exclude=backup.tar.gz /
