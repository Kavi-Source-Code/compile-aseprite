#!/bin/bash
echo "Starting Aseprite compilation process..."
curl -o- https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
echo "Homebrew installation completed."
sleep 2
echo "Setting up Homebrew environment..."
eval "$(/opt/homebrew/bin/brew shellenv)"
echo "Homebrew environment setup completed."
sleep 1
echo "Checking if Homebrew is installed..."
if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is installed."
else
    echo "Homebrew installation failed. Please check the installation script output for errors."
    exit 1
fi
echo "Homebrew version:"
brew --version
echo "Updating Homebrew..."
brew update
sleep 0.5
echo "Homebrew update completed."
echo "Installing dependencies..."
brew install cmake ninja pkg-config
sleep 2
echo "Dependencies installation completed."
