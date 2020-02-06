#!/bin/bash

# Initialization and update apt
sudo apt update
sudo apt -y upgrade
sudo apt -y install zsh wget curl rsync net-tools zip emacs vim git git-flow screen dos2unix build-essential default-jdk python python-pip python3 python3-pip nodejs npm cmake clang gdb valgrind build-essential libgtest-dev

# Install GooleTest
cd /usr/src/googletest
sudo mkdir build
cd build
sudo cmake ..
sudo make
sudo make install
sudo ln -s /usr/local/lib/libgtest.a /usr/lib/libgtest.a
sudo ln -s /usr/local/lib/libgtest_main.a /usr/lib/libgtest_main.a

echo ARIS APT COMPLETE
