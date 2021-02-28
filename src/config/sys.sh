#!/usr/bin/env bash

# Configure sudo without password
config_sudo() {
  echo "Defaults	editor=/usr/bin/vim
$USER	ALL=(ALL)	NOPASSWD: ALL" | sudo tee -a /etc/sudoers
}

clone_config() {
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
     cp -f "$CONFIG_DIR"/astro.zsh-theme ~/.oh-my-zsh/custom/themes/astro.zsh-theme
     # wget https://raw.githubusercontent.com/iplaces/astro-zsh-theme/master/astro.zsh-theme -o ~/.oh-my-zsh/custom/themes/astro.zsh-theme

  #   sed -i '/^ZSH_THEME=/c ZSH_THEME="astro"' ~/.zshrc
  #   sed -i '/^# DISABLE_UPDATE_PROMPT=/s/# //' ~/.zshrc
  #   sed -i '/^# export UPDATE_ZSH_DAYS=/s/# //' ~/.zshrc
  #   #  sed -i '/^# ENABLE_CORRECTION=/s/# //' ~/.zshrc
  #   sed -i '/^plugins=/c plugins=(sudo ubuntu extract git git-flow emacs sublime sublime-merge z zsh-autosuggestions zsh-syntax-highlighting)' ~/.zshrc
  #   sed -i '/^# export MANPATH=/s/# //' ~/.zshrc
  #   sed -i '/^# export LANG=/s/# //' ~/.zshrc
  #   sed -i '/^# Preferred editor/{:a;n;s/# //g;/^$/!ba}' ~/.zshrc
  #   sed -i "s/export EDITOR='vim'/export EDITOR='emacs -nw'/" ~/.zshrc
  #   sed -i "s/export EDITOR='mvim'/export EDITOR='emacs'/" ~/.zshrc

  #   # Make a welcome message
  #   cat <<"EOF" >>~/.zshrc

  # export PATH=$PATH:~/.eva/bin
  # export EVA="ariseus"

  # echo "$(echo "ariseus" | figlet)
  # Welcome back, ariseus." | lolcat
  # EOF
  echo ". ~/.config/.zshrc" >~.zshrc

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
