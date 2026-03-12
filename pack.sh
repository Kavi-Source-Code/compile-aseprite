#!/bin/bash
read -p "Do you want to cleanup yet (y/n)? " answer

if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    echo "Cleaning up temporary files..."
    rm -rf bin
fi
echo "Done!"
