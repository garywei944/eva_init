#!/usr/bin/env bash

_anaconda() {
  local link
  link=$(wget -O - https://www.anaconda.com/distribution/ 2>/dev/null | sed -ne 's@.*\(https:\/\/repo\.anaconda\.com\/archive\/Anaconda3-.*-Linux-x86_64\.sh\)\">64-Bit (x86) Installer.*@\1@p')

  if [[ ! $link ]]; then echo "$(date +"%D %T") - anaconda: failed to get link" >&2 && exit; fi

  cd /tmp || exit
  wget "$link" -O anaconda_script.sh
  bash anaconda_script.sh -b
  rm -f anaconda_script.sh
}

_miniforge() {
  cd /tmp || exit
  wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh"
  bash Miniforge3-Linux-x86_64.sh -b
  rm -f Miniforge3-Linux-x86_64.sh
}
