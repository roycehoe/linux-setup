#!/bin/bash
. utils.sh
. constants.sh


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
  local package_manager=$1

  for package in ${PYTHON_BUILD_DEPENDENCIES[@]}; do
    install_package_with_banner $package_manager $package
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
  local package_manager=$1

  install_package_with_banner $package_manager npm
}

function _setup_pnpm() {
  fish -c "curl -fsSL https://get.pnpm.io/install.sh | sh -"
}

function _setup_ghq() {
  fish -c "go install github.com/x-motemen/ghq@latest"
}

function _setup_asdf {
  local package_manager=$1

  _download_asdf
  _install_asdf
  _configure_completions
  _setup_nodejs
  _setup_python $package_manager
  _setup_go
}

function setup_version_managers() {
  local package_manager=$1

  _setup_asdf $package_manager
  _setup_poetry
  _setup_npm $package_manager
  _setup_pnpm
  _setup_ghq
}
