#!/usr/bin/env bash

qtile() {
  sudo apt install -y libxcb-render0-dev libpangocairo-1.0-0
  pip install xcffib
  pip install --no-cache-dir cairocffi
  pip install dbus-next

  cd /tmp || exit
  git clone git://github.com/qtile/qtile.git
  cd qtile
  pip install .
}
