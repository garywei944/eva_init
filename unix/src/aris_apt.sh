#!/bin/bash
# root

# Initialization and update apt
apt update
apt -y upgrade
apt -y install zsh wget curl net-tools emacs vim git git-flow screen dos2unix build-essential default-jdk python python-pip python3 python3-pip nodejs npm

echo ARIS APT COMPLETE
