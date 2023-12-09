#!/bin/bash

NC='\033[0m'       # Text Reset
BLACK='\033[0;30m'        # Black
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue
PURPLE='\033[0;35m'       # Purple
CYAN='\033[0;36m'         # Cyan
WHITE='\033[0;37m'        # White

function show_installation_banner() {
  echo -e "${BLUE}=================================================================${NC}"
  echo -e "${GREEN}┌────────────────────────────────────────────────────┐"
  echo -e "${GREEN}│${NC} Installing${YELLOW} Package ${GREEN}"
  echo -e "${GREEN}│${NC} ${CYAN}$1"
  echo -e "${GREEN}└────────────────────────────────────────────────────┘${NC}"
  echo -e "${BLUE}=================================================================${NC}"
}

function show_plugin_banner() {
  echo -e "${YELLOW}┌────────────────────────────────────────────────────┐"
  echo -e "${YELLOW}│${NC} Installing${PURPLE} Plugin ${GREEN}"
  echo -e "${YELLOW}│${NC} ${CYAN}$1"
  echo -e "${YELLOW}└────────────────────────────────────────────────────┘${NC}"
}

function show_announcement_banner() {
  echo -e "${WHITE}┌────────────────────────────────────────────────────┐"
  echo -e "${WHITE}│ ${YELLOW}$1"
  echo -e "${WHITE}└────────────────────────────────────────────────────┘${NC}"
}

function _install_apt_package() {
  sudo apt install -y $1
}


function install_apt_package_with_banner() {
  show_installation_banner $1
  _install_apt_package $1
}

function install_package_with_banner() {
  local package=$1
  local package_manager=$2

  show_installation_banner $package

  if [$package_manager == "apt"]
    sudo apt install -y $package
  elif [$package_manager == "pacman"]
    sudo pacman -S $package
  else
    echo "Something went wrong with installing packages"
  fi
}