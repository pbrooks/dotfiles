#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

change_default_shell() {

    local newShellPath="/usr/bin/$1"

    local user="$(whoami)"
    sudo chsh -s "$newShellPath" "$user" &> /dev/null
    print_result $? "Changed shell to $newShellPath"
}

main() {

    print_in_purple "\n   ZSH\n\n"

    install_package "Zsh" "zsh"
    if [ ! -e "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi

    change_default_shell "zsh"
}

main
