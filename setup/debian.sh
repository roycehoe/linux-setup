#!/bin/bash
. utils.sh
. constants.sh

_install_fonts() {
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Medium/JetBrainsMonoNerdFontMono-Regular.ttf
}


function _update_apt() {
  sudo apt-get update
}

function _set_locale() {
  sudo sed -i 's/^# *\(en_SG.UTF-8\)/\1/' /etc/locale.gen

  # Generate locale
  sudo locale-gen

  # Export env vars
  echo "export LC_ALL=en_SG.UTF-8" >> ~/.bashrc
  echo "export LANG=en_SG.UTF-8" >> ~/.bashrc
  echo "export LANGUAGE=en_SG.UTF-8" >> ~/.bashrc

  source ~/.bashrc
}

function setup_debian() {
  _update_apt
  for package in ${BASIC_PACKAGES[@]}; do
    install_package_with_banner apt $package
  done

  for package in ${UI_PACKAGES[@]}; do
    install_package_with_banner apt $package
  done

  for package in ${WEB_DEV_PACKAGES[@]}; do
    install_package_with_banner apt $package
  done

  _install_fonts
  _set_locale
}