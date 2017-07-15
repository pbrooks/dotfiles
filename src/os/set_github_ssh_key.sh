#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_ssh_configs() {

    printf "%s\n" \
        "Host github.com" \
        "  IdentityFile $1" \
        "  LogLevel ERROR" >> ~/.ssh/config

    print_result $? "Add SSH configs"

}

open_github_ssh_page() {

    declare -r GITHUB_SSH_URL="https://github.com/settings/ssh"

    # The order of the following checks matters
    # as on Ubuntu there is also a utility called `open`.

    if cmd_exists "xdg-open"; then
        xdg-open "$GITHUB_SSH_URL"
    elif cmd_exists "open"; then
        open "$GITHUB_SSH_URL"
    else
        print_warning "Please add the public SSH key to GitHub ($GITHUB_SSH_URL)"
    fi

}

set_github_ssh_key() {

    local sshKeyFileName="$HOME/.ssh/github"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If there is already a file with that
    # name, generate another, unique, file name.

    if [ -f "$sshKeyFileName" ]; then
        sshKeyFileName="$(mktemp -u "$HOME/.ssh/github_XXXXX")"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


    ask "Please provide an email address: " && printf "\n"

    generate_ssh_keys "$sshKeyFileName" "$(get_answer)"
    add_ssh_configs "$sshKeyFileName"
    copy_public_ssh_key_to_clipboard "${sshKeyFileName}.pub"
    open_github_ssh_page
    test_ssh_connection "git@github.com"\
        && rm "${sshKeyFileName}.pub"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Set up GitHub SSH keys\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! is_git_repository; then
        print_error "Not a Git repository"
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ssh -T git@github.com &> /dev/null

    if [ $? -ne 1 ]; then
        set_github_ssh_key
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_result $? "Set up GitHub SSH keys"

}

main
