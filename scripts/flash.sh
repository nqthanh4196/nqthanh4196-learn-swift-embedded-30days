#!/bin/bash
# ============================================
# Flash UF2 firmware to Raspberry Pi Pico
# Usage: ./scripts/flash.sh [day-number]
# ============================================

set -e

DAY=${1:-1}
DAY_PADDED=$(printf "%02d" $DAY)

# Find the day directory
DAY_DIR=$(find . -maxdepth 1 -type d -name "Day-${DAY_PADDED}-*" | head -1)
UF2_FILE="${DAY_DIR}/build/main.uf2"

if [ ! -f "$UF2_FILE" ]; then
    echo "❌ Error: $UF2_FILE not found!"
    echo "   Run ./scripts/build.sh $DAY first."
    exit 1
fi

# Detect Pico mount point
PICO_MOUNT=""
if [ -d "/Volumes/RPI-RP2" ]; then
    PICO_MOUNT="/Volumes/RPI-RP2"
elif [ -d "/media/$USER/RPI-RP2" ]; then
    PICO_MOUNT="/media/$USER/RPI-RP2"
elif [ -d "/mnt/pico" ]; then
    PICO_MOUNT="/mnt/pico"
fi

if [ -z "$PICO_MOUNT" ]; then
    echo "❌ Error: Pico not found in BOOTSEL mode!"
    echo ""
    echo "   To enter BOOTSEL mode:"
    echo "   1. Disconnect Pico from USB"
    echo "   2. Hold the BOOTSEL button"
    echo "   3. While holding, connect USB"
    echo "   4. Release button"
    echo "   5. Pico appears as USB drive 'RPI-RP2'"
    exit 1
fi

echo "🚀 Flashing: $UF2_FILE"
echo "   Target: $PICO_MOUNT"
cp "$UF2_FILE" "$PICO_MOUNT/"

echo "✅ Flash complete! Pico will reboot automatically."
echo "📟 Open serial monitor: screen /dev/tty.usbmodem* 115200"
