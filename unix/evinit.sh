#!/bin/bash
# evinit.sh
# @Author  : garywei944 (garywei944@gmail.com)
# @Link    : https://github.com/garywei944

2>err.log exec

. evapt.sh

config_key() {
	
}

config_git() {
	
}

config_sublime() {
	cd ~/.config
	mkdir -p sublime-text-3/Installed\ Packages
	cd sublime-text-3/Installed\ Packages
	wget https://packagecontrol.io/Package%20Control.sublime-package -O Package\ Control.sublime-package
	cd ..
	rm -fr Packages
	git clone git@github.com:garywei944/aris_st3.git Packages
}

# Install Sublime Text Dependencies
sudo -H pip3 install -U pip
sudo -H pip3 install --upgrade --pre CodeIntel
sudo npm install -g jshint csslint xg-htmlhint



# Configuration Terminal
chsh -s /bin/zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
git clone git@github.com:garywei944/eva_bin.git ~/.eva
echo 'export PATH=$PATH:~/.eva/bin' >> ~/.zshrc
# curl -sLf https://spacevim.org/install.sh | bash
# curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall
# rm -fr .emacs.d
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d



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




# Configure Vagrant
cd ~
echo 'Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
end
' > Vagrantfile
