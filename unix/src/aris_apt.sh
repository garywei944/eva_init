#!/bin/bash

# Initialization and update apt
sudo apt update
sudo apt -y upgrade
sudo apt remove -y --purge openssh-server
sudo apt -y install zsh wget curl rsync net-tools zip emacs vim git git-flow screen dos2unix build-essential default-jdk python python-pip python3 python3-pip nodejs npm cmake clang gdb valgrind ctags build-essential libgtest-dev openssh-server

# Install GooleTest
cd /usr/src/googletest
sudo mkdir build
cd build
sudo cmake ..
sudo make
sudo make install
sudo ln -s /usr/local/lib/libgtest.a /usr/lib/libgtest.a
sudo ln -s /usr/local/lib/libgtest_main.a /usr/lib/libgtest_main.a

# Install Docker
sudo apt remove -y docker docker-engine docker.io containerd runc
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo gpasswd -a ${USER} docker

echo ARIS APT COMPLETE
