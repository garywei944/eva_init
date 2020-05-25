t#!/bin/bash

# Up to date
sudo apt update
sudo apt -y upgrade

# Install Driver
sudo ubuntu-drivers autoinstall

# System setup
# cd /
# sudo swapoff swapfile
# sudo rm swapfile
# sudo dd if=/dev/zero of=swapfile bs=1024 count=33554432
# sudo chmod 600 swapfile
# sudo mkswap -f swapfile
# sudo swapon swapfile

# Install basic softwares
sudo apt -y install zsh zsh-doc wget curl rsync net-tools zip emacs vim git git-flow screen dos2unix build-essential default-jdk python python-pip python3 python3-pip virtualenv nodejs npm cmake clang gdb valgrind ctags build-essential libgtest-dev openssh-server rar shc

# Install GooleTest
cd /usr/src/googletest
sudo mkdir build
cd build
sudo cmake ..
sudo make
sudo make install
sudo ln -s /usr/local/lib/libgtest.a /usr/lib/libgtest.a
sudo ln -s /usr/local/lib/libgtest_main.a /usr/lib/libgtest_main.a
cd ..
sudo rm -fr build

# Configuration git
echo '[user]
	name = garywei944
	email = 33930674+garywei944@users.noreply.github.com
[core]
	editor = vim
	autocrlf = input
[alias]
	apply-gitignore = !git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached' > ~/.gitconfig

ssh-keyscan -H github.com >> ~/.ssh/known_hosts

# Configure System
sudo vim /etc/default/grub
sudo update-grub
echo "Defaults	editor=/usr/bin/vim
aris	ALL=(ALL)	NOPASSWD: ALL" | sudo tee -a /etc/sudoers
cd /mnt
sudo mkdir windows adam kiana
echo 'UUID=2F4E51DDBA454123	/mnt/windows	ntfs	defaults	0	0
UUID=09C1B27DA5EB573A	/mnt/adam	ntfs	defaults	0	0
UUID=2896A4A90E3A7893	/mnt/kiana	ntfs	defaults	0	0' | sudo tee -a /etc/fstab

# Albert
sudo add-apt-repository ppa:noobslab/macbuntu
sudo apt update
sudo apt -y install albert
mkdir -p ~/.config/autostart/
cp /usr/share/applications/albert.desktop ~/.config/autostart/
chmod +x ~/.config/autostart/albert.desktop

# Chrome
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

# Sublime Text 3 & Sublime Merge
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt -y install sublime-text sublime-merge
cd ~/.config
mkdir -p sublime-text-3/Installed\ Packages
cd sublime-text-3/Installed\ Packages
wget https://packagecontrol.io/Package%20Control.sublime-package -O Package\ Control.sublime-package
cd ..
rm -fr Packages
git clone git@github.com:garywei944/aris_st3.git Packages

# Configuration Terminal
chsh -s /bin/zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
git clone git@github.com:garywei944/eva_bin.git ~/.eva
echo 'export PATH=$PATH:~/.eva/bin' >> ~/.zshrc
# curl -sLf https://spacevim.org/install.sh | bash
# curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall
# rm -fr .emacs.d
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Get ssh private key
# ./eva_id_rsa

# Making directories and symbolic links
cd ~
mkdir Projects
# cd Desktop
# ln -s /mnt/windows
# ln -s /mnt/adam
# ln -s /mnt/kiana
# ln -s ~/Projects

# Install Sublime Text Dependencies
sudo -H pip3 install -U pip
sudo -H pip3 install --upgrade --pre CodeIntel
sudo -H npm install -g jshint csslint xg-htmlhint

# Install Python3.8.3
cd /tmp
sudo apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev liblzma-dev
wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz
tar xvzf Python-3.8.3.tgz
cd Python-3.8.3
./configure --enable-optimizations
make -j 12
sudo -H make altinstall
# sudo ln -fs /usr/local/bin/python3.8 /usr/bin/python3.8
# sudo ln -fs /usr/local/bin/pip3.8 /usr/bin/pip3.8
cd ..
rm -fr Python-3.8.3.tgz Python-3.8.3

# Install Pycharm
sudo snap install pycharm-professional --classic
mkdir -p ~/.config/JetBrains/PyCharm2020.1/jba_config/linux.keymaps/
echo '<keymap version="1" name="Ar1S" parent="Sublime Text">
  <action id="ActivateMessagesToolWindow">
    <keyboard-shortcut first-keystroke="alt 0" />
    <keyboard-shortcut first-keystroke="ctrl back_quote" />
  </action>
  <action id="ActivateTerminalToolWindow">
    <keyboard-shortcut first-keystroke="alt f12" />
    <keyboard-shortcut first-keystroke="shift ctrl t" />
  </action>
  <action id="CMake.CompileCurrentFile" />
  <action id="CloseAllEditors">
    <keyboard-shortcut first-keystroke="shift ctrl w" />
  </action>
  <action id="Console.TableResult.SetNull" />
  <action id="Debug">
    <keyboard-shortcut first-keystroke="shift f9" />
    <keyboard-shortcut first-keystroke="shift ctrl b" />
  </action>
  <action id="EditorSelectLine">
    <keyboard-shortcut first-keystroke="ctrl l" />
  </action>
  <action id="FileChooser.NewFile">
    <keyboard-shortcut first-keystroke="ctrl alt n" />
  </action>
  <action id="Inline" />
  <action id="QuickChangeScheme" />
  <action id="ReformatCode">
    <keyboard-shortcut first-keystroke="ctrl alt f" />
    <keyboard-shortcut first-keystroke="ctrl alt l" />
  </action>
  <action id="ReopenClosedTab" />
  <action id="RestoreDefaultLayout">
    <keyboard-shortcut first-keystroke="shift ctrl alt r" />
  </action>
  <action id="Run">
    <keyboard-shortcut first-keystroke="shift f10" />
    <keyboard-shortcut first-keystroke="ctrl b" />
  </action>
  <action id="ServiceView.ShowServices" />
  <action id="SplitVertically">
    <keyboard-shortcut first-keystroke="shift alt 2" />
  </action>
  <action id="UnsplitAll">
    <keyboard-shortcut first-keystroke="shift alt 1" />
  </action>
</keymap>' > ~/.config/JetBrains/PyCharm2020.1/jba_config/linux.keymaps/Ar1S.xml

# Install Virtual Box
cd /tmp
wget https://download.virtualbox.org/virtualbox/6.1.8/virtualbox-6.1_6.1.8-137981~Ubuntu~bionic_amd64.deb
wget https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb
sudo apt -y install ./virtualbox* ./vagrant*
rm -f virtualbox* vagrant*

# Configure Vagrant
cd ~
echo 'Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
end
' > Vagrantfile

# Install Docker
sudo apt remove -y docker docker-engine docker.io containerd runc
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo gpasswd -a ${USER} docker

# Install VMware
# YG5H2-ANZ0H-M8ERY-TXZZZ-YKRV8
cd /tmp
wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-15.5.2-15785246.x86_64.bundle
chmod +x VMware*
sudo ./VMware-Workstation-Full-15.5.2-15785246.x86_64.bundle
rm -fr VMware*

# Install CUDA
cd /tmp
wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
sudo sh cuda_10.2.89_440.33.01_linux.run
rm -fr cuda_10.2.89_440.33.01_linux.run
echo 'export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/nsight-compute-2019.5.0${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.zshrc
sudo apt -y install nvidia-nsight
sudo update-alternatives --config java

# Install cuDNN
cd /tmp
read Need to manaully download cuDNN
sudo apt -y install ./libcudnn*
sudo apt -y install python3-pip python3-tk
sudo -H pip3 install numpy scipy matplotlib pillow

# Install Anaconda3
cd /tmp
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
sudo sh Anaconda3*

# Install Gnome Chrome shell
sudo apt -y install chrome-gnome-shell
