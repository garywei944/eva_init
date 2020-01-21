#!/bin/bash
# root

# Initialization and update apt
apt update
apt -y upgrade
apt -y install zsh wget curl net-tools emacs vim git git-flow screen dos2unix build-essential default-jdk python python-pip python3 python3-pip nodejs npm

# Terminal configuration
chsh -s /bin/zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

# Git Configuration
echo '[user]
	name = garywei944
	email = 33930674+garywei944@users.noreply.github.com
[core]
	editor = vim
	autocrlf = input
[alias]
	apply-gitignore = !git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached' > ~/.gitconfig
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

# Set up git server
useradd git -l -m -p $1$nOiVxFfO$.YblyEbsUq1h6zjKLpVml/ -s /usr/bin/git-shell
cd /home/git
mkdir -m 700 .ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwfVHrDh4/HXjkTh67cC7hGNBfaHZTir8atw2+VPUZyIwV3B9UbjPWTiO9xsx8gaQIl7aDSsIbvzhLnitGQJ+sL8pE/PawCdD+WR8JYorybokx4NiCjr6uNZahiiT/kbYJXprJijiz+P8NyTjFZFG/TJc9tI6DU2NObZCzCd7AAhoTaDrBqwgjs+7Y/XBWd8EcA1lKy60rAtIHx1GKpur3GWbIl+h6H6asuzysSDNQPW8mXnSnnq3l4BLk/sckAnhFSRWUN8nlkddXRrAtw8pUPwkReGv/SDclAUK351/GvawpsYfdOyLngNnAKdavAWfw9Fbm4IIbf8XDmTY9CAJZ1Cjwyv48Cq59UH2yBrkR9Q3/10GK+mlfpov80u88L54YcqMbCCXQ5pd2YvNt/DCRek7vakRSat9rYmo7de3Oaw/nVJkwmCETgzzla72iPkPuyx+fWUTSXkTRcBQbZTJGo/KukvMTVfi2aNX+mpw/IzOQunmAfXHoFFiy5g7wXA8A2HeX0sq+FAx0SM92k9SkGGs9218iW43bzQC8T9T2aMDlL0pv/G/oM3/+v+oxQZMfMMSa5zFcamCQNiUqBNKXV5kZXB2qlrTQzKmn/gcz4PwwUcZvc9d+jeiLU4tYcYgRwtQAL3xuTCOuU47AiaHJSUxJ5RbbI36KPXdpXJTnoQ== 33930674+garywei944@users.noreply.github.com' >> .ssh/authorized_keys
chmod 600 .ssh/authorized_keys

echo ARIS SERVER UBUNTU COMPLETE
