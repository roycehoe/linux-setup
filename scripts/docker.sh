#!/bin/bash
. utils.sh
. constants.sh

function _setup_docker_apt_repository() {
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg

  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
}

function _install_docker_packages() {
  local package_manager=$1

  for package in ${DOCKER_PACKAGES[@]}; do
    install_package_with_banner $package_manager $package
  done
}

function setup_docker() {
  local package_manager=$1

  _setup_docker_apt_repository
  _install_docker_packages $package_manager
}