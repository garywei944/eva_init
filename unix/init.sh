#!/bin/bash

# Configure System
sudo vim /etc/default/grub
sudo update-grub
echo "Defaults	editor=/usr/bin/vim
aris	ALL=(ALL)	NOPASSWD: ALL" | sudo tee -a /etc/sudoers
cd /mnt
sudo mkdir windows adam kiana
sudo echo 'UUID=2F4E51DDBA454123	/mnt/windows	ntfs	defaults	0	0
UUID=09C1B27DA5EB573A	/mnt/adam	ntfs	defaults	0	0
UUID=2896A4A90E3A7893	/mnt/kiana	ntfs	defaults	0	0' >> /etc/fstab





# Get ssh private key
# ./eva_id_rsa

# Making directories and symbolic links
cd ~
mkdir Projects
# cd Desktop
# ln -s /mnt/windows
# ln -s /mnt/ada
# ln -s /mnt/kiana
# ln -s ~/Projects




