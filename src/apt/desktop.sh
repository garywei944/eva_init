#!/usr/bin/env bash

# Discord
discord() {
  cd /tmp || exit
  wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
  sudo apt install -y ./discord.deb
  rm -fr discord.deb
}

# fcitx
fcitx() {
  sudo apt install -y fcitx-bin fcitx-table fcitx-anthy fcitx-mozc
}

# TexLive and Tex Maker
latex() {
  sudo apt install -y texlive-full texmaker
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
  sudo apt install -y pymol
}

# Steam
steam() {
  sudo apt install -y steam
}

# Sublime Text 3 & Sublime Merge
sublime() {
  # sudo snap install sublime-text --classic
  # sudo snap install sublime-merge --classic

  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt install -y apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt update
  sudo apt install -y sublime-text sublime-merge
}

# Timeshift
timeshift() {
  sudo add-apt-repository -y ppa:teejee2008/ppa
  sudo apt update
  sudo apt install -y timeshift
}

# Wine
wine() {
  sudo apt install -y wine winetricks
}
