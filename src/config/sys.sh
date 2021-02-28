#!/usr/bin/env bash

# Configure sudo without password
config_sudo() {
  echo "Defaults	editor=/usr/bin/vim
$USER	ALL=(ALL)	NOPASSWD: ALL" | sudo tee -a /etc/sudoers
}

clone_config() {
  [[ ${EVA+x} ]] || exit
  
  cd ~/.config || exit
  rm -fr .git
  git init
  echo '*' > .gitignore
  git remote add origin git@github.com:garywei944/.config.git
  git fetch
  git checkout main
}

# Configuration Terminal
config_terminal() {
  [[ ${EVA+x} ]] || exit

  # Configure zsh
  chsh -s /bin/zsh || sudo vim /etc/passwd
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

  cd /tmp
  git clone git@github.com:iplaces/astro-zsh-theme.git
  mv astro-zsh-theme/astro.zsh-theme ~/.oh-my-zsh/custom/themes
  rm -fr astro-zsh-theme

  cp ~/.zshrc ~/.zshrc.bak
  echo ". ~/.config/.zshrc" >~/.zshrc

  # Clone .eva repo to ~/.eva
  git clone git@github.com:garywei944/eva_bin.git ~/.eva
}

# Configure conda environment
config_conda() {
  [[ ${EVA+x} ]] || exit

  #  cp -f "$CONFIG_DIR"/.condarc ~
  cd ~ || exit
  rm -f .condarc
  ln -s .config/.condarc .
}

# Configure Vagrant
config_vagrant() {
  cp -f "$CONFIG_DIR"/Vagrantfile ~
}
