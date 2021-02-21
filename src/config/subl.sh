#!/usr/bin/env bash

# Configure Sublime Text
config_sublime() {
  [[ ${EVA+x} ]] || exit

  # Configure sublime text 3
  cd ~/.config || exit
  mkdir -p sublime-text-3/Installed\ Packages
  cd sublime-text-3/Installed\ Packages || exit
  wget https://packagecontrol.io/Package%20Control.sublime-package -O Package\ Control.sublime-package
  cd ..
  rm -fr Packages
  git clone git@github.com:garywei944/aris_st3.git Packages

  # Configure codeintel
  mkdir -p ~/.codeintel
  cp -f "$CONFIG_DIR"/config.log ~/.codeintel/config.log

  # Install Sublime Text Dependencies
  pip install --upgrade --pre CodeIntel || pip3 install --upgrade --pre CodeIntel
  sudo npm install -g jshint csslint xg-htmlhint
  sudo npm install -g browser-sync
}
