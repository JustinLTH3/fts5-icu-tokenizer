#!/bin/bash
# Build script for FTS5 ICU Tokenizer (Legacy API v1)

set -e

echo "Building FTS5 ICU Tokenizer (Legacy API v1)"

# Create build directory if it doesn't exist
mkdir -p build
cd build

# Check if a locale was provided as an argument
if [ $# -eq 0 ]; then
    echo "Building universal tokenizer (legacy API v1)"
    cmake .. -DAPI_VERSION=v1
else
    echo "Building tokenizer for locale: $1 (legacy API v1)"
    cmake .. -DAPI_VERSION=v1 -DLOCALE=$1
fi

# Build the project
cmake --build .

echo "Build completed successfully!"
echo "Libraries are located in the build directory:"
ls -la libfts5_icu*.so
echo ""
echo "Note: libfts5_icu*_legacy.so are the legacy API v1 libraries"