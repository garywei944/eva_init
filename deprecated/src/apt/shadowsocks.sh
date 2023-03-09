_shadowsocks() {
	[[ ${PORT+x} ]] || PORT=31705
	[[ ${PASSWORD+x} ]] || read -sp 'Password for shadowsocks: ' PASSWORD

	docker run \
		--name eva_ss \
		-e SERVER_ADDR=0.0.0.0 \
		-p$PORT:8388 \
		-p$PORT:8388/udp \
		-e PASSWORD=$PASSWORD \
		-e METHOD=chacha20-ietf-poly1305 \
		-e TIMEOUT=60 \
		-d shadowsocks/shadowsocks-libev
}
