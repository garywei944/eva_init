# Configure right click and open with terminator
config_nautilus() {
	sudo apt install -y python3-nautilus python3-yaml

	cd /tmp || exit
	git clone git@github.com:mwahlroos/Nautiterm.git
	cd Nautiterm || exit

	mkdir -p $HOME/.local/share/nautilus-python/extensions
	cp src/nautiterm/open_terminal.py $HOME/.local/share/nautilus-python/extensions
	nautilus -q

	rm -fr /tmp/Nautiterm
}
