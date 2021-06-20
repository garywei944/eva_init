#!/usr/bin/env bash

gtest() {
  sudo apt install -y libgtest-dev
  cd /usr/src/googletest || exit
  sudo mkdir build
  cd build || exit
  sudo cmake ..

  local n_jobs=$(nproc)
  sudo make -j $n_jobs
  sudo make -j $n_jobs all
  sudo ln -fs /usr/local/lib/libgtest.a /usr/lib/libgtest.a
  sudo ln -fs /usr/local/lib/libgtest_main.a /usr/lib/libgtest_main.a
}
