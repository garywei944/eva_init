#!/usr/bin/env bash



# Chrome
chrome() {
}

# Discord
discord() {
  sudo snap install discord
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

# Metasploit
metasploit() {
  curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb >msfinstall && chmod 755 msfinstall && ./msfinstall
}
