#!/usr/bin/env bash

# Configure sudo without password
config_sudo() {
  echo "Defaults	editor=/usr/bin/vim
$USER	ALL=(ALL)	NOPASSWD: ALL" | sudo tee -a /etc/sudoers
}

clone_config() {
  [[ ${EVA+x} ]] || exit

  cd ~ || exit
  rm -fr .git
  git init
  git remote add origin git@github.com:garywei944/eva_arch.git
  git config core.excludesFile .eva.gitignore
  git fetch --depth=1
  git reset --hard origin/main
  git branch -m master main
  git branch --set-upstream-to=origin/main main
}

# Configuration Terminal
config_terminal() {
  [[ ${EVA+x} ]] || exit

  # Configure zsh
  # https://unix.stackexchange.com/a/26782
  #  chsh -s /bin/zsh || cat <<'EOF' >>~/.bashrc
  #if [[ -n $SSH_TTY && $SHLVL == 1 && -n $(command -v zsh) ]]; then
  #  zsh --login
  #  exit
  #fi
  #EOF
  chsh -s /bin/zsh || cat <<'EOF' >>~/.bashrc
if shopt -q login_shell; then  # If this is a login shell
  if [[ $- == *i* && -n $(command -v zsh) ]]; then
    zsh --login
    exit
  fi
fi
EOF

  # sudo vim /etc/passwd
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh_custom/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh_custom/plugins/zsh-syntax-highlighting

  echo '. ~/.config/rc.zsh' >~/.zshrc

  # Config
  if [[ ! -d ~/.ssh ]]; then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
  fi
  echo 'Include ~/.config/ssh.conf' >>~/.ssh/config
}
