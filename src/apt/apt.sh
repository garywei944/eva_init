#!/usr/bin/env bash

update() {
  sudo apt update
  sudo apt -y dist-upgrade
}

# Basic Runtime Environments
basic() {
  update

  # Add necessary repository
  sudo add-apt-repository -y ppa:bashtop-monitor/bashtop
  sudo add-apt-repository -y ppa:lazygit-team/release

  sudo apt update

  # System Essentials
  sudo apt -y install git zsh screen net-tools openssh-server wget curl zip rar unrar dos2unix htop bashtop traceroute shadowsocks-libev lazygit rsync jq shc

  # Repository for node 14
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

  # Development Runtimes
  sudo apt -y install emacs vim git git-flow build-essential default-jdk python python3 python3-pip virtualenv python3-venv nodejs npm cmake clang gdb valgrind ctags

  sudo snap install --classic heroku

  # Deprecated
  # sudo apt -y install python-pip
}

apt_desktop() {
  sudo apt -y install ubuntu-restricted-extras scrot flameshot gparted kazam vlc
}

apt_cuda() {
  # CUDA 3rd party Library
  sudo apt -y install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev
}
