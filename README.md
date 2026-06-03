# 🔌 Learn Embedded Swift in 30 Days - Raspberry Pi Pico

Learn embedded programming with Swift on Raspberry Pi Pico from basic to advanced in 30 days, one lesson per day with a practical demo project.

> Using [Swift Embedded](https://github.com/apple/swift-embedded-examples) to program the RP2040 microcontroller 🤖

## 📋 Progress

<!-- PROGRESS_START -->
| Day | Topic | Status |
|-----|-------|--------|
| 01 | Introduction to Swift Embedded & Environment Setup | ✅ |
| 02 | GPIO Output - Blink LED | ✅ |
| 03 | GPIO Input - Reading a Button | ✅ |
| 04 | PWM - LED Brightness Control | ✅ |
| 05 | Timer & Interrupts | ✅ |
| 06 | Debounce Button & State Machine | ✅ |
| 07 | Multiple LEDs - Traffic Light | ⬜ |
| 08 | Analog Input (ADC) - Reading Sensors | ⬜ |
| 09 | Advanced PWM - Servo Motor | ⬜ |
| 10 | Buzzer - Playing Sounds | ⬜ |
| 11 | UART - Serial Communication | ⬜ |
| 12 | I2C - Basic Communication | ⬜ |
| 13 | SPI - High-Speed Communication | ⬜ |
| 14 | I2C - Temperature Sensor (BMP280) | ⬜ |
| 15 | I2C - OLED Display (SSD1306) | ⬜ |
| 16 | SPI - LED Matrix (MAX7219) | ⬜ |
| 17 | DMA - Direct Memory Access | ⬜ |
| 18 | Watchdog Timer & Power Management | ⬜ |
| 19 | Flash Storage - Data Persistence | ⬜ |
| 20 | PIO - Programmable I/O | ⬜ |
| 21 | DHT22 - Temperature & Humidity Sensor | ⬜ |
| 22 | Ultrasonic Sensor (HC-SR04) | ⬜ |
| 23 | DC Motor & H-Bridge (L298N) | ⬜ |
| 24 | Stepper Motor (28BYJ-48) | ⬜ |
| 25 | IR Remote Control | ⬜ |
| 26 | NeoPixel LED Strip (WS2812B) | ⬜ |
| 27 | WiFi with Pico W - HTTP Request | ⬜ |
| 28 | WiFi - Web Server on Pico W | ⬜ |
| 29 | MQTT - IoT Communication | ⬜ |
| 30 | Final Project - IoT Weather Station | ⬜ |
<!-- PROGRESS_END -->

## 📁 Structure

```
Day-XX-TopicName/
├── README.md          # Theory + wiring diagrams + explanations (English & Vietnamese)
├── Sources/
│   └── Main.swift     # Main code
└── Examples/
    └── example.swift  # Extra examples
```

## 🛠️ Requirements

### Hardware
- Raspberry Pi Pico / Pico W (RP2040)
- Breadboard + Jumper wires
- LEDs, Resistors (220Ω, 10kΩ)
- Push buttons
- Sensors & modules as listed per lesson

### Software
- Swift 5.9+ (with Embedded support)
- CMake 3.24+
- Pico SDK 1.5+
- ARM GCC Toolchain
- macOS / Linux

## 🚀 Quick Start

```bash
# Clone repo
git clone https://github.com/nqthanh4196/nqthanh4196-learn-swift-embedded-30days.git
cd nqthanh4196-learn-swift-embedded-30days

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

## 📖 References
- [Swift Embedded Examples](https://github.com/apple/swift-embedded-examples)
- [Raspberry Pi Pico Datasheet](https://datasheets.raspberrypi.com/pico/pico-datasheet.pdf)
- [RP2040 Datasheet](https://datasheets.raspberrypi.com/rp2040/rp2040-datasheet.pdf)
- [Pico SDK Documentation](https://raspberrypi.github.io/pico-sdk-doxygen/)

---

# 🇻🇳 Phiên bản Tiếng Việt

# 🔌 Học Embedded Swift trong 30 ngày - Raspberry Pi Pico

Học lập trình Embedded bằng Swift trên Raspberry Pi Pico từ cơ bản đến nâng cao trong 30 ngày, mỗi ngày 1 bài học kèm project demo thực tế.

> Sử dụng [Swift Embedded](https://github.com/apple/swift-embedded-examples) để lập trình vi điều khiển RP2040 🤖

## 📋 Tiến độ

<!-- PROGRESS_START_VI -->
| Ngày | Chủ đề | Trạng thái |
|------|--------|------------|
| 01 | Giới thiệu Swift Embedded & Setup môi trường | ✅ |
| 02 | GPIO Output - Blink LED | ✅ |
| 03 | GPIO Input - Đọc nút nhấn | ✅ |
| 04 | PWM - Điều khiển độ sáng LED | ✅ |
| 05 | Timer & Interrupts | ✅ |
| 06 | Debounce Button & State Machine | ✅ |
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
<!-- PROGRESS_END_VI -->

## 📁 Cấu trúc

```
Day-XX-TopicName/
├── README.md          # Lý thuyết + sơ đồ nối mạch + giải thích (English & Tiếng Việt)
├── Sources/
│   └── Main.swift     # Code chính
└── Examples/
    └── example.swift  # Ví dụ bổ sung
```

## 🛠️ Yêu cầu

### Phần cứng
- Raspberry Pi Pico / Pico W (RP2040)
- Breadboard + Jumper wires
- LED, Resistors (220Ω, 10kΩ)
- Push buttons
- Các cảm biến & module theo từng bài

### Phần mềm
- Swift 5.9+ (với Embedded support)
- CMake 3.24+
- Pico SDK 1.5+
- ARM GCC Toolchain
- macOS / Linux

## 🚀 Bắt đầu nhanh

```bash
# Clone repo
git clone https://github.com/nqthanh4196/nqthanh4196-learn-swift-embedded-30days.git
cd nqthanh4196-learn-swift-embedded-30days

# Setup Pico SDK
export PICO_SDK_PATH=/path/to/pico-sdk

# Build một bài cụ thể
cd Day-02-BlinkLED
mkdir build && cd build
cmake ..
make

# Flash lên Pico (giữ BOOTSEL khi cắm USB)
cp main.uf2 /Volumes/RPI-RP2/
```

## 📖 Tài liệu tham khảo
- [Swift Embedded Examples](https://github.com/apple/swift-embedded-examples)
- [Raspberry Pi Pico Datasheet](https://datasheets.raspberrypi.com/pico/pico-datasheet.pdf)
- [RP2040 Datasheet](https://datasheets.raspberrypi.com/rp2040/rp2040-datasheet.pdf)
- [Pico SDK Documentation](https://raspberrypi.github.io/pico-sdk-doxygen/)

## 👤 Author
Learning Embedded Swift with Raspberry Pi Pico 🚀
