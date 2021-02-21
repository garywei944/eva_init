#!/usr/bin/env bash

config_git() {
  [[ ${EVA+x} ]] || exit

  cp -f "$CONFIG_DIR"/.gitconfig ~

  # Add github.com to known_hosts
  if [ ! -d ~/.ssh ]; then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
  fi
  ssh-keyscan -H github.com >>~/.ssh/known_hosts
  chmod 644 ~/.ssh/known_hosts
}
