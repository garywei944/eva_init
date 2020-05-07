#!/bin/bash

cd ~

# Configuration Terminal
chsh -s /bin/zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
curl -sLf https://spacevim.org/install.sh | bash
rm -fr .emacs.d
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Configure ssh
$SRC/aris_id_rsa.sh

# Configure git
$SRC/aris_git.sh

# Making Links
ln -s /mnt/wind/Aris/iCloudDrive/Desktop Desktop/
ln -s /mnt/wind/Aris/iCloudDrive/Documents Documents/
ln -s /mnt/wind/Aris/Downloads Downloads/
ln -s /mnt/wind/Aris/Music Music/
ln -s /mnt/wind/Aris/Pictures Pictures/
ln -s /mnt/wind/Aris/iCloudDrive/Documents/WLOP Pictures/
ln -s /mnt/wind/Aris/Videos Videos/
cd Desktop
ln -s /mnt/wind/Aris/iCloudDrive/Desktop/EVA .
ln -s /mnt/wind/Aris/iCloudDrive/Desktop/COMPSCI\ 230 .
ln -s /mnt/wind/Aris/iCloudDrive/Desktop/COMPSCI\ 240 .
ln -s /mnt/wind/Aris/iCloudDrive/Desktop/COMPSCI\ 311 .
ln -s /mnt/wind/Aris/iCloudDrive/Desktop/MATH\ 425 .
ln -s /mnt/wind/Aris/iCloudDrive/Desktop/MATH\ 456 .
ln -s /mnt/wind/Aris/iCloudDrive/Desktop/MUSIC\ 100 .
cd ~

# Sublime Text 3
cd .config
mkdir -p sublime-text-3/Installed\ Packages
cd sublime-text-3/Installed\ Packages
wget https://packagecontrol.io/Package%20Control.sublime-package -O Package\ Control.sublime-package
cd ..
rm -fr Packages
git clone git@github.com:garywei944/aris_st3.git Packages
cd ~

echo ARIS UBUNTU CONFIG COMPLETE
