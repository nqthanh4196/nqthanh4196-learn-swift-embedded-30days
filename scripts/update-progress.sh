#!/bin/bash
# update-progress.sh - Update README.md progress table
set -e

TOPICS=(
"Introduction to Swift Embedded & Environment Setup"
"GPIO Output - Blink LED"
"GPIO Input - Reading a Button"
"PWM - LED Brightness Control"
"Timer & Interrupts"
"Debounce Button & State Machine"
"Multiple LEDs - Traffic Light"
"Analog Input (ADC) - Reading Sensors"
"Advanced PWM - Servo Motor"
"Buzzer - Playing Sounds"
"UART - Serial Communication"
"I2C - Basic Communication"
"SPI - High-Speed Communication"
"I2C - Temperature Sensor (BMP280)"
"I2C - OLED Display (SSD1306)"
"SPI - LED Matrix (MAX7219)"
"DMA - Direct Memory Access"
"Watchdog Timer & Power Management"
"Flash Storage - Data Persistence"
"PIO - Programmable I/O"
"DHT22 - Temperature & Humidity Sensor"
"Ultrasonic Sensor (HC-SR04)"
"DC Motor & H-Bridge (L298N)"
"Stepper Motor (28BYJ-48)"
"IR Remote Control"
"NeoPixel LED Strip (WS2812B)"
"WiFi with Pico W - HTTP Request"
"WiFi - Web Server on Pico W"
"MQTT - IoT Communication"
"Final Project - IoT Weather Station"
)

TOPICS_VI=(
"Giới thiệu Swift Embedded & Setup môi trường"
"GPIO Output - Blink LED"
"GPIO Input - Đọc nút nhấn"
"PWM - Điều khiển độ sáng LED"
"Timer & Interrupts"
"Debounce Button & State Machine"
"Multiple LEDs - Traffic Light"
"Analog Input (ADC) - Đọc cảm biến"
"PWM nâng cao - Servo Motor"
"Buzzer - Phát âm thanh"
"UART - Giao tiếp Serial"
"I2C - Giao tiếp cơ bản"
"SPI - Giao tiếp tốc độ cao"
"I2C - Đọc cảm biến nhiệt độ (BMP280)"
"I2C - OLED Display (SSD1306)"
"SPI - LED Matrix (MAX7219)"
"DMA - Direct Memory Access"
"Watchdog Timer & Power Management"
"Flash Storage - Lưu dữ liệu"
"PIO - Programmable I/O"
"DHT22 - Cảm biến nhiệt độ & độ ẩm"
"Ultrasonic Sensor (HC-SR04)"
"DC Motor & H-Bridge (L298N)"
"Stepper Motor (28BYJ-48)"
"IR Remote Control"
"NeoPixel LED Strip (WS2812B)"
"WiFi với Pico W - HTTP Request"
"WiFi - Web Server trên Pico W"
"MQTT - IoT Communication"
"Final Project - Weather Station IoT"
)

# Build EN progress table
TMPFILE=$(mktemp)
echo "| Day | Topic | Status |" > "$TMPFILE"
echo "|-----|-------|--------|" >> "$TMPFILE"

for i in $(seq 1 30); do
  DAY_PADDED=$(printf "%02d" "$i")
  if ls -d Day-${DAY_PADDED}-* &>/dev/null; then
    STATUS="✅"
  else
    STATUS="⬜"
  fi
  echo "| $DAY_PADDED | ${TOPICS[$((i-1))]} | $STATUS |" >> "$TMPFILE"
done

# Replace EN content between markers
python3 -c "
import re, sys
with open('README.md', 'r') as f:
    content = f.read()
with open('$TMPFILE', 'r') as f:
    table = f.read()
result = re.sub(
    r'(<!-- PROGRESS_START -->).*?(<!-- PROGRESS_END -->)',
    r'\1\n' + table + r'\2',
    content,
    flags=re.DOTALL
)
with open('README.md', 'w') as f:
    f.write(result)
"

# Build VI progress table
TMPFILE_VI=$(mktemp)
echo "| Ngày | Chủ đề | Trạng thái |" > "$TMPFILE_VI"
echo "|------|--------|------------|" >> "$TMPFILE_VI"

for i in $(seq 1 30); do
  DAY_PADDED=$(printf "%02d" "$i")
  if ls -d Day-${DAY_PADDED}-* &>/dev/null; then
    STATUS="✅"
  else
    STATUS="⬜"
  fi
  echo "| $DAY_PADDED | ${TOPICS_VI[$((i-1))]} | $STATUS |" >> "$TMPFILE_VI"
done

# Replace VI content between markers
python3 -c "
import re, sys
with open('README.md', 'r') as f:
    content = f.read()
with open('$TMPFILE_VI', 'r') as f:
    table = f.read()
result = re.sub(
    r'(<!-- PROGRESS_START_VI -->).*?(<!-- PROGRESS_END_VI -->)',
    r'\1\n' + table + r'\2',
    content,
    flags=re.DOTALL
)
with open('README.md', 'w') as f:
    f.write(result)
"

rm -f "$TMPFILE" "$TMPFILE_VI"
echo "✅ README progress updated"
