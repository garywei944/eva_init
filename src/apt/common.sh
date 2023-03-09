#!/usr/bin/env bash

update() {
  sudo apt update
  sudo apt -y dist-upgrade
}

# Basic Runtime Environments
basic() {
  [[ -n ${NOSUDO+x} ]] && exit

  update

  # Install necessary ppa tools
  sudo apt install -y software-properties-common

  # Add necessary repository
  sudo add-apt-repository -y ppa:bashtop-monitor/bashtop

  # Ubuntu 22 404
  # sudo add-apt-repository -y ppa:lazygit-team/release

  sudo apt update

  # System Essentials
  sudo apt install -y git zsh net-tools openssh-server wget curl zip rar unrar ufw gpg cargo

  # System management
  sudo apt install -y screen tmux bashtop htop fd-find locate ripgrep silversearcher-ag rsync numlockx traceroute jq pulseaudio ranger tree ncdu

  sudo ln -s /usr/bin/fdfind /usr/bin/fd

  # Development Runtimes
  # Ubuntu 22: remove python
  sudo apt install -y build-essential default-jdk python3 python3-pip virtualenv python3-venv cmake clang ghostscript cabal-install libreadline-dev lua5.3 doctest

  # Development tools
  # Ubuntu 22: remove lazygit, change ctags to universal-ctags
  sudo apt install -y emacs vim git-flow gdb valgrind universal-ctags checkinstall rlwrap aspell autoconf libtool colordiff shc ttf-ancient-fonts fonts-powerline fonts-firacode dos2unix

  # pwndbg
  (_pwndbg)

  # as-tree
  cargo install -f --git https://github.com/jez/as-tree

  # SDKMAN
  (_sdkman)

  # Install nodejs and update to latest
  sudo apt install -y nodejs npm
  npm cache clean -f
  sudo npm install -g n
  sudo n latest

  # Heroku
  # sudo snap install --classic heroku
  curl https://cli-assets.heroku.com/install.sh | sh

  # Just for fun
  sudo apt install -y screenfetch neofetch lolcat figlet fortune cowsay linuxlogo

  # Deprecated
  # sudo apt install -y python-pip
}

_sdkman() {
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
}

_pwndbg() {
  cd ~/.local/share || exit
  git clone --depth 1 https://github.com/pwndbg/pwndbg
  cd pwndbg || exit
  ./setup.sh
}

_neofetch() {
  cd /tmp || exit
  git clone --depth 1 https://github.com/dylanaraps/neofetch
  cd neofetch || exit
  #  PREFIX=~/.local make install
  sed -i 's/\/usr/$(HOME)\/.local/g' Makefile
  make install
}

_figlet() {
  cd /tmp || exit
  git clone --depth 1 https://github.com/cmatsuoka/figlet.git
  cd figlet || exit
  sed -i 's/\/usr\/local/$(HOME)\/.local/g' Makefile
  make install
}

# Stand alone common
sa_common() {
  [[ -z ${NOSUDO+x} ]] && exit

  curl https://sh.rustup.rs -sSf | sh

  source "$HOME/.cargo/env"

  cargo install fd-find
  cargo install ripgrep
  cargo install -f --git https://github.com/jez/as-tree

  #  (_pwndbg)  # pwndbg now requires sudo
  (_neofetch)
  (_figlet)
  cargo install lolcat
}
