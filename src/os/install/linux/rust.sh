#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

main() {
    print_in_purple "\n   rust\n\n"

    install_package "rust" "rust"

    mkdir -p ~/.cargo
    touch ~/.cargo/env
}

main

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

