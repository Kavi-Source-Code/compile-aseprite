#!/bin/bash
echo "Cloning Aseprite repository and its dependencies..."
git clone --recursive https://github.com/aseprite/aseprite.git
echo "Aseprite repository and deps cloned."
sleep 2
echo "- success"
