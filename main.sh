#!/bin/bash
# . setup/setup_debian.sh
# . setup/setup_fish.sh
# . setup/setup_version_managers.sh
# . setup/setup_nvim.sh

. setup/debian.sh
. scripts/fish.sh
. scripts/version_managers.sh
. scripts/nvim.sh
. scripts/docker.sh

setup_debian
setup_fish apt
setup_version_managers apt
setup_docker apt
setup_nvim
neofetch