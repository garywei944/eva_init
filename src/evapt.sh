#!/bin/bash
# evapt.sh
# @Author  : garywei944 (garywei944@gmail.com)
# @Link    : https://github.com/garywei944


update() {
	sudo apt update
	sudo apt -y dist-upgrade
}

apt_beta() {
	# Beta
	sudo apt -y install rsync shc zsh-doc ubuntu-restricted-extras jq
}

# Basic Runtime Environments
basic() {
	update

	# System Essentials
	sudo apt -y install zsh screen net-tools openssh-server wget curl zip rar unrar p7zip-full p7zip-rar dos2unix htop traceroute

	# Development Runtimes
	sudo apt -y install emacs vim git git-flow build-essential default-jdk python python3 python3-pip virtualenv python3-venv nodejs npm cmake clang gdb valgrind ctags

	# Deprecated
	# sudo apt -y install python-pip

	apt_beta
}

apt_cuda() {
	# CUDA 3rd party Library
	sudo apt -y install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev
}

# Driver
driver() {
	sudo ubuntu-drivers autoinstall
}

# GooleTest
gtest() {
	sudo apt -y install libgtest-dev
	cd /usr/src/googletest
	sudo mkdir build
	cd build
	sudo cmake ..
	sudo make
	sudo make install
	sudo ln -fs /usr/local/lib/libgtest.a /usr/lib/libgtest.a
	sudo ln -fs /usr/local/lib/libgtest_main.a /usr/lib/libgtest_main.a
}

# Docker
docker() {
	sudo apt remove -y docker docker-engine docker.io containerd runc
	sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	# sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt update
	sudo apt -y install docker-ce docker-ce-cli containerd.io
	sudo gpasswd -a ${USER} docker
}

# Albert
albert() {
	# Ubuntu 18.04
	# yes | sudo add-apt-repository ppa:noobslab/macbuntu
	# sudo apt update
	# sudo apt -y install albert

	# # Make Albert autostart
	# mkdir -p ~/.config/autostart/
	# cp /usr/share/applications/albert.desktop ~/.config/autostart/
	# chmod +x ~/.config/autostart/albert.desktop

	# Ubuntu 20.04
	echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
	curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home:manuelschneid3r.gpg > /dev/null
	sudo apt update
	sudo apt install albert
}

# Chrome
chrome() {
	cd /tmp
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt -y install ./google-chrome-stable_current_amd64.deb
	rm -f google-chrome-stable_current_amd64.deb
}

# Sublime Text 3 & Sublime Merge
sublime() {
	# sudo snap install sublime-text --classic
	# sudo snap install sublime-merge --classic

	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sudo apt -y install apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt update
	sudo apt -y install sublime-text
	sudo apt -y install sublime-merge
}

# PyCharm Professional
pycharm() {
	sudo snap install pycharm-professional --classic
}

# Gnome Chrome shell
gnome_chrome_shell() {
	sudo apt -y install chrome-gnome-shell gnome-screensaver
}

# Netease Music
netease_music() {
	sudo snap install netease-music --beta --devmode
}

# GParted
gparted() {
	sudo apt -y install gparted
}

# Kazam
kazam() {
	sudo apt -y install kazam
}

# PyMol
pymol() {
	sudo apt -y install pymol
}

# VLC
vlc() {
	sudo snap install vlc
}

# GNome Tweaks
tweaks() {
	sudo apt -y install gnome-tweaks
}

# Wine
wine() {
	sudo apt -y install wine winetricks
}

# Steam
steam() {
	sudo apt -y install steam
}

# Timeshift
timeshift() {
	sudo add-apt-repository -y ppa:teejee2008/ppa
	sudo apt update
	sudo apt -y install timeshift
}

# Discord
discord() {
	sudo snap install discord
}

# Metasploit
metasploit() {
	curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
}
