#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n  mas \n\n"

brew_install "mas" "mas"
mas install 867299399 # OmniFocus 2
mas install 824183456 # Affinity Photo
mas install 824171161 # Affinity Designe
mas install 975937182 # Fantastical 2 - Calendar and Reminders
mas install 424390742 # Compressor
