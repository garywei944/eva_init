#!/usr/bin/env bash

# Exit if EVA is not defined
[[ ${EVA+x} ]] || exit

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)
cd "$DIR" || exit

unzip keys.zip
chmod +x config_keys.sh
./config_keys.sh

shopt -s extglob dotglob
rm -- !(init_keys.sh|keys.zip)
