#!/bin/bash
# root

export SRC=$PWD/src

cd /tmp

# Initialization and update apt
$SRC/aris_apt.sh

# Configure
vim /etc/default/grub
update-grub
passwd
echo "aris	ALL=(ALL)	NOPASSWD: ALL" >> /etc/sudoers
mkdir -p /mnt/winc
mkdir -p /mnt/wind
cd /etc
cp fstab fstab.bak
echo 'UUID=C89CA0E09CA0C9F0	/mnt/winc	ntfs	defaults	0	0
UUID=82B64FF3B64FE66F	/mnt/wind	ntfs	defaults	0	0' >> fstab
mount UUID=C89CA0E09CA0C9F0 /mnt/winc
mount UUID=82B64FF3B64FE66F /mnt/wind
echo "PATH=\"$PATH:/snap/bin\"" > /etc/environment

# Set system time
timedatectl set-local-rtc 1
apt -y install ntpdate
ntpdate time.windows.com
hwclock --localtime --systohc

# Install Graphic Driver
ubuntu-drivers autoinstall

# Albert
add-apt-repository ppa:noobslab/macbuntu
apt update
apt -y install albert

# Unistall Firefox
apt -y purge firefox firefox-locale-en
rm -fr /etc/firefox

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt -y install ./google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

# Sublime Text 3 & Sublime Merge
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt update
apt -y install sublime-text sublime-merge

# Steam
apt -y install steam

# Netease Music
wget http://d1.music.126.net/dmusic/netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb
apt -y install ./netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb
rm -f netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb

# Sogou Input
apt -y install fcitx-bin fcitx-table
im-config

su -c "$SRC/aris_ubuntu_config.sh" aris

echo ARIS UBUNTU REBOOT NEEDED
