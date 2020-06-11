#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh" \
    && . "./utils.sh"

cd wsl

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

./../build-essentials.sh

./../git.sh
./../misc.sh
./../misc_tools.sh
./../tmux.sh
./../../vim.sh
./../zsh.sh

./../cleanup.sh
