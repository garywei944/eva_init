#!/usr/bin/env bash

[[ -z $SRC_DIR ]] && SRC_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)

alias gtest='$SRC_DIR'/bin/_gtest.sh

for f in "$SRC_DIR"/apt/*.sh; do
  # shellcheck source=/dev/null
  . "$f"
done
