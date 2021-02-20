#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

main() {
    print_in_purple "\n   terminator\n\n"

    install_package "Terminator" "terminator"
}
