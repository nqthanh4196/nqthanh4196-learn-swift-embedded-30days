# Day 13 - SPI: Giao tiếp tốc độ cao

## 📖 Giới thiệu

SPI (Serial Peripheral Interface) là giao thức serial đồng bộ, tốc độ cao. Dùng cho OLED, SD Card, LED matrix, wireless modules.

---

## 🎯 Kiến thức chính

### 1. SPI vs I2C

| Đặc điểm | SPI | I2C |
|-----------|-----|-----|
| Dây | 4 (MOSI, MISO, SCK, CS) | 2 (SDA, SCL) |
| Tốc độ | 1-50+ MHz | 100kHz-1MHz |
| Duplex | Full-duplex | Half-duplex |
| Addressing | CS pin (hardware) | 7-bit address |
| Devices | 1 CS per device | 127 max |

### 2. SPI Signals

```
MOSI (Master Out, Slave In)  → Pico gửi data
MISO (Master In, Slave Out)  ← Pico nhận data
SCK  (Serial Clock)          → Clock từ Pico
CS   (Chip Select)           → LOW = active
```

### 3. SPI trên RP2040

| SPI | MOSI | MISO | SCK | CS |
|-----|------|------|-----|----|
| spi0 | GP19 | GP16 | GP18 | GP17 |
| spi1 | GP11 | GP8 | GP10 | GP9 |

### 4. Code cơ bản

```swift
// Init SPI0 at 1MHz
spi_init(spi0, 1_000_000)
gpio_set_function(18, GPIO_FUNC_SPI)  // SCK
gpio_set_function(19, GPIO_FUNC_SPI)  // MOSI
gpio_set_function(16, GPIO_FUNC_SPI)  // MISO

// CS pin (manual control)
gpio_init(17)
gpio_set_dir(17, GPIO_OUT)
gpio_put(17, true)  // CS high = inactive

// Write data
gpio_put(17, false)  // CS low = select
var txData: [UInt8] = [0x01, 0x02, 0x03]
spi_write_blocking(spi0, &txData, txData.count)
gpio_put(17, true)   // CS high = deselect
```

---

## 📝 Tóm tắt

- SPI: 4 dây, full-duplex, tốc độ cao
- Cần CS pin riêng cho mỗi slave
- Master tạo clock (SCK), slave đồng bộ theo
- Phù hợp: display, SD card, high-speed sensors

---

## 🏋️ Challenge

1. Gửi/nhận data qua SPI loopback (nối MOSI→MISO)
2. Đọc chip ID từ module SPI
3. So sánh tốc độ truyền ở các clock khác nhau
