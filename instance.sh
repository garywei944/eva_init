#!/usr/bin/env bash

common() {
  (basic)
  (config_sudo)

  (config_keys)
  (config_git)
  (clone_config)

  (_docker)
  (_docker_compose)
  (_cargo)
  (_mambaforge)
  (_gtest)
  (_awscli)

  (config_terminal)
  (config_emacs)
  (config_vim)
}

server() {
  (common)

  (_shadowsocks)
}

# Stand Alone Server - no sudo permission
sa_server() {
  export NOSUDO=

  (config_keys)
  (config_git)
  (clone_config)

  (sa_common)
  (_mambaforge)
  (_awscli)

  (config_terminal)
  (config_emacs)
  (config_vim)
  (config_server)
}

wsl() {
  sudo apt purge -y openssh-server
  (common)

  (config_wsl)
  (config_server)
}

vagrant() {
  (common)
  (config_server)
}
