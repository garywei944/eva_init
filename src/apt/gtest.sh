#!/usr/bin/env bash

# GooleTest
gtest() {
  sudo apt -y install libgtest-dev
  cd /usr/src/googletest || exit
  sudo mkdir build
  cd build || exit
  sudo cmake ..
  sudo make
  sudo make install
  sudo ln -fs /usr/local/lib/libgtest.a /usr/lib/libgtest.a
  sudo ln -fs /usr/local/lib/libgtest_main.a /usr/lib/libgtest_main.a
}
