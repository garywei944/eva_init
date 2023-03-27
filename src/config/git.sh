#!/usr/bin/env bash

# Add github.com to known_hosts
config_git() {
  mkdir -p ~/.ssh
  ssh-keygen -R github.com
  #  ssh-keyscan github.com >> ~/.ssh/known_hosts
  curl -L https://api.github.com/meta | jq -r '.ssh_keys | .[]' | sed -e 's/^/github.com /' >>~/.ssh/known_hosts
  chmod 700 ~/.ssh
  chmod 644 ~/.ssh/known_hosts
}
