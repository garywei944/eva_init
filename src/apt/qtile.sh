#!/usr/bin/env bash

qtile() {
  sudo apt install -y libxcb-render0-dev libpangocairo-1.0-0
  sudo pip3 install xcffib
  sudo pip3 install --no-cache-dir cairocffi
  sudo pip3 install dbus-next

  cd /tmp || exit
  git clone git://github.com/qtile/qtile.git
  cd qtile
  sudo pip3 install .
  cd ..
  rm -fr qtile

  sudo cp -f "$CONFIG_DIR"/qtile.desktop /usr/share/xsessions/qtile.desktop
}
