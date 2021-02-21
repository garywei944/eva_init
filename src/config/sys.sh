#!/usr/bin/env bash

# Configure sudo without password
config_sudo() {
  echo "Defaults	editor=/usr/bin/vim
$USER	ALL=(ALL)	NOPASSWD: ALL" | sudo tee -a /etc/sudoers
}

# Configuration Terminal
config_terminal() {
  [[ ${EVA+x} ]] || exit

  # Configure zsh
  chsh -s /bin/zsh
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

  cp -f "$CONFIG_DIR"/.zshrc ~/.zshrc
  cp -f "$CONFIG_DIR"/astro.zsh-theme ~/.oh-my-zsh/custom/themes/astro.zsh-theme
  # wget https://raw.githubusercontent.com/iplaces/astro-zsh-theme/master/astro.zsh-theme -o ~/.oh-my-zsh/custom/themes/astro.zsh-theme

  # Clone .eva repo to ~/.eva
  git clone git@github.com:garywei944/eva_bin.git ~/.eva
}

# Configure conda environment
config_conda() {
  [[ ${EVA+x} ]] || exit

  cp -f "$CONFIG_DIR"/.condarc ~
}

# Configure Vagrant
config_vagrant() {
  cp -f "$CONFIG_DIR"/Vagrantfile ~
}
