#!/usr/bin/env bash

common() {
  (basic)
  (config_sudo)

  (config_keys)
  (config_git)
  (clone_config)

  (docker)
  (anaconda)
  (gtest)
  (awscli)

  (config_terminal)
  (config_emacs)
  (config_vim)
}

apps() {
  local app
  while read -r app; do
    ($app)
  done <"$EVA_ROOT"/optional_apps.txt
}

ariseus() {
  (update)
  (apt_cuda)
  # (driver)

  (config_sys)
  (config_time)

  (desktop)
}

desktop() {
  (common)

  (apt_desktop)
  (sublime)

  (config_sublime)
  (gnome_themes)

  (apps)
}

server() {
  (common)

  (config_shadowsocks_server)
}

wsl() {
  sudo apt remove -y --purge openssh-server
  (common)

  (config_wsl)
  (config_server)
}

vagrant() {
  (common)
  (config_server)
}
