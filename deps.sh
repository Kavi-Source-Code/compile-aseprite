#!/bin/bash
echo "Setting up dependencies for Aseprite compilation..."
sleep 1
mkdir -p ~/deps/skia
case "$OSTYPE" in
    "linux-gnu"*)
        sudo apt-get install cmake ninja-build pkg-config ninja g++ gcc clang clang++ -y
        skiarelease=Skia-Linux-Release-x86.zip
        echo "Running on Linux. Downloading Skia release: $skiarelease"
        curl -L -O https://github.com/aseprite/skia/releases/download/m124-08a5439a6b/$skiarelease
        unzip ~/Downloads/$skiarelease -d ~/deps/skia
        ;;
    "darwin"*)
        read -p "Running on macOS. Do you want to install dependencies using Homebrew? (y/n) " answer
        if [[ "$answer" != "y" ]]; then
            xcode-select --install
        fi
        brew install cmake ninja-build pkg-config ninja g++ gcc clang clang++
        skiarelease=Skia-macOS-Release-arm64.zip
        echo "Running on macOS. Downloading Skia release: $skiarelease"
        curl -L -O https://github.com/aseprite/skia/releases/download/m124-08a5439a6b/$skiarelease
        unzip ~/Downloads/$skiarelease -d ~/deps/skia
        ;;
    "cygwin")
        winget install cmake -e --id Kitware.CMake
        winget install ninja -e --id Microsoft.Ninja
        winget install llvm -e --id LLVM.LLVM
        winget install mingw -e --id MSYS2.MSYS2
        winget install visualstudio2022buildtools -e --id Microsoft.VisualStudio.2022.BuildTools
        skiarelease=Skia-Windows-Release-x86.zip
        echo "Running on Cygwin (Windows). Downloading Skia release: $skiarelease"
        curl -L -O https://github.com/aseprite/skia/releases/download/m124-08a5439a6b/$skiarelease
        unzip ~/Downloads/$skiarelease -d ~/deps/skia
        echo "Please ensure you have Visual Studio Build Tools installed and available in your PATH for Aseprite compilation."
        ;;
    "msys")
        winget install cmake -e --id Kitware.CMake
        winget install ninja -e --id Microsoft.Ninja
        winget install llvm -e --id LLVM.LLVM
        winget install mingw -e --id MSYS2.MSYS2
        winget install visualstudio2022buildtools -e --id Microsoft.VisualStudio.2022.BuildTools
        skiarelease=Skia-Windows-Release-x86.zip
        echo "Running on Msys (Windows). Downloading Skia release: $skiarelease"
        curl -L -O https://github.com/aseprite/skia/releases/download/m124-08a5439a6b/$skiarelease
        unzip ~/Downloads/$skiarelease -d ~/deps/skia
        sleep 2
        echo "Please ensure you have Visual Studio Build Tools installed and available in your PATH for Aseprite compilation."
        ;;
    "freebsd"*)
        sleep 2
        echo "Running on FreeBSD"
        echo "No Skia release available for FreeBSD. Please build Skia from source and place it in ~/deps/skia."
        exit 1
        ;;
esac
git submodule update --init --recursive
