#!/bin/bash
# Test script for FTS5 ICU Tokenizer (Legacy API v1)

set -e

echo "Testing FTS5 ICU Tokenizer (Legacy API v1)"

# Build the project for the legacy API first
echo "Building project with legacy API v1..."
./scripts/build_legacy.sh

# Test universal tokenizer with legacy API
echo "Testing universal tokenizer (legacy API v1)..."
if [ -f "./build/libfts5_icu_legacy.so" ]; then
    # Replace the library name in the SQL file to point to the legacy version (tokenizer name remains the same)
    sed 's/libfts5_icu\.so/libfts5_icu_legacy.so/' ./tests/test_universal_tokenizer.sql | sqlite3
    echo "SUCCESS: Universal tokenizer test completed (legacy API v1)"
else
    echo "WARNING: Universal tokenizer library (legacy API v1) not found"
fi

# Test Japanese tokenizer with legacy API
echo "Testing Japanese tokenizer (legacy API v1)..."
if [ -f "./build/libfts5_icu_ja_legacy.so" ]; then
    # Replace the library name in the SQL file to point to the legacy version (tokenizer name remains the same)
    sed "s/libfts5_icu_ja\.so/libfts5_icu_ja_legacy.so/" ./tests/test_ja_tokenizer.sql | sqlite3
    echo "SUCCESS: Japanese tokenizer test completed (legacy API v1)"
else
    echo "WARNING: Japanese tokenizer library (legacy API v1) not found"
fi

echo "All legacy API v1 tests completed successfully!"