#/bin/bash

export SRC=$PWD/src

# apt Configuration
sudo $SRC/aris_apt.sh

# id_rsa Configuration
$SRC/aris_id_rsa.sh

# git Configuration
$SRC/aris_git.sh
