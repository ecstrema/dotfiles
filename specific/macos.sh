#!/usr/bin/env bash

# Install Homebrew if missing
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Activate Homebrew for the current script execution
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add to .zprofile only if it doesn't already exist
if ! grep -q "/opt/homebrew/bin/brew shellenv" ~/.zprofile; then
    echo >> ~/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
fi

brew install --cask zen
brew install --cask visual-studio-code
brew install --cask font-fira-code-nerd-font
brew install --cask microsoft-outlook
brew install --cask bitwarden
brew install --cask whatsapp
brew install --cask last-window-quits

brew install --cask crmne/tap/fastpotify
find /Applications/Fastpotify.app -exec xattr -d com.apple.quarantine {} \; 2>/dev/null


brew install starship
brew install uv
brew install bun
brew install nodejs

defaults write com.apple.finder AppleShowAllFiles true

echo "Done"
