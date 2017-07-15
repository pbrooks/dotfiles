#!/bin/bash

copy_public_ssh_key_to_clipboard () {

    if cmd_exists "pbcopy"; then

        pbcopy < "$1"
        print_result $? "Copy public SSH key to clipboard"

    elif cmd_exists "xclip"; then

        xclip -selection clip < "$1"
        print_result $? "Copy public SSH key to clipboard"

    else
        print_warning "Please copy the public SSH key ($1) to clipboard"
    fi

}

generate_ssh_keys() {

    ssh-keygen -t rsa -b 4096 -C "$2" -f "$1"

    print_result $? "Generate SSH keys"
}

add_ssh_key() {
    ssh-add -K $1
}

test_ssh_connection() {

    while true; do

        ssh -o 'PreferredAuthentications=publickey' -T $1 quit &> /dev/null
        local ret=$?
        [ $ret -eq 1 ] && break
        [ $ret -eq 127 ] && break

        sleep 5

    done

}

