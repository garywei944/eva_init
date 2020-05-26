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
	driver

	config_sudo_aris
	config_sys
}

ubuntu() {
	# python38
	anaconda3
	docker
	albert
	chrome
	sublime
	pycharm
	virtualbox
	vmware
	cuda
	cudnn
	gnome_chrome_shell
	netease_music

	config_sublime
	# config_jetbrain
	config_vagrant
}

wsl() {
	sudo apt remove -y --purge openssh-server
	common
	config_sudo_aris
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
