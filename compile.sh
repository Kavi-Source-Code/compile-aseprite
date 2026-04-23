#!/bin/bash
cd aseprite || exit 1
echo "Welcome to the Aseprite compilation script!"
echo -e "\n For nontechnical (casual) users."
sleep 0.5

REL=Release-$(uname -m)
SKIA_DIR="$HOME/deps/skia"

echo "Verifying skia dir..."
echo "Skia dir: $SKIA_DIR"

if [ -d "$SKIA_DIR" ]; then
    sleep 2
    echo "Compiling Aseprite"
    sleep 2
    mkdir -p build
    cd build || exit 1
    
    echo "Configuring..."
    sleep 2
    read -n 1 -s -r -p "Press any key to continue"
    sleep 1
    
    cmake .. \
      -G Ninja \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DLAF_BACKEND=skia \
      -DSKIA_DIR="$SKIA_DIR" \
      -DSKIA_LIBRARY_DIR="$SKIA_DIR/out/$REL" \
      -DSKIA_LIBRARY="$SKIA_DIR/out/$REL/libskia.a" \
      -DWEBP_LIBRARIES="$SKIA_DIR/out/$REL/libwebp.a" \
      -DPNG_ARM_NEON:STRING=on

    echo "Building..."
    sleep 2
    read -n 1 -s -r -p "Press any key to continue"
    
    ninja aseprite
    echo "Congratulations! Aseprite compilation complete."
    echo -e "- success\n:)"
    cd bin
    echo "Moving aseprite..."
    mv Aseprite.app ~/Applications/
    echo "..."
    sleep 2
    echo "Moved Aseprite."
else
    echo "Error: Skia directory not found at $SKIA_DIR"
    exit 1
fi

exit 0
