#!/bin/bash
# evapt.sh
# @Author  : garywei944 (garywei944@gmail.com)
# @Link    : https://github.com/garywei944

# Driver
driver() {
  sudo ubuntu-drivers autoinstall
}
# Albert
albert() {
  # Ubuntu 18.04
  # yes | sudo add-apt-repository -y ppa:noobslab/macbuntu
  # sudo apt update
  # sudo apt -y install albert

  # # Make Albert autostart
  # mkdir -p ~/.config/autostart/
  # cp /usr/share/applications/albert.desktop ~/.config/autostart/
  # chmod +x ~/.config/autostart/albert.desktop

  # Ubuntu 20.04
  echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
  curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home:manuelschneid3r.gpg >/dev/null
  sudo apt update
  sudo apt install albert
}

# Chrome
chrome() {
  cd /tmp || exit
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt -y install ./google-chrome-stable_current_amd64.deb
  rm -f google-chrome-stable_current_amd64.deb

  # Gnome Chrome shell
  sudo apt -y install chrome-gnome-shell gnome-screensaver
}

# Sublime Text 3 & Sublime Merge
sublime() {
  # sudo snap install sublime-text --classic
  # sudo snap install sublime-merge --classic

  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt -y install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt update
  sudo apt -y install sublime-text
  sudo apt -y install sublime-merge
}

# Netease Music
netease_music() {
  sudo snap install netease-music --beta --devmode
}

# PyMol
pymol() {
  sudo apt -y install pymol
}

# GNome Tweaks
tweaks() {
  sudo apt -y install gnome-tweaks
}

# Wine
wine() {
  sudo apt -y install wine winetricks
}

# Steam
steam() {
  sudo apt -y install steam
}

# Timeshift
timeshift() {
  sudo add-apt-repository -y ppa:teejee2008/ppa
  sudo apt update
  sudo apt -y install timeshift
}

# Discord
discord() {
  sudo snap install discord
}

# Metasploit
metasploit() {
  curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb >msfinstall && chmod 755 msfinstall && ./msfinstall
}
