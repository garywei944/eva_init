#!/usr/bin/env bash

awscli() {
  cd /tmp || exit
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip

  mkdir -p ~/.local/bin
  ./aws/install -b ~/.locl/bin/aws
  rm -fr aws awscliv2.zip
}
