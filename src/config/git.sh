#!/usr/bin/env bash

# Add github.com to known_hosts
config_git() {
  cd /tmp
  ssh-keyscan github.com >>githubKey
  local FINGERPRINT
  FINGERPRINT=$(ssh-keygen -lf githubKey)

  # Not secure enough but anyway hard coded check the FINGERPRINT.
  if [[ $FINGERPRINT == '2048 SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8 github.com (RSA)' ]]; then
    mkdir -p ~/.ssh
    cat 'githubKey' >> ~/.ssh/known_hosts
    chmod 700 ~/.ssh
    chmod 644 ~/.ssh/known_hosts
  else
    echo "Network not secure! The expected finger print for github.com is
    2048 SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8 github.com (RSA)
    But now we have
    $FINGERPRINT"
    kill -SIGKILL $BASHID $$ $PPID
  fi

  rm -f githubKey
}
