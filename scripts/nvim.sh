#!/bin/bash

_install_nvim() {
  mkdir -p $HOME/tools/
  
  show_installation_banner nvim
  wget -P $HOME/tools/ https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz

  tar zxvf $HOME/tools/nvim-linux64.tar.gz -C $HOME/tools/ 
}

_set_nvim_to_path() {
  fish -c 'echo "set -U fish_user_paths $HOME/tools/nvim-linux64/bin $fish_user_paths" >> ~/.config/fish/config.fish'
}

_set_vim_alias_for_nvim() {
  fish -c "alias vim nvim; funcsave vim"
}

_install_nvim_plugins() {
  cp -r ./configs/nvim ~/.config
}

setup_nvim() {
  _install_nvim
  _set_nvim_to_path
  _set_vim_alias_for_nvim
  _install_nvim_plugins
}
