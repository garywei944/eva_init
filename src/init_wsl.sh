#!/usr/bin/env bash

wsl() {
  sudo apt remove -y --purge openssh-server
  common

  config_server
}
