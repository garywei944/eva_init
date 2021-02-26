#!/usr/bin/env bash

config_git() {
  [[ ${EVA+x} ]] || exit

  #  cp -f "$CONFIG_DIR"/.gitconfig ~
  cd ~ || exit
  rm -f .gitconfig
  ln -s .config/.gitconfig .

  # Add github.com to known_hosts
  mkdir -p ~/.ssh
  chmod 700 ~/.ssh
  ssh-keyscan -H github.com >>~/.ssh/known_hosts
  chmod 644 ~/.ssh/known_hosts
}
