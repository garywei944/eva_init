#!/usr/bin/env bash

awesome() {
	sudo apt install -y awesome nitrogen compton numlockx i3lock scrot

	git clone https://github.com/lcpz/lain.git ~/.config/awesome/lain

	git clone -b themes --depth 1 git@github.com:garywei944/awesome-copycats.git ~/.config/awesome/themes
}
