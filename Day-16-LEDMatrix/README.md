# Day 16 - SPI: LED Matrix (MAX7219)

## 📖 Giới thiệu

MAX7219 là IC driver cho LED 8x8 matrix hoặc 7-segment display. Giao tiếp SPI, có thể cascade nhiều module.

---

## 🎯 Kiến thức chính

### 1. MAX7219 Specs
- Interface: SPI (10MHz max)
- Drives: 8x8 LED matrix hoặc 8 digits 7-segment
- Cascadable: nhiều module nối tiếp
- Built-in BCD decoder, brightness control

### 2. Sơ đồ nối
```
MAX7219       Pico
├── VCC  ──── 5V (VBUS)
├── GND  ──── GND
├── DIN  ──── GP19 (SPI0 MOSI)
├── CS   ──── GP17 (CS)
└── CLK  ──── GP18 (SPI0 SCK)
```

### 3. Registers
```
0x01-0x08: Digit 0-7 (row data)
0x09: Decode mode
0x0A: Intensity (0x00-0x0F)
0x0B: Scan limit
0x0C: Shutdown (0=off, 1=on)
0x0F: Display test
```

---

## 🏋️ Challenge
1. Hiển thị pattern cơ bản (smile face)
2. Scrolling text trên matrix
3. Animation (bouncing ball)
