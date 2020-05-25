#!/bin/bash
# evinit.sh
# @Author  : garywei944 (garywei944@gmail.com)
# @Link    : https://github.com/garywei944

2>err.log exec

SCRIPTDIR=$(cd $(dirname "${BASH_SOURCE[0]}") >/dev/null && pwd)

. src/evapt.sh
. src/evconfig.sh

common() {
	basic
	gtest

	config_key
	config_git
	config_terminal
}

ubuntu() {
	driver
	python38
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

	config_sudo_aris
	config_sys
	config_sublime
	config_vagrant
}

wsl() {
	config_sudo_aris
	config_server
}

vagrant() {
	config_server
}

server() {
}

common
$1
