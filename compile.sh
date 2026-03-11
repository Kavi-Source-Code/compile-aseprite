#!/bin/bash
cd aseprite || exit 1
echo "Welcome to the Aseprite compilation script!"
echo -e "\n For nontechnical (casual) users."
sleep 0.5


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
      -DCMAKE_OSX_ARCHITECTURES=arm64 \
      -DCMAKE_OSX_DEPLOYMENT_TARGET=11.0 \
      -DCMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk \
      -DLAF_BACKEND=skia \
      -DSKIA_DIR="$SKIA_DIR" \
      -DSKIA_LIBRARY_DIR="$SKIA_DIR/out/Release-arm64" \
      -DSKIA_LIBRARY="$SKIA_DIR/out/Release-arm64/libskia.a" \
      -DWEBP_LIBRARIES="$SKIA_DIR/out/Release-arm64/libwebp.a" \
      -DPNG_ARM_NEON:STRING=on

    echo "Building..."
    sleep 2
    read -n 1 -s -r -p "Press any key to continue"
    
    ninja aseprite
    echo "Congratulations! Aseprite compilation complete."
    echo -e "- success\n:)"
    echo "Now find the aseprite folder, click on the build folder, and then click on the bin folder. Then drag the app into your system's applications folder."
else
    echo "Error: Skia directory not found at $SKIA_DIR"
    exit 1
fi

exit 0
