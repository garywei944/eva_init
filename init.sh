#!/usr/bin/env bash

# Make sure that $PWD is the directory of the script
EVA_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)
CONFIG_DIR="$EVA_ROOT"/config

cd "$EVA_ROOT" || exit

init() {
  common
  apt_cuda
  disable_nouveau
  driver

  config_sys
  config_time
  config_cuda_11
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
