#!/bin/bash
echo "Starting Aseprite compilation process..."
if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed. Skipping installation."
fi
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Homebrew environment setup completed."
sleep 1
if command -v brew >/dev/null 2>&1; then
    echo "Success: Homebrew is ready to use."
    brew --version
else
    echo "Error: Homebrew installation failed or 'brew' is not in your PATH."
    exit 1
fi
echo "Updating Homebrew..."
brew update
echo "Installing Aseprite dependencies..."
brew install cmake ninja pkg-config
echo "Dependencies installation completed."
