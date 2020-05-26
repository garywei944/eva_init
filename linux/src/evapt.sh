#!/bin/bash
# evapt.sh
# @Author  : garywei944 (garywei944@gmail.com)
# @Link    : https://github.com/garywei944


update() {
	sudo apt update
	sudo apt -y upgrade
}

# Basic Runtime Environments
basic() {
	update

	# System Essentials
	sudo apt -y install zsh screen net-tools openssh-server wget curl zip rar dos2unix

	# Development Runtimes
	sudo apt -y install emacs vim git git-flow build-essential default-jdk python python-pip python3 python3-pip virtualenv python3-venv nodejs npm cmake clang gdb valgrind ctags

	# Beta
	sudo apt -y install rsync shc zsh-doc
}

# Driver
driver() {
	sudo ubuntu-drivers autoinstall
}

# Install Python3.8.3
# @version
python38() {
	cd /tmp
	sudo apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev liblzma-dev
	wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz
	tar xvzf Python-3.8.3.tgz
	cd Python-3.8.3
	./configure --enable-optimizations
	sudo make -j $(nproc)
	sudo -H make altinstall
	# sudo ln -fs /usr/local/bin/python3.8 /usr/bin/python3.8
	# sudo ln -fs /usr/local/bin/pip3.8 /usr/bin/pip3.8
	cd ..
	rm -fr Python-3.8.3.tgz Python-3.8.3
}


# Anaconda3
# @version
anaconda3() {
	cd /tmp
	wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
	sudo sh Anaconda3*
	rm -f Anaconda3*
	cat << "EOF" >> ~/.zshrc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aris/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aris/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aris/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aris/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
EOF
}

# GooleTest
gtest() {
	sudo apt -y install libgtest-dev
	cd /usr/src/googletest
	sudo mkdir build
	cd build
	sudo cmake ..
	sudo make
	sudo make install
	sudo ln -fs /usr/local/lib/libgtest.a /usr/lib/libgtest.a
	sudo ln -fs /usr/local/lib/libgtest_main.a /usr/lib/libgtest_main.a
}

# Docker
docker() {
	sudo apt remove -y docker docker-engine docker.io containerd runc
	sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt update
	sudo apt -y install docker-ce docker-ce-cli containerd.io
	sudo gpasswd -a ${USER} docker
}

# Albert
albert() {
	yes | sudo add-apt-repository ppa:noobslab/macbuntu
	sudo apt update
	sudo apt -y install albert

	# Make Albert autostart
	mkdir -p ~/.config/autostart/
	cp /usr/share/applications/albert.desktop ~/.config/autostart/
	chmod +x ~/.config/autostart/albert.desktop
}

# Chrome
chrome() {
	cd /tmp
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt -y install ./google-chrome-stable_current_amd64.deb
	rm -f google-chrome-stable_current_amd64.deb
}

# Sublime Text 3 & Sublime Merge
sublime() {
	sudo snap install sublime-text --classic
	# sudo snap install sublime-merge --classic

	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sudo apt -y install apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt update
	# sudo apt -y install sublime-text
	sudo apt -y install sublime-merge
}

# PyCharm Professional
pycharm() {
	sudo snap install pycharm-professional --classic
}

# Virtual Box and Vagrant
# @version
virtualbox() {
	cd /tmp
	wget https://download.virtualbox.org/virtualbox/6.1.8/virtualbox-6.1_6.1.8-137981~Ubuntu~bionic_amd64.deb
	wget https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb
	sudo apt -y install ./virtualbox* ./vagrant*
	rm -f virtualbox* vagrant*
}

# VMware
# @version
vmware() {
	echo VMware License: YG5H2-ANZ0H-M8ERY-TXZZZ-YKRV8 >> $SCRIPTDIR/next_action.txt
	cd /tmp
	wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-15.5.2-15785246.x86_64.bundle
	chmod +x VMware-Workstation-Full-*
	sudo ./VMware-Workstation-Full-*
	rm -fr VMware-Workstation-Full-*
}

# CUDA
# @version
cuda() {
	cd /tmp
	wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
	sudo sh cuda*
	rm -fr cuda*
	cat << "EOF" >> ~/.zshrc

export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/nsight-compute-2019.5.0${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
EOF
	sudo apt -y install nvidia-nsight
	sudo update-alternatives --config java
}

# cuDNN
cudnn() {
	echo Download and install cuDNN >> $SCRIPTDIR/next_action.txt
}

# Gnome Chrome shell
gnome_chrome_shell() {
	sudo apt -y install chrome-gnome-shell gnome-screensaver
}

# Netease Music
netease_music() {
	sudo snap install netease-music --beta --devmode
}
