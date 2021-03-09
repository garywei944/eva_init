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
  sudo apt install -y git zsh net-tools openssh-server wget curl zip rar unrar ufw gpg cargo

  # System management
  sudo apt install -y screen tmux bashtop htop fd-find locate ripgrep silversearcher-ag rsync numlockx traceroute shadowsocks-libev jq pulseaudio ranger

  sudo ln -s /usr/bin/fdfind /usr/bin/fd

  # Development Runtimes
  sudo apt install -y build-essential default-jdk python python3 python3-pip virtualenv python3-venv cmake clang ghostscript cabal-install

  # Development tools
  sudo apt install -y emacs vim git-flow gdb valgrind ctags checkinstall rlwrap aspell autoconf libtool colordiff shc ttf-ancient-fonts fonts-powerline fonts-firacode dos2unix lazygit

  # as-tree
  cargo install -f --git https://github.com/jez/as-tree

  # Install nodejs and update to latest
  sudo apt install -y nodejs npm
  npm cache clean -f
  sudo npm install -g n
  sudo n stable

  # Heroku
  # sudo snap install --classic heroku
  curl https://cli-assets.heroku.com/install.sh | sh

  # Just for fun
  sudo apt install -y screenfetch neofetch lolcat figlet fortune cowsay

  # Deprecated
  # sudo apt install -y python-pip
}

apt_desktop() {
  # System management
  sudo apt install -y scrot flameshot gparted gpicview  clamav clamtk graphviz terminator compton pavucontrol dconf-editor

  # Media Player
  sudo apt install -y ubuntu-restricted-extras vlc kazam


  # Productivity
  sudo apt install -y evolution evolution-ews
}

apt_cuda() {
  # CUDA 3rd party Library
  sudo apt install -y g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev
}
