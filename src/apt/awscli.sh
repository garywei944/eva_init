#!/usr/bin/env bash

awscli() {
  cd /tmp || exit
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  rm -fr aws awscliv2.zip
}
