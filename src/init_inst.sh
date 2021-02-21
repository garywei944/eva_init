#!/usr/bin/env bash

common() {
  basic
  gtest
  awscli

  config_sudo

  # The following functions are implemented s.t. if $EVA is not set, it would not do anything
  config_keys
  config_git
  config_terminal
  config_vim
  config_conda
}

ariseus() {
  common
  apt_cuda

  config_sys
  config_time

  apt_desktop
  sublime

  config_sublime
  config_vagrant

  local app
  while read -r app; do
    $app
  done <"$EVA_ROOT"/optional_apps.txt
}

desktop() {
  common

  apt_desktop
  sublime

  config_sublime

  local app
  while read -r app; do
    $app
  done <"$EVA_ROOT"/optional_apps.txt
}

server() {
  common

  config_shadowsocks_server
}

wsl() {
  sudo apt remove -y --purge openssh-server
  common

  config_wsl
  config_server
}

vagrant() {
  common
  config_server
}
