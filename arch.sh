#!/bin/bash

# 1. update pacman
sudo pacman -Syu --noconfirm

_yay() {
  # Exit if yay installed
  [[ -n $(command -v yay) ]] && exit

  cd /tmp || exit
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay-bin.git --depth 1
  cd yay-bin || exit
  makepkg -si --needed --noconfirm

  rm -fr /tmp/yay-bin

  # Use multiple cores for make package
  echo 'MAKEFLAGS="-j$(nproc)"' | sudo tee -a /etc/makepkg.conf
}
(_yay)

_yain() {
  yay -S --noconfirm --assume-installed "$@"
}

_yain pacman-contrib

# 3. rank mirrors
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
export COUNTRY=US
curl -s "https://archlinux.org/mirrorlist/?country=US&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on" |
  sed -e 's/^#Server/Server/' -e '/^#/d' |
  rankmirrors -n 5 - |
  sudo tee /etc/pacman.d/mirrorlist

# 2. install basic packages
packages=(
  # System Essentials
  # wsl cannot install docker and docker
  git zsh net-tools openssh wget curl zip unzip rar ufw gnupg cargo inotify-tools
  # System management
  screen tmux bashtop htop fd locate ripgrep the_silver_searcher rsync traceroute
  jq ranger tree ncdu as-tree ack
  # Development Runtimes
  base-devel ruby jdk-openjdk cmake clang ghostscript ghc cabal-install readline lua
  doctest gtest catch2 spdlog nodejs npm
  python python-pip python-setuptools python-keyring python-xdg python-pipenv
  python-virtualenv python-pipx mambaforge micromamba
  # Development tools
  emacs vim gitflow-avh gdb valgrind ctags rlwrap aspell autoconf libtool colordiff
  ttf-ancient-fonts powerline-fonts ttf-fira-code dos2unix pwndbg imagemagick
  # imagemagick
  libjxl libraw libwmf libzip ocl-icd openexr djvulibre
  # cli
  # heroku-cli is too slow to install
  aws-cli-v2 act
  # Just for fun
  screenfetch neofetch lolcat figlet cowsay
  # modern linux
  bat exa lsd git-delta dust duf broot fzf mcfly choose sd cheat tldr bottom glances
  gtop hyperfine gping procs httpie curlie xh zoxide dog
)
_yain "${packages[@]}"

npm cache clean -f
sudo npm install -g n
sudo n latest

# 4. config keys
bash init.sh config_sudo
bash init.sh config_keys
bash init.sh config_git
bash init.sh config_terminal
bash init.sh config_emacs
bash init.sh config_vim
bash init.sh config_server
