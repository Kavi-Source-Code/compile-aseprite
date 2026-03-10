#!/bin/bash
mv bin/Aseprite.app /Applications/
echo "Aseprite has been moved to the Applications folder."
echo "You can now run Aseprite from the Applications folder or using Spotlight."
echo "Cleaning up temporary files..."
rm -rf bin
echo "Done!"
