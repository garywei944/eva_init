#!/bin/bash

# Make sure that $PWD is the directory of the script
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)
cd "$DIR" || exit

# Load functions
. src/evaapt.sh
. src/evaconfig.sh

common() {
  basic
  gtest
  awscliv2

  config_sudo
  config_key
  config_git
  config_terminal
}

init() {
  common
  apt_cuda
  disable_nouveau
  driver

  config_sys
  config_time
  config_cuda_11
}

ubuntu() {
  apt_desktop

  chrome
  sublime
  docker
  albert
  netease_music
  discord
  pymol
  tweaks
  wine
  steam
  timeshift
  metasploit

  config_sublime
  config_vagrant
}

wsl() {
  sudo apt remove -y --purge openssh-server
  common

  config_server
}

vagrant() {
  common
  config_server
}

server() {
  common

  config_shadowsocks
}

for cmd in "$@"; do
  $cmd
done
