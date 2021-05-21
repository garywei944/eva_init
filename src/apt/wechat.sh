#!/usr/bin/env bash

wechat() {
	wget -O- https://deepin-wine.i-m.dev/setup.sh | sh
	sudo apt install -y com.qq.weixin.deepin
	sudo apt install -y libjpeg62:i386
}
