#/bin/bash
# root

ls | grep -v init.tar.gz | xargs rm -fr
tar xvpzf init.tar.gz -C .
mkdir cdrom
mkdir mnt
mkdir media
mkdir proc
mkdir sys
