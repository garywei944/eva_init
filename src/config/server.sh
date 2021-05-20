#!/usr/bin/env bash

config_server() {
  if [ ! -d ~/.ssh ]; then ssh-keygen; fi

  cd ~/.ssh || exit
  cat id_rsa.pub >> authorized_keys
  chmod 600 authorized_keys
}

# Configure shadowsocks
config_shadowsocks_server() {
  [[ ${EVA+x} ]] || exit

  sudo vim /etc/shadowsocks-libev/config.json
  sudo systemctl restart shadowsocks-libev.service
  sudo systemctl enable shadowsocks-libev.service
}
