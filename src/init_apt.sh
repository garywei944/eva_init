#!/usr/bin/env bash

[[ -z $SRC_DIR ]] && SRC_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)

gtest() { $SRC_DIR/bin/_gtest.sh; }
chrome() { $SRC_DIR/bin/_chrome.sh; }
awscli() { $SRC_DIR/bin/_awscli.sh; }

for f in "$SRC_DIR"/apt/*.sh; do
  # shellcheck source=/dev/null
  . "$f"
done
