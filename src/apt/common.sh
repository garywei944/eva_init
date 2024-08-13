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
  . "$HOME/.sdkman/bin/sdkman-init.sh"
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

_nerd_fonts() {
  cd /tmp || exit
  git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
  cd nerd-fonts || exit
  ./install.sh
}

_duf() {
  cd /tmp || exit
  git clone --depth 1 https://github.com/muesli/duf.git
  cd duf || exit
  go build
  mv duf ~/.local/bin
}

_fzf() {
  cd /tmp || exit
  git clone --depth 1 https://github.com/junegunn/fzf.git
  cd fzf || exit
  yes | ./install
}

_mcfly() {
  curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh |
    sh -s -- --git cantino/mcfly --to ~/.local/bin
}

_cheat() {
  cd /tmp || exit
  wget https://github.com/cheat/cheat/releases/download/4.4.2/cheat-linux-amd64.gz &&
    gunzip cheat-linux-amd64.gz &&
    chmod +x cheat-linux-amd64 &&
    mv cheat-linux-amd64 ~/.local/bin/cheat
}

_bashtop() {
  cd /tmp || exit
  pip3 install bpytop --upgrade
  git clone --depth 1 https://github.com/aristocratos/bashtop.git
  cd bashtop || exit
  make install PREFIX=~/.local
}

# Stand alone common
sa_common() {
  [[ -z ${NOSUDO+x} ]] && exit

  curl https://sh.rustup.rs -sSf | sh

  . "$HOME/.cargo/env"

  # bashtop
  (_bashtop)

  # fd
  cargo install fd-find
  # rg
  cargo install ripgrep
  # as-tree
  cargo install -f --git https://github.com/jez/as-tree
  # bat
  cargo install --locked bat
  # eza
  cargo install eza
  # lsd
  cargo install lsd
  # delta
  cargo install git-delta
  # dust
  cargo install du-dust
  # duf
  (_duf)
  # broot
  cargo install --locked --features clipboard broot
  # fzf
  (_fzf)
  # mcfly
  (_mcfly)
  # choose
  cargo install choose
  # jq
  curl -s https://webinstall.dev/jq | bash
  # sd
  cargo install sd
  # bottom
  cargo install bottom --locked
  # hyperfine
  cargo install --locked hyperfine
  # gping
  cargo install gping
  # procs
  cargo install procs
  # curlie
  curl -sS https://webinstall.dev/curlie | bash
  # xh
  curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh
  # zoxide
  cargo install zoxide --locked

  # might be installed by pip
  pip install --user tldr
  pip install --user glances
  pip install --user httpie

  # doggo
  curl -sS https://raw.githubusercontent.com/mr-karan/doggo/main/install.sh | sh

  #  (_pwndbg)  # pwndbg now requires sudo
  (_neofetch)
  (_figlet)
  cargo install lolcat
}
