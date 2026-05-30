# 🔌 Learn Embedded Swift in 30 Days - Raspberry Pi Pico

Học lập trình Embedded bằng Swift trên Raspberry Pi Pico từ cơ bản đến nâng cao trong 30 ngày, mỗi ngày 1 bài học kèm project demo thực tế.

> Sử dụng [Swift Embedded](https://github.com/apple/swift-embedded-examples) để lập trình vi điều khiển RP2040 🤖

## 📋 Progress

<!-- PROGRESS_START -->
| Day | Topic | Status |
|-----|-------|--------|
| 01 | Giới thiệu Swift Embedded & Setup môi trường | ⬜ |
| 02 | GPIO Output - Blink LED | ⬜ |
| 03 | GPIO Input - Đọc nút nhấn | ⬜ |
| 04 | PWM - Điều khiển độ sáng LED | ⬜ |
| 05 | Timer & Interrupts | ⬜ |
| 06 | Debounce Button & State Machine | ⬜ |
| 07 | Multiple LEDs - Traffic Light | ⬜ |
| 08 | Analog Input (ADC) - Đọc cảm biến | ⬜ |
| 09 | PWM nâng cao - Servo Motor | ⬜ |
| 10 | Buzzer - Phát âm thanh | ⬜ |
| 11 | UART - Giao tiếp Serial | ⬜ |
| 12 | I2C - Giao tiếp cơ bản | ⬜ |
| 13 | SPI - Giao tiếp tốc độ cao | ⬜ |
| 14 | I2C - Đọc cảm biến nhiệt độ (BMP280) | ⬜ |
| 15 | I2C - OLED Display (SSD1306) | ⬜ |
| 16 | SPI - LED Matrix (MAX7219) | ⬜ |
| 17 | DMA - Direct Memory Access | ⬜ |
| 18 | Watchdog Timer & Power Management | ⬜ |
| 19 | Flash Storage - Lưu dữ liệu | ⬜ |
| 20 | PIO - Programmable I/O | ⬜ |
| 21 | DHT22 - Cảm biến nhiệt độ & độ ẩm | ⬜ |
| 22 | Ultrasonic Sensor (HC-SR04) | ⬜ |
| 23 | DC Motor & H-Bridge (L298N) | ⬜ |
| 24 | Stepper Motor (28BYJ-48) | ⬜ |
| 25 | IR Remote Control | ⬜ |
| 26 | NeoPixel LED Strip (WS2812B) | ⬜ |
| 27 | WiFi với Pico W - HTTP Request | ⬜ |
| 28 | WiFi - Web Server trên Pico W | ⬜ |
| 29 | MQTT - IoT Communication | ⬜ |
| 30 | Final Project - Weather Station IoT | ⬜ |
<!-- PROGRESS_END -->

## 📁 Structure

```
Day-XX-TopicName/
├── README.md          # Lý thuyết + giải thích + sơ đồ nối mạch
├── Sources/
│   └── Main.swift     # Code chính
└── Examples/
    └── example.swift  # Ví dụ bổ sung
```

## 🛠️ Requirements

### Hardware
- Raspberry Pi Pico / Pico W (RP2040)
- Breadboard + Jumper wires
- LED, Resistors (220Ω, 10kΩ)
- Push buttons
- Các cảm biến & module theo từng bài

### Software
- Swift 5.9+ (với Embedded support)
- CMake 3.24+
- Pico SDK 1.5+
- ARM GCC Toolchain
- macOS / Linux

## 🚀 Quick Start

```bash
# Clone repo
git clone https://github.com/YOUR_USERNAME/learn-embedded-swift-30days.git
cd learn-embedded-swift-30days

# Setup Pico SDK
export PICO_SDK_PATH=/path/to/pico-sdk

# Build a specific day
cd Day-02-BlinkLED
mkdir build && cd build
cmake ..
make

# Flash to Pico (hold BOOTSEL while plugging in USB)
cp main.uf2 /Volumes/RPI-RP2/
```

## 📖 Tài liệu tham khảo
- [Swift Embedded Examples](https://github.com/apple/swift-embedded-examples)
- [Raspberry Pi Pico Datasheet](https://datasheets.raspberrypi.com/pico/pico-datasheet.pdf)
- [RP2040 Datasheet](https://datasheets.raspberrypi.com/rp2040/rp2040-datasheet.pdf)
- [Pico SDK Documentation](https://raspberrypi.github.io/pico-sdk-doxygen/)

## 👤 Author
Learning Embedded Swift with Raspberry Pi Pico 🚀
