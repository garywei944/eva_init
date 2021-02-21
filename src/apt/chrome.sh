#!/usr/bin/env bash

chrome() {
  cd /tmp || exit
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt -y install ./google-chrome-stable_current_amd64.deb
  rm -f google-chrome-stable_current_amd64.deb

  # Gnome Chrome shell
  sudo apt -y install chrome-gnome-shell gnome-screensaver
}
