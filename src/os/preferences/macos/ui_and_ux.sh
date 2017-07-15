#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   UI & UX\n\n"


execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true && \
         defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" \
   "Avoid creating '.DS_Store' files on network or USB volumes"

execute "defaults write com.apple.menuextra.battery ShowPercent -string 'NO'" \
    "Hide battery percentage from the menu bar"

execute "sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true" \
    "Show language menu in the top right corner of the boot screen"

execute "defaults write com.apple.CrashReporter UseUNC 1" \
    "Make crash reports appear as notifications"

execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
    "Disable 'Are you sure you want to open this application?' dialog"

execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
    "Automatically quit the printer app once the print jobs are completed"

execute "defaults write com.apple.screencapture disable-shadow -bool true" \
    "Disable shadow in screenshots"

execute "defaults write com.apple.screencapture location -string '$HOME/Desktop'" \
    "Save screenshots to the Desktop"

execute "defaults write com.apple.screencapture type -string 'png'" \
    "Save screenshots as PNGs"

execute "defaults write com.apple.screensaver askForPassword -int 1 && \
         defaults write com.apple.screensaver askForPasswordDelay -int 0"\
    "Require password immediately after into sleep or screen saver mode"

execute "defaults -currentHost write com.apple.screensaver idleTime -100"\
    "Start the screensaver after 100 seconds"

execute "defaults write -g AppleFontSmoothing -int 2" \
    "Enable subpixel font rendering on non-Apple LCDs"

execute "defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true"\
    "Enable HiDPI display modes (requires restart)"

execute "defaults write -g AppleShowScrollBars -string 'Always'" \
    "Always show scrollbars"

execute "defaults write -g NSDisableAutomaticTermination -bool true" \
    "Disable automatic termination of inactive apps"

execute "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true" \
    "Expand save panel by default"

execute "defaults write -g NSTableViewDefaultSizeMode -int 2" \
    "Set sidebar icon size to medium"

execute "defaults write -g NSUseAnimatedFocusRing -bool false" \
    "Disable the over-the-top focus ring animation"

execute "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
    "Disable resume system-wide"

execute "defaults write -g PMPrintingExpandedStateForPrint -bool true" \
    "Expand print panel by default"

execute "sudo systemsetup -setrestartfreeze on" \
    "Restart automatically if the computer freezes"

NETBIOS_HOSTNAME="$(sed 's/./\U&/' <<< $HOSTNAME)"

execute "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $NETBIOS_HOSTNAME && \
         sudo scutil --set ComputerName $HOSTNAME && \
         sudo scutil --set HostName $HOSTNAME && \
         sudo scutil --set LocalHostName $HOSTNAME" \
    "Set computer name"

killall "SystemUIServer" &> /dev/null
