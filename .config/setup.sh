#!/bin/bash

echo "Starting setup..."

# Install dependencies
echo "Installing Xcode Command Line Tools..."
xcode-select --install || { echo "Xcode Command Line Tools installation failed"; exit 1; }

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { echo "Homebrew installation failed"; exit 1; }

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || { echo "Oh My Zsh installation failed"; exit 1; }

echo "Installing bat..."
brew install bat

echo "Installing Nerd Fonts..."
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font || { echo "Nerd Fonts installation failed"; exit 1; }

echo "Assigning Caps Lock to Control..."
echo "hidutil property --set '{\"UserKeyMapping\":[{\"HIDKeyboardModifierMappingSrc\":0x700000039,\"HIDKeyboardModifierMappingDst\":0x7000000E0}]}'" | sudo tee -a /Library/LaunchDaemons/org.capslock-to-control.plist > /dev/null
sudo launchctl load /Library/LaunchDaemons/org.capslock-to-control.plist

echo "Installing kitty..."
brew install --cask kitty || { echo "kitty installation failed"; exit 1; }

echo "Installing k9s..."
brew install k9s || { echo "k9s installation failed"; exit 1; }

echo "Installing Git..."
brew install git || { echo "Git installation failed"; exit 1; }

echo "Installing Go..."
brew install go || { echo "Go installation failed"; exit 1; }

echo "Setting up Go environment variables..."
echo "export GOPATH=$HOME/go" >> ~/.zshrc
echo "export GO111MODULE=on" >> ~/.zshrc
echo "export PATH=$PATH:$HOME/go/bin" >> ~/.zshrc
source ~/.zshrc

# Go tools
echo "Installing Go tools..."

echo "Installing asmfmt..."
go install github.com/klauspost/asmfmt/cmd/asmfmt@latest

echo "Installing gofumpt..."
go install mvdan.cc/gofumpt@latest

echo "Installing gopls..."
go install golang.org/x/tools/gopls@latest

echo "Installing goimports..."
go install golang.org/x/tools/cmd/goimports@latest

echo "Installing gotests..."
go install github.com/rakyll/gotest@latest

echo "Installing golangci-lint..."
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.53.3

echo "Installing godef..."
go install github.com/rogpeppe/godef@latest

echo "Installing golines..."
go install github.com/segmentio/golines@latest

echo "Installing gomodifytags..."
go install github.com/fatih/gomodifytags@latest

echo "Installing keyify..."
go install honnef.co/go/tools/cmd/keyify@latest

echo "Installing errcheck..."
go install github.com/kisielk/errcheck@latest

echo "Installing staticcheck..."
go install honnef.co/go/tools/cmd/staticcheck@latest

echo "Installing fillstruct..."
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest

echo "Installing goimports-reviser..."
go install github.com/incu6us/goimports-reviser@latest

echo "Installing GoIfErr..."
go install github.com/koron/iferr@latest

echo "Installing debugger for Go - Delve..."
go install github.com/go-delve/delve/cmd/dlv@latest

echo "Setup completed."
