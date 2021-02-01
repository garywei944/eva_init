#!/bin/bash
# evconfig.sh
# @Author  : garywei944 (garywei944@gmail.com)
# @Link    : https://github.com/garywei944

# Configure sudo without password
config_sudo() {
	echo "Defaults	editor=/usr/bin/vim
$USER	ALL=(ALL)	NOPASSWD: ALL" | sudo tee -a /etc/sudoers
}

# Configure System
config_sys() {
	sudo vim /etc/default/grub
	sudo update-grub
	cd /mnt
	sudo mkdir windows adam kiana
	cat << "EOF" | sudo tee -a /etc/fstab
UUID=7F0FDC9BCBEDF510	/mnt/windows	ntfs	rw,auto,user,fmask=133,dmask=022,uid=1000,gid=1000	0	0
UUID=09C1B27DA5EB573A	/mnt/adam	ntfs	rw,auto,user,fmask=133,dmask=022,uid=1000,gid=1000	0	0
UUID=2896A4A90E3A7893	/mnt/kiana	ntfs	rw,auto,user,fmask=133,dmask=022,uid=1000,gid=1000	0	0
UUID=8A6C65FA6C65E185	/mnt/misaki	ntfs	rw,auto,user,fmask=133,dmask=022,uid=1000,gid=1000	0	0
UUID=41CCDE9622B9FB35	/mnt/asuka	ntfs	rw,auto,user,fmask=133,dmask=022,uid=1000,gid=1000	0	0
EOF
}

config_time() {
  # Set system time
  sudo timedatectl set-local-rtc 1
  sudo apt -y install ntpdate
  sudo ntpdate time.windows.com
  sudo hwclock --localtime --systohc
}

config_key() {
	cd /tmp
	unzip $SCRIPTDIR/key.zip -d key
	bash key/evid.sh
	bash key/evaws.sh
	rm -fr key
}

config_git() {
	cat << "EOF" > ~/.gitconfig
[user]
	name = garywei944
	email = 33930674+garywei944@users.noreply.github.com
[core]
	editor = vim
	autocrlf = input
[init]
	defaultBranch = main
[alias]
	apply-gitignore = !git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached
EOF

	if [ ! -d ~/.ssh ]; then
		mkdir -m ~/.ssh
	fi

	ssh-keyscan -H github.com >> ~/.ssh/known_hosts
	chmod 644 ~/.ssh/known_hosts
}

config_server() {
	cd ~/.ssh
	cat id_rsa.pub >> authorized_keys
	chmod 600 authorized_keys
}

config_wsl() {
	SSHD_PORT=2233
	SSHD_FILE=/etc/ssh/sshd_config
	SUDOERS_FILE=/etc/sudoers

	sudo cp $SSHD_FILE ${SSHD_FILE}.`date '+%Y-%m-%d_%H-%M-%S'`.back
	sudo sed -i '/^Port/ d' $SSHD_FILE
	sudo sed -i '/^PasswordAuthentication/ d' $SSHD_FILE
	echo "Port ${SSHD_PORT}"          | sudo tee -a $SSHD_FILE
	echo "PasswordAuthentication yes" | sudo tee -a $SSHD_FILE
	sudo service ssh --full-restart

	sed -i '/^sudo service ssh --full-restart/ d' ~/.zshrc
	echo "%sudo ALL=(ALL) NOPASSWD: /usr/sbin/service ssh --full-restart" | sudo tee -a $SUDOERS_FILE
	cat << 'EOF' >> ~/.zshrc
sshd_status=$(service ssh status)
if [[ $sshd_status = *"is not running"* ]]; then
  sudo service ssh --full-restart
fi
EOF

	sudo apt install -y cmake gcc clang gdb valgrind build-essential
}

# Configure Sublime Text
config_sublime() {
	cd ~/.config
	mkdir -p sublime-text-3/Installed\ Packages
	cd sublime-text-3/Installed\ Packages
	wget https://packagecontrol.io/Package%20Control.sublime-package -O Package\ Control.sublime-package
	cd ..
	rm -fr Packages
	git clone git@github.com:garywei944/aris_st3.git Packages

	# Install Sublime Text Dependencies
	# pip install --upgrade --pre CodeIntel
	pip3 install --upgrade --pre CodeIntel
	sudo npm install -g jshint csslint xg-htmlhint
	sudo npm install -g browser-sync

	mkdir -p ~/.codeintel
	cat << "EOF" > ~/.codeintel/config.log
{
    "PHP": {
        "php": "/usr/bin/php",
        "phpExtraPaths": [],
        "phpConfigFile": "php.ini"
    },
    "JavaScript": {
        "javascriptExtraPaths": []
    },
    "Perl": {
        "perl": "/usr/bin/perl",
        "perlExtraPaths": []
    },
    "Ruby": {
        "php": "/usr/bin/ruby",
        "phpExtraPaths": []
    },
    "Python": {
        "php": "/usr/bin/python",
        "phpExtraPaths": []
    },
    "Python3": {
        "php": "/usr/bin/python3",
        "phpExtraPaths": []
    }
}
EOF
}

# Configuration Terminal
config_terminal() {
	chsh -s /bin/zsh
	wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
	git clone git@github.com:garywei944/eva_bin.git ~/.eva
	echo '
export PATH=$PATH:~/.eva/bin' >> ~/.zshrc
	# curl -sLf https://spacevim.org/install.sh | bash
	# curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall
	# rm -fr .emacs.d
	# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

	# Configure zsh themes
	cd /tmp
	git clone git@github.com:iplaces/astro-zsh-theme.git
	cp astro-zsh-theme/astro.zsh-theme ~/.oh-my-zsh/themes
# 	echo 'ZSH_THEME="random"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "astro" "ys" )' >> ~/.zshrc
	rm -fr astro-zsh-theme
}

# Configure Vagrant
config_vagrant() {
	cat << "EOF" > ~/Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
end
EOF
}

# Disable Nouveau
disable_nouveau() {
	sudo cat << "EOF" > /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF
  sudo update-initramfs -u
}

# Configure cuda 11
config_cuda_11() {
	cat << "EOF" >> ~/.bashrc
export PATH=/usr/local/cuda-11.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
EOF
}

# Configure shadowsocks
config_shadowsocks() {
	sudo vim /etc/shadowsocks-libev/config.json
	sudo systemctl restart shadowsocks-libev.service
	sudo systemctl enable shadowsocks-libev.service
}
