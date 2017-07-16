#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Sharing\n\n"

execute "launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist" \
    "Enable screen sharing"

execute "systemsetup -f setremotelogin on" \
    "Enable SSH login"
