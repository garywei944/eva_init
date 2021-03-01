#!/usr/bin/env bash

clean_desktop() {
  # gnome terminal
  #	sudo apt purge -y gnome-terminal\*

  # firefox
  cd ~
  sudo apt purge -y firefox\*
  rm -fr .mozilla .macromedia .adobe
  sudo rm -fr /etc/firefox /usr/lib/firefox /usr/lib/firefox-addons

  # ibus
  #	sudo apt purge -y ibus\*

  # Thunderbird
  sudo apt purge -y thunderbird\*

  sudo apt autoremove -y
}
