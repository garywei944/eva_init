#!/usr/bin/env bash

config_emacs() {
  [[ ${EVA+x} ]] || exit

  # Configure emacs
  rm -fr ~/.emacs.d ~/.spacemacs ~/.spacemacs.env
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
  cp -f "$CONFIG_DIR"/.spacemacs ~
}
