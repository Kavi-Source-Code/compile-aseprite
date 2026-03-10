#!/bin/bash
#if [ ! . == "$HOME/Desktop/compile-aseprite" ]; then
    #echo "Changing directory to Desktop..."
    #cd ~/Desktop
#fi

echo "Adding run permissions..."
sleep 0.5
chmod +x init.sh code.sh deps.sh compile.sh pack.sh clean.sh

./init.sh
./code.sh
./deps.sh
./compile.sh
./pack.sh
./clean.sh
exit 0
