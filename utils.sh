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

function print_to_end_of_screen() {
  local char=$1
  local color=$2

  cols=$(tput cols)
  for ((i=0; i<cols; i++));
    do printf "${color}${char}"; 
  done; 
  echo
}



function show_installation_banner() {
  print_to_end_of_screen $BLUE
  # echo -e "${BLUE}=================================================================${NC}"
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

function install_package_with_banner() {
  local package_manager=$1
  local package=$2

  show_installation_banner $package

  if [ $package_manager == "apt" ]; then
    sudo apt install -y $package
  elif [ $package_manager == "pacman" ]; then
    sudo pacman -S --noconfirm $package
  else
    echo "Something went wrong with installing packages"
  fi
}