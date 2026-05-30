#!/bin/bash
# ============================================
# Build script for Embedded Swift Pico project
# Usage: ./scripts/build.sh [day-number]
# Example: ./scripts/build.sh 2
# ============================================

set -e

# Check PICO_SDK_PATH
if [ -z "$PICO_SDK_PATH" ]; then
    echo "❌ Error: PICO_SDK_PATH not set!"
    echo "   export PICO_SDK_PATH=/path/to/pico-sdk"
    exit 1
fi

# Get day number
DAY=${1:-1}
DAY_PADDED=$(printf "%02d" $DAY)

# Find the day directory
DAY_DIR=$(find . -maxdepth 1 -type d -name "Day-${DAY_PADDED}-*" | head -1)

if [ -z "$DAY_DIR" ]; then
    echo "❌ Error: Day-${DAY_PADDED} directory not found!"
    exit 1
fi

echo "🔨 Building: $DAY_DIR"
echo ""

# Create build directory
mkdir -p "${DAY_DIR}/build"
cd "${DAY_DIR}/build"

# Run CMake
echo "⚙️  Running CMake..."
cmake .. -DPICO_SDK_PATH=$PICO_SDK_PATH

# Build
echo "🔨 Compiling..."
make -j$(nproc 2>/dev/null || sysctl -n hw.ncpu)

echo ""
echo "✅ Build successful!"
echo "📁 Output: ${DAY_DIR}/build/main.uf2"
echo ""
echo "🚀 To flash: Hold BOOTSEL on Pico, plug USB, then:"
echo "   cp ${DAY_DIR}/build/main.uf2 /Volumes/RPI-RP2/"
