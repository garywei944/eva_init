#!/bin/bash
# evconfig.sh
# @Author  : garywei944 (garywei944@gmail.com)
# @Link    : https://github.com/garywei944

# Configure sudo aris without password
config_sudo_aris() {
	echo "Defaults	editor=/usr/bin/vim
aris	ALL=(ALL)	NOPASSWD: ALL" | sudo tee -a /etc/sudoers
}

# Configure System
config_sys() {
	sudo vim /etc/default/grub
	sudo update-grub
	cd /mnt
	sudo mkdir windows adam kiana
	cat << "EOF" | sudo tee -a /etc/fstab
UUID=2F4E51DDBA454123	/mnt/windows	ntfs	defaults	0	0
UUID=09C1B27DA5EB573A	/mnt/adam	ntfs	defaults	0	0
UUID=2896A4A90E3A7893	/mnt/kiana	ntfs	defaults	0	0
EOF

	# Set system time
	sudo timedatectl set-local-rtc 1
	sudo apt -y install ntpdate
	sudo ntpdate time.windows.com
	sudo hwclock --localtime --systohc
}

config_key() {
	cd /tmp
	2>&1 unzip $SCRIPTDIR/zip/evid.zip
	bash evid.sh
	rm evid.sh
}

config_git() {
	cat << "EOF" >> ~/.gitconfig
[user]
  name = garywei944
  email = 33930674+garywei944@users.noreply.github.com
[core]
  editor = vim
  autocrlf = input
[alias]
  apply-gitignore = !git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached
EOF

	mkdir -p ~/.ssh
	chmod 700 ~/.ssh
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
	sudo -H pip3 install -U pip
	sudo -H pip3 install --upgrade --pre CodeIntel
	sudo -H npm install -g jshint csslint xg-htmlhint
}

# Configuration Terminal
config_terminal() {
	2>&1 chsh -s /bin/zsh
	wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
	git clone git@github.com:garywei944/eva_bin.git ~/.eva
	echo 'export PATH=$PATH:~/.eva/bin' >> ~/.zshrc
	# curl -sLf https://spacevim.org/install.sh | bash
	# curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall
	# rm -fr .emacs.d
	# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

	# Configure zsh themes
	cd /tmp
	git clone git@github.com:iplaces/astro-zsh-theme.git
	cp astro-zsh-theme/astro.zsh-theme ~/.oh-my-zsh/themes
	echo 'ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "astro" "ys" )' >> ~/.zshrc
	rm -fr astro-zsh-theme
}

# Configure JetBrain
config_jetbrain() {
	mkdir -p ~/.config/JetBrains/PyCharm2020.1/jba_config/linux.keymaps/
	cat << "EOF" > ~/.config/JetBrains/PyCharm2020.1/jba_config/linux.keymaps/Ar1S.xml
<keymap version="1" name="Ar1S" parent="Sublime Text">
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
</keymap>
EOF
}

# Configure Vagrant
config_vagrant() {
	cat << "EOF" > ~/Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
end
EOF
}
