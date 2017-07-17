#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

brew_install "dockutil" "dockutil"

brew_install "Alfred" "alfred" "caskroom/cask" "cask"
brew_install "Banktivity" "banktivity" "caskroom/cask" "cask"
brew_install "Chicken VNC" "chicken" "caskroom/cask" "cask"
brew_install "Controllermate" "controllermate" "caskroom/cask" "cask"
brew_install "Daisydisk" "daisydisk" "caskroom/cask" "cask"
brew_install "Dash" "dash" "caskroom/cask" "cask"
brew_install "Dropbox" "dropbox" "caskroom/cask" "cask"
brew_install "Docker" "docker-toolbox" "caskroom/cask" "cask"
brew_install "Fastlane" "fastlane" "caskroom/cask" "cask"
brew_install "Gyazo" "gyazo" "caskroom/cask" "cask"
brew_install "iExplorer" "iexplorer" "caskroom/cask" "cask"
brew_install "iTerm" "iterm2" "caskroom/cask" "cask"
brew_install "Kaleidoscope" "kaleidoscope" "caskroom/cask" "cask"
brew_install "Omnigraffle" "omnigraffle" "caskroom/cask" "cask"
brew_install "Microsoft Office" "microsoft-office" "caskroom/cask" "cask"
brew_install "Postman" "postman" "caskroom/cask" "cask"
brew_install "Skype" "skype" "caskroom/cask" "cask"
brew_install "Spotify" "spotify" "caskroom/cask" "cask"
brew_install "Steam" "steam" "caskroom/cask" "cask"
brew_install "SteamCMD" "steamcmd" "caskroom/cask" "cask"
brew_install "Transmit" "transmit" "caskroom/cask" "cask"
brew_install "Tripmode" "tripmode" "caskroom/cask" "cask"
brew_install "Toggl" "toggldesktop" "caskroom/cask" "cask"
brew_install "Unarchiver" "the-unarchiver" "caskroom/cask" "cask"
brew_install "VLC" "vlc" "caskroom/cask" "cask"
brew_install "Viscosity" "viscosity" "caskroom/cask" "cask"
brew_install "Virtualbox" "virtualbox" "caskroom/cask" "cask"
brew_install "Virtualbox Extensions" "virtualbox-extension-pack" "caskroom/cask" "cask"
brew_install "Whatsapp" "whatsapp" "caskroom/cask" "cask"
brew_install "Wireshark" "wireshark" "caskroom/cask" "cask"
brew_install "xquartz" "xquartz" "caskroom/cask" "cask"
