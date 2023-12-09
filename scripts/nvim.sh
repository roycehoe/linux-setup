#!/bin/bash

_install_nvim() {
  mkdir -p $HOME/tools/ && cd $HOME/tools/
  
  show_installation_banner nvim
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
  tar zxvf nvim-linux64.tar.gz
}

_set_nvim_to_path() {
  fish -c 'echo "set -U fish_user_paths $HOME/tools/nvim-linux64/bin $fish_user_paths" >> ~/.config/fish/config.fish'
}

_set_vim_alias_for_nvim() {
  fish -c "alias vim nvim; funcsave vim"
}

_install_nvim_plugins() {
  cd /home/user/.config
  git clone https://github.com/roycehoe/nvim.git
}

setup_nvim() {
  _install_nvim
  _set_nvim_to_path
  _set_vim_alias_for_nvim
  cd ~/.config/nvim
  _install_nvim_plugins
}
