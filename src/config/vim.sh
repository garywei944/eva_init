#!/usr/bin/env bash

config_vim() {
  mkdir -p ~/.vim/pack/vendor/start ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo

  #tender
  git clone https://github.com/jacoborus/tender.vim ~/.vim/pack/vendor/start/tendor

  # nerdtree
  git clone https://github.com/scrooloose/nerdtree ~/.vim/pack/vendor/start/nerdtree

  # mru
  sudo apt -y install fzf

  # ag
  git clone https://github.com/lvht/fzf ~/.vim/pack/vendor/start/fzf

  cp -f "$CONFIG_DIR"/.vimrc ~
}
