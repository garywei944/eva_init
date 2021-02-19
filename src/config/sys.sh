#!/usr/bin/env bash

# Configure sudo without password
config_sudo() {
  echo "Defaults	editor=/usr/bin/vim
$USER	ALL=(ALL)	NOPASSWD: ALL" | sudo tee -a /etc/sudoers
}

# Configuration Terminal
config_terminal() {
  # Configure zsh
  chsh -s /bin/zsh
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

  cp -f "$CONFIG_DIR"/.zshrc ~/.zshrc
  cp -f "$CONFIG_DIR"/astro.zsh-theme ~/.oh-my-zsh/custom/themes/astro.zsh-theme
  # wget https://raw.githubusercontent.com/iplaces/astro-zsh-theme/master/astro.zsh-theme -o ~/.oh-my-zsh/custom/themes/astro.zsh-theme

  # Configure emacs
  rm -fr ~/.emacs.d
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
  cp -f "$CONFIG_DIR"/.spacemacs ~
  # curl -sLf https://spacevim.org/install.sh | bash
  # curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall

  # Clone .eva repo to ~/.eva
  git clone git@github.com:garywei944/eva_bin.git ~/.eva
}

config_git() {
  cp -f "$CONFIG_DIR"/.gitconfig ~

  # Add github.com to known_hosts
  if [ ! -d ~/.ssh ]; then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
  fi
  ssh-keyscan -H github.com >>~/.ssh/known_hosts
  chmod 644 ~/.ssh/known_hosts
}

# Configure conda environment
config_conda() {
  # Please make sure that anaconda or miniconda is installed in the system
  cp -f "$CONFIG_DIR"/.condarc ~
  conda env create -f "$CONFIG_DIR"
}

# Configure Vagrant
config_vagrant() {
  cp -f "$CONFIG_DIR"/Vagrantfile ~
}
