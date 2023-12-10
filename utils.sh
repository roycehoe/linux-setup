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
    do printf "${color}${BOLD}${char}"; 
  done; 
  printf "${NC}"; 
  echo -e
}


function show_notification_with_border() {
  local color=$1
  local start_border=$2
  local filler=$3
  local end_border=$4
  cols=$(tput cols)-2

  printf "${color}${start_border}"
  for ((i=0; i<cols; i++));
      do printf "${color}${filler}"; 
  done;
  printf "${color}${end_border}"
  printf "${NC}"; 
  echo -e
}

function show_installation_banner() {
  print_to_end_of_screen - $BLUE
  show_notification_with_border $GREEN ╔ ═ ╗
  echo -e "${GREEN}${BOLD}║${NC} Installing${YELLOW} Package ${GREEN}"
  echo -e "${GREEN}${BOLD}║${NC} ${CYAN}$1"
  show_notification_with_border $GREEN ╚ ═ ╝
  print_to_end_of_screen - $BLUE
}

function show_plugin_banner() {
  show_notification_with_border $YELLOW ╔ ═ ╗
  echo -e "${YELLOW}│${NC} Installing${PURPLE} Plugin ${GREEN}"
  echo -e "${YELLOW}│${NC} ${CYAN}$1"
  show_notification_with_border $YELLOW ╚ ═ ╝
}

function show_announcement_banner() {
  show_notification_with_border $WHITE ╔ ═ ╗
  echo -e "${WHITE}│ ${YELLOW}$1"
  show_notification_with_border $WHITE ╚ ═ ╝
}

function install_package_with_banner() {
  local package_manager=$1
  local package=$2

  show_installation_banner $package

  if [ $package_manager == "apt" ]; then
    sudo apt install -y $package
  elif [ $package_manager == "pacman" ]; then
    sudo pacman -S --noconfirm $package
  elif [ $package_manager == "brew" ]; then
    sudo brew install $package
  else
    echo "Something went wrong with installing packages"
  fi
}