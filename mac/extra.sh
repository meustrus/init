#!/bin/sh

brew list wget >/dev/null 2>&1 || brew install wget
brew cask list caffeine >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" caffeine
brew cask list flycut >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" flycut

# Terminal > Preferences... > (Profile) > Advanced, "Declare terminal as:" xterm-256color
