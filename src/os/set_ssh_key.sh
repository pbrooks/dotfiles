#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh" \
    && . "utils_ssh.sh"


set_ssh_key() {


    if [ -f "$1" ]; then
        print_result 0 "SSH Key already exists"
        exit 0
    fi

    generate_ssh_keys $1 $2
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Set up SSH keys\n\n"

    local sshKeyFileName="$HOME/.ssh/id_rsa"

    set_ssh_key $sshKeyFileName $1

    print_result $? "Generate SSH Key"

    add_ssh_key $sshKeyFileName

    print_result $? "Add SSH key to agent"

}

main $@
