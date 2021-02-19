#!/usr/bin/env bash

config_server() {
  cd ~/.ssh || exit
  cat id_rsa.pub >>authorized_keys
  chmod 600 authorized_keys
}

# Configure shadowsocks
config_shadowsocks() {
  sudo vim /etc/shadowsocks-libev/config.json
  sudo systemctl restart shadowsocks-libev.service
  sudo systemctl enable shadowsocks-libev.service
}
