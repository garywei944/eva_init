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
  sudo apt install -y git zsh screen net-tools openssh-server wget curl zip rar unrar dos2unix htop bashtop traceroute shadowsocks-libev lazygit rsync jq shc nfw fonts-firacode gpg ttf-ancient-fonts fonts-powerline numlockx tmux pulseaudio colordiff

  # Development Runtimes
  sudo apt install -y emacs vim git-flow build-essential default-jdk python python3 python3-pip virtualenv python3-venv cmake clang gdb valgrind ctags checkinstall rlwrap silversearcher-ag ripgrep fd-find locate aspell ghostscript autoconf libtool

  # Install nodejs and update to latest
  sudo apt install -y nodejs npm
  npm cache clean -f
  sudo npm install -g n
  sudo n stable

  # Heroku
  # sudo snap install --classic heroku
  curl https://cli-assets.heroku.com/install.sh | sh

  # Just for fun
  sudo apt install -y screenfetch lolcat figlet fortune cowsay

  # Deprecated
  # sudo apt install -y python-pip
}

apt_desktop() {
  # System management
  sudo apt install -y ubuntu-restricted-extras scrot flameshot gparted kazam vlc gpicview evoluttion evolution-ews clamav clamtk graphviz terminator compton pavucontrol

  # Media Player


  # Productivity

}

apt_cuda() {
  # CUDA 3rd party Library
  sudo apt install -y g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev
}
