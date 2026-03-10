#!/bin/zsh
if [ ! . == "$HOME/Desktop/aseprite" ]; then
    echo "Changing directory to Desktop/aseprite..."
    cd ~/Desktop/aseprite
fi

./init.sh
./code.sh
./deps.sh
./compile.sh
./pack.sh
./clean.sh
exit 0