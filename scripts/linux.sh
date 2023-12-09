#G!/bin/bash

install_fonts() {
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Medium/JetBrainsMonoNerdFontMono-Regular.ttf
}

set_locale() {
  sudo sed -i 's/^# *\(en_SG.UTF-8\)/\1/' /etc/locale.gen

  # Generate locale
  sudo locale-gen

  # Export env vars
  echo "export LC_ALL=en_SG.UTF-8" >> ~/.bashrc
  echo "export LANG=en_SG.UTF-8" >> ~/.bashrc
  echo "export LANGUAGE=en_SG.UTF-8" >> ~/.bashrc

  source ~/.bashrc
}

install_linux_packages() {
  local package_manager=$1

  for package in ${BASIC_PACKAGES[@]}; do
    install_package_with_banner $package_manager $package
  done

  for package in ${UI_PACKAGES[@]}; do
    install_package_with_banner $package_manager $package
  done
}

setup_linux() {
    local package_manager=$1

    install_linux_packages $package_manager
    install_fonts
    set_locale
}