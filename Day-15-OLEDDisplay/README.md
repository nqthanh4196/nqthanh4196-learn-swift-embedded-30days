# Day 15 - I2C: OLED Display (SSD1306)

## 📖 Giới thiệu

SSD1306 là chip driver cho OLED 0.96" (128x64 pixels). Giao tiếp qua I2C, hiển thị text, graphics, và charts.

---

## 🎯 Kiến thức chính

### 1. SSD1306 OLED

| Thông số | Giá trị |
|----------|---------|
| Resolution | 128 x 64 pixels |
| Interface | I2C (0x3C) hoặc SPI |
| Voltage | 3.3V - 5V |
| Memory | 128 x 64 / 8 = 1024 bytes |
| Pages | 8 (mỗi page = 8 rows) |

### 2. Sơ đồ nối

```
SSD1306        Pico
├── VCC   ──── 3.3V
├── GND   ──── GND
├── SDA   ──── GP4 (I2C0 SDA)
└── SCL   ──── GP5 (I2C0 SCL)
```

### 3. Memory layout

```
Page 0: pixels y=0..7   (128 bytes)
Page 1: pixels y=8..15  (128 bytes)
Page 2: pixels y=16..23 (128 bytes)
...
Page 7: pixels y=56..63 (128 bytes)

Total: 8 pages × 128 columns = 1024 bytes
```

### 4. Quy trình điều khiển

```swift
// 1. Send command (control byte = 0x00)
func sendCommand(_ cmd: UInt8) {
    var data = [0x00, cmd]
    i2c_write_blocking(i2c0, 0x3C, &data, 2, false)
}

// 2. Send data (control byte = 0x40)
func sendData(_ buffer: [UInt8]) {
    var data = [UInt8(0x40)] + buffer
    i2c_write_blocking(i2c0, 0x3C, &data, data.count, false)
}

// 3. Set pixel
func setPixel(x: Int, y: Int) {
    let page = y / 8
    let bit = y % 8
    frameBuffer[page * 128 + x] |= (1 << bit)
}
```

---

## 📝 Tóm tắt

- SSD1306: OLED 128x64, I2C @ 0x3C
- Frame buffer: 1024 bytes (1 bit per pixel)
- Chia thành 8 pages (mỗi page 8 pixel cao)
- Command mode (0x00) vs Data mode (0x40)

---

## 🏋️ Challenge

1. Hiển thị "Hello Pico!" trên OLED
2. Hiển thị nhiệt độ đọc từ BMP280
3. Vẽ đồ thị nhiệt độ real-time
