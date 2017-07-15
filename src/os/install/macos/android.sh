#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Android\n\n"



# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Android SDK" "android-sdk" "caskroom/cask" "cask"
brew_install "Android NDK" "android-ndk" "caskroom/cask" "cask"
brew_install "Android Platform Tools" "android-platform-tools" "caskroom/cask" "cask"
brew_install "Android Studio" "android-studio" "caskroom/cask" "cask"
brew_install "Android File Transfer" "android-file-transfer" "caskroom/cask" "cask"
