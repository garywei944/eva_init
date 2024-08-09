#!/bin/zsh

apps=(
	# System Essentials
	wget gnupg
	# System management
	asitop tmux fd ripgrep the_silver_searcher jq tree ranger ncdu as-tree ack
	# Development Runtimes
	python virtualenv java cabal-install lua ghostscript cmake rust ghc readline doctest
	catch2 spdlog googletest node go hugo r
	# Development tools
	git-flow-avh ctags rlwrap aspell autoconf libtool colordiff dos2unix imagemagick
	# cli
	ack awscli
	# Just for fun
	screenfetch neofetch lolcat figlet fortune cowsay
	# modern linux
	bat eza lsd git-delta dust duf broot fzf mcfly choose-rust sd cheat tldr bottom glances
	gtop hyperfine gping procs httpie curlie xh zoxide
	# pwntools
	pwntools

	shc
	lazygit
)

brew install "${apps[@]}"

cask_apps=(
	iterm2
	mactex
	rar
	emacs
	miniforge
	micromamba
	rstudio
	docker
	skim
	blender
)

brew install --cask "${cask_apps[@]}"
