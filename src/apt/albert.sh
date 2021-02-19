#!/usr/bin/env bash

# Albert
albert() {
  # Ubuntu 18.04
  # yes | sudo add-apt-repository -y ppa:noobslab/macbuntu
  # sudo apt update
  # sudo apt -y install albert

  # # Make Albert autostart
  # mkdir -p ~/.config/autostart/
  # cp /usr/share/applications/albert.desktop ~/.config/autostart/
  # chmod +x ~/.config/autostart/albert.desktop

  # Ubuntu 20.04
  echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
  curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home:manuelschneid3r.gpg >/dev/null
  sudo apt update
  sudo apt -y install albert
}
