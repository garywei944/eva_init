#!/usr/bin/env bash

wechat() {
	wget -O- https://deepin-wine.i-m.dev/setup.sh | sh
	sudo apt-get install com.qq.weixin.deepin
	sudo apt install libjpeg62:i386
}
