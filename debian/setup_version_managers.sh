#!/bin/bash
. ./utils.sh
. ./constants.sh

function _download_asdf() {
  show_installation_banner asdf
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
}

function _install_asdf() {
  echo "source ~/.asdf/asdf.fish" > ~/.config/fish/config.fish
}

function _configure_completions() {
  fish -c "mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions"
}

function _setup_nodejs {
  fish -c "asdf plugin add nodejs"
  fish -c "asdf install nodejs 20.10.0"
  fish -c "asdf global nodejs 20.10.0"
}
function _setup_go {
  fish -c "asdf plugin add golang https://github.com/asdf-community/asdf-golang.git"
  fish -c "asdf install golang 1.21.4"
  fish -c "asdf global golang 1.21.4"
}

function _setup_python() {
  for package in ${PYTHON_BUILD_DEPENDENCIES[@]}; do
    install_apt_package_with_banner $package
  done
  fish -c "asdf plugin add python"
  fish -c "asdf install python 3.9.0"
  fish -c "asdf global python 3.9.0"
}

function _setup_poetry() {
  fish -c "curl -sSL https://install.python-poetry.org | python3 -"
  fish -c 'echo "set -U fish_user_paths $HOME/.local/bin $fish_user_paths" >> ~/.config/fish/config.fish'
}

function _setup_npm() {
  install_apt_package_with_banner npm
}

function _setup_pnpm() {
  fish -c "set -x SHELL (which fish)"
  fish -c "curl -fsSL https://get.pnpm.io/install.sh | sh -"
}

function _setup_ghq() {
  fish -c "go install github.com/x-motemen/ghq@latest"
}

function _setup_asdf {
  _download_asdf
  _install_asdf
  _configure_completions
  _setup_nodejs
  _setup_python
  _setup_go
}

function _setup_docker_apt_repository() {
  for package in ${DOCKER_GPG_KEY_DEPENDENCIES[@]}; do
    install_apt_package_with_banner $package
  done
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
  for package in ${DOCKER_PACKAGES[@]}; do
    install_apt_package_with_banner $package
  done
}

function _setup_docker_and_docker_compose() {
  _setup_docker_apt_repository
  _install_docker_packages
}

function setup_version_managers() {
  _setup_asdf
  _setup_poetry
  _setup_npm
  _setup_pnpm
  _setup_ghq
  _setup_docker_and_docker_compose
}
