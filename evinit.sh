#!/bin/bash
# evinit.sh
# @Author  : garywei944 (garywei944@gmail.com)
# @Link    : https://github.com/garywei944

SCRIPTDIR=$(cd $(dirname "${BASH_SOURCE[0]}") >/dev/null && pwd)

. $SCRIPTDIR/src/evapt.sh
. $SCRIPTDIR/src/evconfig.sh

common() {
	basic
	gtest

	config_key
	config_git
	config_terminal
}

init() {
	common
	# driver

	config_sudo
	config_sys
}

ubuntu() {
	chrome
	sublime
	docker
	albert
	gnome_chrome_shell
	neteas5e_music
	gparted
	kazam
	pymol
	vlc
	mediacodecs
	tweaks
	wine
	steam
	timeshift

	config_sublime
	config_vagrant
}

wsl() {
	sudo apt remove -y --purge openssh-server
	common
	config_sudo
	config_server
}

vagrant() {
	common
	config_server
}

server() {
	common
}

for cmd in $@; do
	$cmd
done
