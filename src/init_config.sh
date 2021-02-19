#!/usr/bin/env bash

[[ -z $SRC_DIR ]] && SRC_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)

for f in "$SRC_DIR"/config/*.sh; do
  # shellcheck source=/dev/null
  . "$f"
done
