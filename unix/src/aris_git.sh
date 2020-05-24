#!/bin/bash
# Git Configuration

cat << "EOF" > ~/.gitconfig
[user]
	name = garywei944
	email = 33930674+garywei944@users.noreply.github.com
[core]
	editor = vim
	autocrlf = input
[alias]
	apply-gitignore = !git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached
EOF

mkdir -p ~/.ssh
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
