#!/bin/bash

. utils.sh
. constants.sh
. scripts/linux.sh
. scripts/fish.sh
. scripts/version_managers.sh
. scripts/nvim.sh
. scripts/docker.sh

setup_debian() {
  sudo apt update

  setup_linux apt
  setup_fish apt
  setup_version_managers apt
  setup_docker apt
  setup_nvim
  neofetch
}