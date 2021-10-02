#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

main() {
    print_in_purple "\n   vim\n\n"

    install_package "Vim" "vim"
    sudo rm /usr/bin/vi
    sudo ln -s /usr/bin/vim /usr/bin/vi
}

main

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

