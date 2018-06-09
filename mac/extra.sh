#!/bin/sh

brew install wget
brew cask install --appdir="$MAC_APPS" caffeine
brew cask install --appdir="$MAC_APPS" flycut

# Terminal > Preferences... > (Profile) > Advanced, "Declare terminal as:" xterm-256color
