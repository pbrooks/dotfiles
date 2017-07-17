#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_ssh_configs() {

    printf "%s\n" \
        "Host gitlab.com" \
        "  IdentityFile $1" \
        "  LogLevel ERROR" >> ~/.ssh/config

    print_result $? "Add SSH configs"

}

open_gitlab_ssh_page() {

    declare -r GITLAB_SSH_URL="https://gitlab.com/profile/keys"

    # The order of the following checks matters
    # as on Ubuntu there is also a utility called `open`.

    if cmd_exists "xdg-open"; then
        xdg-open "$GITLAB_SSH_URL"
    elif cmd_exists "open"; then
        open "$GITLAB_SSH_URL"
    else
        print_warning "Please add the public SSH key to GitLab ($GITLAB_SSH_URL)"
    fi

}

set_gitlab_ssh_key() {

    local sshKeyFileName="$HOME/.ssh/gitlab"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If there is already a file with that
    # name, generate another, unique, file name.

    if [ -f "$sshKeyFileName" ]; then
        sshKeyFileName="$(mktemp -u "$HOME/.ssh/gitlab_XXXXX")"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


    ask "Please provide an email address: " && printf "\n"

    generate_ssh_keys "$sshKeyFileName" "$(get_answer)"
    add_ssh_configs "$sshKeyFileName"
    copy_public_ssh_key_to_clipboard "${sshKeyFileName}.pub"
    open_gitlab_ssh_page
    test_ssh_connection "git@gitlab.com"\
        && rm "${sshKeyFileName}.pub"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Set up GitLab SSH keys\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! is_git_repository; then
        print_error "Not a Git repository"
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ssh -T git@gitlab.com &> /dev/null

    if [ $? -ne 1 ]; then
        set_gitlab_ssh_key
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_result $? "Set up GitLab SSH keys"

}

main
