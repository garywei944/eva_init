#!/bin/bash
# evinit.sh
# @Author  : garywei944 (garywei944@gmail.com)
# @Link    : https://github.com/garywei944

SCRIPTDIR=$(cd $(dirname "${BASH_SOURCE[0]}") >/dev/null && pwd)
2>$SCRIPTDIR/err.log exec

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
	vagrant
	vmware
	cuda
	cudnn
	gnome_chrome_shell

	config_sublime
	config_vagrant
}

wsl() {
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
