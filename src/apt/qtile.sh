#!/usr/bin/env bash

qtile() {
  sudo apt-get install libxcb-render0-dev
  pip install xcffib
  pip install --no-cache-dir cairocffi
  sudo apt install -y libpangocairo-1.0-0
  pip install dbus-next

  cd /tmp || exit
  git clone git://github.com/qtile/qtile.git
  cd qtile
  pip install .
}
