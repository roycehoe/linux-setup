#!/bin/bash
. setup/utils.sh

function change_default_shell_to_fish() {
  sudo chsh -s /usr/bin/fish
}

function install_fisher() {
  # Fish plugin manager
  show_plugin_banner fisher
  fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
}

function install_tide() {
  show_plugin_banner tide
  fish -c "fisher install IlanCosman/tide@v6"
}

function configure_tide() {
  fish -c "tide configure --auto --style=Lean --prompt_colors='True color' --show_time='24-hour format' --lean_prompt_height='One line' --prompt_spacing=Compact --icons='Many icons' --transient=No"
}

function setup_fish() {
  install_apt_package_with_banner fish
  change_default_shell_to_fish
  install_fisher
  install_tide
  configure_tide
}