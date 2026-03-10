#!/bin/bash
cd aseprite
echo "Welcome to the Aseprite compilation script!"
SKIA_DIR="$HOME/deps/skia"
sleep 2
echo "Compiling Aseprite..."
sleep 2
mkdir build
cd build
echo "Configuring..."
sleep 2
read -n 1 -s -r -p "Press any key to continue..."
cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_OSX_ARCHITECTURES=arm64 \
  -DCMAKE_OSX_DEPLOYMENT_TARGET=11.0 \
  -DCMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk \
  -DLAF_BACKEND=skia \
  -DSKIA_DIR=$SKIA_DIR \
  -DSKIA_LIBRARY_DIR=$SKIA_DIR/out/Release-arm64 \
  -DSKIA_LIBRARY=$SKIA_DIR/out/Release-arm64/libskia.a \
  -DWEBP_LIBRARIES=$SKIA_DIR/out/Release-arm64/libwebp.a \
  -DPNG_ARM_NEON:STRING=on \
  -G Ninja \
  ..
echo "Building..."
sleep 2
read -n 1 -s -r -p "Press any key to continue..."
ninja aseprite
echo "Congratulations! Aseprite compilation complete!"
exit 0
