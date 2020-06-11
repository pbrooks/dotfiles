#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugins() {

    declare -r VIMPLUG_FILE="$HOME/.vim/autoload/plug.vim"
    declare -r VIMPLUG_SOURCE="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install plugins.

    execute \
    	"curl -fLo $VIMPLUG_FILE --create-dirs \
	   $VIMPLUG_SOURCE" \
        "Install plugins" \
        || return 1
    vim +PlugInstall +qall

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


main() {

    print_in_purple "\n   Vim\n\n"

    "./$(get_os)/vim.sh"
    install_plugins

    printf "\n"

}

main
