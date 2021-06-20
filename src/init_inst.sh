#!/usr/bin/env bash

common() {
  (basic)
  (config_sudo)

  (config_keys)
  (config_git)
  (clone_config)

  (docker)
  (mambaforge)
  (gtest)
  (awscli)

  (config_terminal)
  (config_emacs)
  (config_vim)
}

server() {
  (common)

  (shadowsocks)
}

# Stand Alone Server - no sudo permission
sa_server() {
  export NOSUDO=

  (config_keys)
  (config_git)
  (clone_config)

  (mambaforge)
  (awscli)

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
