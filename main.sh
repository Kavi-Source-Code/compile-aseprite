#!/bin/bash

echo "Adding run permissions..."
sleep 0.5
chmod +x init.sh code.sh deps.sh compile.sh pack.sh clean.sh update.sh

read -p "Are you looking to update aseprite, or compile(c/u): " uorc
if [ "$uorc" = c ]; then
    ./init.sh
    ./code.sh
    ./deps.sh
    ./compile.sh
    ./pack.sh
    ./clean.sh

else
    ./update.sh
fi
exit 0
