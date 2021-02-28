#!/usr/bin/env bash

# Configure System
config_sys() {
  [[ ${EVA+x} ]] || exit

  # Update grub
  sudo vim /etc/default/grub
  sudo update-grub

  # Configure /mnt to auto mount windows partitions
  (cd /mnt && sudo mkdir windows adam kiana misaki asuka)
  cat <"$CONFIG_DIR"/fstab | sudo tee -a /etc/fstab

  # Update /etc/systemd/system.conf s.t. to power off faster
  sudo sed -i '/DefaultTimeoutStopSec=/c DefaultTimeoutStopSec=1s' /etc/systemd/system.conf
  sudo systemctl daemon-reload

  sudo nfw enable
}

# Set system time
config_time() {
  sudo timedatectl set-local-rtc 1
  sudo apt install -y ntpdate
  sudo ntpdate time.windows.com
  sudo hwclock --localtime --systohc
}

# Driver
driver() {
  sudo ubuntu-drivers autoinstall
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

gnome_themes() {
  sudo apt install -y gnome-tweaks gnome-shell-extensions gnome-tweak-tool chrome-gnome-shell

  mkdir -p ~/.icons ~/.themes
  unzip "$EVA_ROOT"/assets/icons.zip -d ~/.icons
  unzip "$EVA_ROOT"/assets/themes.zip -d ~/.themes
}
