#!/usr/bin/env bash

# Discord
discord() {
  cd /tmp || exit
  wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
  sudo apt install -y ./discord.deb
  rm -fr discord.deb
}

# Metasploit
metasploit() {
  curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb >msfinstall && chmod 755 msfinstall && ./msfinstall
}

# Netease Music
netease_music() {
  # sudo snap install netease-music --beta --devmode
  cd /tmp || exit
  wget -O netease-music.deb "https://d1.music.126.net/dmusic/netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb"
  sudo apt install -y ./netease-music.deb
  rm -fr netease-music.deb
}

# PyMol
pymol() {
  sudo apt -y install pymol
}

# Steam
steam() {
  sudo apt -y install steam
}

# Sublime Text 3 & Sublime Merge
sublime() {
  # sudo snap install sublime-text --classic
  # sudo snap install sublime-merge --classic

  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt -y install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt update
  sudo apt -y install sublime-text sublime-merge
}

# GNome Tweaks
tweaks() {
  sudo apt -y install gnome-tweaks
}

# Wine
wine() {
  sudo apt -y install wine winetricks
}

# Timeshift
timeshift() {
  sudo add-apt-repository -y ppa:teejee2008/ppa
  sudo apt update
  sudo apt -y install timeshift
}
