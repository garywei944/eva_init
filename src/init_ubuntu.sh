#!/usr/bin/env bash

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
