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

	config_sudo
	config_key
	config_git
	config_terminal
}

init() {
	common
	apt_cuda
	disable_nouveau
	driver

	config_sys
	config_cuda_11
}

ubuntu() {
	chrome
	sublime
	docker
	albert
	gnome_chrome_shell
	gparted
	kazam
	netease_music
	discord
	pymol
	vlc
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
	config_server
}

vagrant() {
	common
	config_server
}

server() {
	common
	shadowsocks

	config_shadowsocks
}

for cmd in $@; do
	$cmd
done
