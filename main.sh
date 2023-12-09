#!/bin/bash
# . setup/setup_debian.sh
# . setup/setup_fish.sh
# . setup/setup_version_managers.sh
# . setup/setup_nvim.sh

. setup/debian.sh
. scripts/fish.sh
. scripts/version_managers.sh
. scripts/nvim.sh

setup_debian
setup_fish
setup_version_managers
setup_nvim
neofetch