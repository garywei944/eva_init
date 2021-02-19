#!/usr/bin/env bash

common() {
  basic
  gtest
  awscliv2

  config_sudo
  config_key
  config_git
  config_terminal
}

ubuntu() {
  common

  apt_cuda
  disable_nouveau
  driver

  config_sys
  config_time
  config_cuda_11

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

server() {
  common

  config_shadowsocks
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
