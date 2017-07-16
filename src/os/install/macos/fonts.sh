#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Fonts\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Source Code Pro (Powerline)" "font-source-code-pro-for-powerline" "caskroom/fonts" "casks"
