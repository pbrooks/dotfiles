#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

main() {
    print_in_purple "\n   i3wm\n\n"

    install_package "i3wm" "i3wm"
}
