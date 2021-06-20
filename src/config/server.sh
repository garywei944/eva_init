#!/usr/bin/env bash

config_server() {
  if [ ! -d ~/.ssh ]; then ssh-keygen; fi

  cd ~/.ssh || exit
  cat id_rsa.pub >> authorized_keys
  chmod 600 authorized_keys
}
