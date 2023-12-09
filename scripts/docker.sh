#!/bin/bash
. utils.sh
. constants.sh

function _setup_docker_debian() {
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg

  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
}

function _install_docker_packages_debian() {
  local package_manager=$1

  _setup_docker_debian
  for package in ${DOCKER_PACKAGES_DEBIAN[@]}; do
    install_package_with_banner $package_manager $package
  done
}

function _install_docker_packages_arch() {
  local package_manager=$1

  for package in ${DOCKER_PACKAGES_ARCH[@]}; do
    install_package_with_banner $package_manager $package
  done
}

function setup_docker() {
  local package_manager=$1

  if [ $package_manager == "apt" ]; then
    _install_docker_packages_debian $package_manager

  elif [ $package_manager == "pacman" ]; then
    _install_docker_packages_arch $package_manager

  else
    echo "Something went wrong with installing packages"
  fi

}