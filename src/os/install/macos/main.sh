#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./mas.sh
./java.sh
./bash.sh
./fonts.sh

./../nvm.sh

./android.sh
./authentication.sh
./browsers.sh
./compression_tools.sh
./cli_tools.sh
./git.sh
./gpg.sh
./image_tools.sh
./misc.sh
./misc_tools.sh
./../npm.sh
./paas.sh
./tmux.sh
./video_tools.sh
./../vim.sh
./web_font_tools.sh
./zsh.sh

./cleanup.sh
