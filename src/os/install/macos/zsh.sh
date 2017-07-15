#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

change_default_shell() {

    $newShellPath="/usr/local/bin/$1"

    local user="$(whoami)"
    sudo chsh -s "$newShellPath" "$user" &> /dev/null
    print_result $? "Changed shell to $newShellPath"
}

main() {

    print_in_purple "\n   ZSH\n\n"

    brew_install "Zsh" "zsh"
    execute "sh -c '$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)'"\
        "Install oh-my-zsh"

    change_default_shell "zsh"
}

main
