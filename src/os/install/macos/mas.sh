#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n  mas \n\n"

brew_install "mas" "mas"
mas_install "OmniFocus 2" 86729939
mas_install "Affinity Photo" 824183456
mas_install "Affinity Designer" 824171161
mas_install "Fantastical 2 - Calendar and Reminders" 975937182
mas_install "Compressor" 424390742
mas_install "Airmail" 918858936
mas_install "Slack" 803453959
