#!/usr/bin/env bash

read -r -p "Speed up OSX? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  # Always show hidden files
  defaults write com.apple.finder AppleShowAllFiles YES
  # Speed up keyrepeat
  defaults write NSGlobalDomain InitialKeyRepeat -int 20
  defaults write NSGlobalDomain KeyRepeat -int 1
  # Speed up window animation
  defaults write -g NSWindowResizeTime -float 0.003
  # Speed up dock animation
  defaults write com.apple.dock autohide-time-modifier \
    -float 0.25;killall Dock
fi
