#!/usr/bin/env bash

# Set up environments variables and load functions

# Make sure that $PWD is the directory of the script
EVA_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)
CONFIG_DIR="$EVA_ROOT"/config

# CD into the directory of init.sh
cd "$EVA_ROOT" || exit

# Make alias
alias config_keys=$EVA_ROOT/keys/init_keys.sh

# Run arguments
for cmd in "$@"; do
  $cmd
done
