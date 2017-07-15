#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Authentication\n\n"

brew_install "unix-pass" "pass"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "1Password" "1password" "caskroom/cask" "cask"
brew_install "Authy" "authy-desktop" "caskroom/cask" "cask"
