#!/usr/bin/env bash

# Set up environments variables and load functions

# Make sure that $PWD is the directory of the script
EVA_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)
SRC_DIR="$EVA_ROOT"/src
CONFIG_DIR="$EVA_ROOT"/config

# CD into the directory of init.sh
cd "$EVA_ROOT" || exit

# Make alias
config_keys() { ./keys/init_keys.sh; }

# Load functions
. ./src/init_config.sh
. ./src/init_apt.sh
. ./src/init_inst.sh

# Run arguments
for cmd in "$@"; do
  $cmd
done
