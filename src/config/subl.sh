#!/usr/bin/env bash

# Configure Sublime Text
config_sublime() {
  # Download sublime configuration files
  "$SRC_DIR"/bin/_subl.sh

  # Install Sublime Text Dependencies
  pip install --upgrade --pre CodeIntel || pip3 install --upgrade --pre CodeIntel
  sudo npm install -g jshint csslint xg-htmlhint
  sudo npm install -g browser-sync
}
