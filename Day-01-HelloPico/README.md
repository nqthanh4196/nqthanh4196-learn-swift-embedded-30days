# Day 1 - Giới thiệu Swift Embedded & Setup môi trường

## 📖 Giới thiệu

Chào mừng bạn đến với hành trình 30 ngày học Embedded Swift trên Raspberry Pi Pico! Hôm nay chúng ta sẽ tìm hiểu tổng quan về Swift Embedded, kiến trúc RP2040 và cách setup môi trường phát triển.

---

## 🎯 Kiến thức chính

### 1. Swift Embedded là gì?

Swift Embedded là một subset của Swift được thiết kế để chạy trên vi điều khiển (MCU) — nơi không có hệ điều hành, bộ nhớ giới hạn và cần kiểm soát phần cứng trực tiếp.

```swift
// Swift Embedded - Không có runtime overhead
// Không có ARC, không có reflection
// Code biên dịch trực tiếp thành machine code cho ARM Cortex-M0+
```

### 2. Raspberry Pi Pico & RP2040

| Thông số | Giá trị |
|----------|---------|
| MCU | RP2040 |
| CPU | Dual-core ARM Cortex-M0+ @ 133MHz |
| RAM | 264KB SRAM |
| Flash | 2MB (onboard) |
| GPIO | 26 pins đa chức năng |
| ADC | 3 kênh 12-bit |
| PWM | 16 kênh |
| Giao tiếp | 2x UART, 2x SPI, 2x I2C |
| Đặc biệt | 8 PIO state machines |
| Nguồn | 1.8V - 5.5V qua USB hoặc VSYS |

### 3. Pinout Raspberry Pi Pico

```
         ┌─────────────────┐
    GP0  │ 1            40 │ VBUS
    GP1  │ 2            39 │ VSYS
    GND  │ 3            38 │ GND
    GP2  │ 4            37 │ 3V3_EN
    GP3  │ 5            36 │ 3V3 (OUT)
    GP4  │ 6            35 │ ADC_VREF
    GP5  │ 7            34 │ GP28/ADC2
    GND  │ 8            33 │ GND
    GP6  │ 9            32 │ GP27/ADC1
    GP7  │ 10           31 │ GP26/ADC0
    GP8  │ 11           30 │ RUN
    GP9  │ 12           29 │ GP22
    GND  │ 13           28 │ GND
    GP10 │ 14           27 │ GP21
    GP11 │ 15           26 │ GP20
    GP12 │ 16           25 │ GP19
    GP13 │ 17           24 │ GP18
    GND  │ 18           23 │ GND
    GP14 │ 19           22 │ GP17
    GP15 │ 20           21 │ GP16
         └─────────────────┘
              USB Port
```

### 4. Setup môi trường

#### macOS:
```bash
# Cài Swift toolchain (5.9+)
# Download từ swift.org

# Cài ARM toolchain
brew install --cask gcc-arm-embedded

# Cài CMake
brew install cmake

# Clone Pico SDK
git clone https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk && git submodule update --init
export PICO_SDK_PATH=$(pwd)
```

#### Linux (Ubuntu):
```bash
# Cài Swift
wget https://download.swift.org/swift-5.9-release/ubuntu2204/swift-5.9-RELEASE/swift-5.9-RELEASE-ubuntu22.04.tar.gz
tar xzf swift-5.9-RELEASE-ubuntu22.04.tar.gz
export PATH="$PWD/swift-5.9-RELEASE-ubuntu22.04/usr/bin:$PATH"

# Cài ARM toolchain & CMake
sudo apt install gcc-arm-none-eabi cmake build-essential

# Clone Pico SDK
git clone https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk && git submodule update --init
export PICO_SDK_PATH=$(pwd)
```

### 5. Cấu trúc project Swift Embedded cho Pico

```
MyProject/
├── CMakeLists.txt       # Build configuration
├── Sources/
│   └── Main.swift       # Entry point
└── BridgingHeader.h     # Bridge C headers từ Pico SDK
```

---

## 📝 Tóm tắt

- Swift Embedded cho phép lập trình vi điều khiển bằng Swift
- Raspberry Pi Pico dùng chip RP2040 (ARM Cortex-M0+)
- Cần: Swift 5.9+, ARM GCC, CMake, Pico SDK
- Flash firmware bằng cách copy file .uf2 vào Pico (chế độ BOOTSEL)

---

## 🏋️ Challenge

1. Cài đặt đầy đủ môi trường phát triển
2. Kết nối Pico với máy tính qua USB
3. Xác nhận Pico xuất hiện dưới dạng USB mass storage (giữ BOOTSEL khi cắm)
4. Build và flash chương trình "Hello Pico" đầu tiên
