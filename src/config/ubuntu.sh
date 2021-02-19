#!/usr/bin/env bash

# Configure System
config_sys() {
  sudo vim /etc/default/grub
  sudo update-grub

  # Trick here to mkdir in child process s.t. $PWD doesn't change
  eval "$(cd /mnt && sudo mkdir windows adam kiana misaki asuka)"
  cat <"$CONFIG_DIR"/fstab | sudo tee -a /etc/fstab
}

# Set system time
config_time() {
  sudo timedatectl set-local-rtc 1
  sudo apt -y install ntpdate
  sudo ntpdate time.windows.com
  sudo hwclock --localtime --systohc
}

# Disable Nouveau
disable_nouveau() {
  cat <<"EOF" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf >/dev/null
blacklist nouveau
options nouveau modeset=0
EOF
  sudo update-initramfs -u
}

# Configure cuda 11
config_cuda_11() {
  cat <<"EOF" >>~/.bashrc
export PATH=/usr/local/cuda-11.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
EOF
}
