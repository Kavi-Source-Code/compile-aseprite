#!/bin/bash
read "Do you want to cleanup yet (y/n)?: " clean
if [ clean ]; then
    echo "Cleaning up temporary files..."
    rm -rf bin
fi
echo "Done!"
