#!/usr/bin/env bash

awscli() {
  cd /tmp || exit
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  rm -fr aws awscliv2.zip
}

ebcli() {
	sudo apt install -y build-essential zlib1g-dev libssl-dev libncurses-dev libffi-dev libsqlite3-dev libreadline-dev libbz2-dev
	git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git
	./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer
	rm -fr aws-elastic-beanstalk-cli-setup
}
