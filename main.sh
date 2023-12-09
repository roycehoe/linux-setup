#!/bin/bash
. setup/setup_debian.sh
. setup/setup_fish.sh
. setup/setup_version_managers.sh
. setup/setup_nvim.sh

install_fonts() {
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Medium/JetBrainsMonoNerdFontMono-Regular.ttf
}


setup_debian
setup_fish
setup_version_managers
install_fonts
setup_nvim
neofetch