#!/usr/bin/env bash

config_wsl() {
  SSHD_PORT=2233
  SSHD_FILE=/etc/ssh/sshd_config
  SUDOERS_FILE=/etc/sudoers

  sudo cp $SSHD_FILE ${SSHD_FILE}."$(date '+%Y-%m-%d_%H-%M-%S')".back
  sudo sed -i '/^Port/ d' $SSHD_FILE
  sudo sed -i '/^PasswordAuthentication/ d' $SSHD_FILE
  echo "Port ${SSHD_PORT}" | sudo tee -a $SSHD_FILE
  echo "PasswordAuthentication yes" | sudo tee -a $SSHD_FILE
  sudo service ssh --full-restart

  sed -i '/^sudo service ssh --full-restart/ d' ~/.bashrc
  sed -i '/^sudo service ssh --full-restart/ d' ~/.zshrc
  echo "%sudo ALL=(ALL) NOPASSWD: /usr/sbin/service ssh --full-restart" | sudo tee -a $SUDOERS_FILE
  cat <<'EOF' >>~/.zshrc
sshd_status=$(service ssh status)
if [[ $sshd_status = *"is not running"* ]]; then
  sudo service ssh --full-restart
fi
EOF

  sudo apt install -y cmake gcc clang gdb valgrind build-essential
}
