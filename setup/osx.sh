#!/bin/bash

. utils.sh
. constants.sh
. scripts/linux.sh
. scripts/fish.sh
. scripts/version_managers.sh
. scripts/nvim.sh
. scripts/docker.sh

install_brew() {
  NONINTERACTIVE=1 /bin/bash -c \
   "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/arch/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    sudo pacman -S 
    install_package_with_banner base-devel
}

install_zsh() {
  install_package_with_banner brew zsh
}

setup_osx() {
  install_brew
  install_zsh

  setup_linux brew
  setup_fish brew
  setup_version_managers brew
  setup_docker brew
  setup_nvim
  neofetch
}