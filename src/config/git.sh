#!/usr/bin/env bash

# Add github.com to known_hosts
config_git() {
  mkdir -p ~/.ssh
  ssh-keyscan github.com >> ~/.ssh/known_hosts
  chmod 700 ~/.ssh
  chmod 644 ~/.ssh/known_hosts
}
