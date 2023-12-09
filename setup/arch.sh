#!/bin/bash

. utils.sh
. constants.sh
. scripts/linux.sh
. scripts/fish.sh
. scripts/version_managers.sh
. scripts/nvim.sh
. scripts/docker.sh

setup_arch() {
  sudo pacman -Syu --noconfirm 

  setup_linux pacman
  setup_fish pacman
  setup_version_managers pacman
  setup_docker pacman
  setup_nvim
  neofetch
}