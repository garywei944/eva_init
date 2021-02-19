#!/usr/bin/env bash

config_vim() {
  mkdir -p ~/.vim/pack/vendor/start ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo

  #tender
  git clone https://github.com/jacoborus/tender.vim ~/.vim/pack/vendor/start/tendor

  # nerdtree
  git clone https://github.com/scrooloose/nerdtree ~/.vim/pack/vendor/start/nerdtree

  # mru
  git clone https://github.com/lvht/mru ~/.vim/pack/vendor/start/mru

  # fzf
  sudo apt -y install fzf
  git clone https://github.com/lvht/fzf ~/.vim/pack/vendor/start/fzf

  # ag
  git clone https://github.com/mileszs/ack.vim ~/.vim/pack/vendor/start/ack
  sudo apt -y install ack-grep silversearcher-ag

  cp -f "$CONFIG_DIR"/.vimrc ~
}
