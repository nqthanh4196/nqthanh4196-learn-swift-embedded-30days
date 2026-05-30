# Day 12 - I2C: Giao tiếp cơ bản

## 📖 Giới thiệu

I2C (Inter-Integrated Circuit) là bus giao tiếp 2 dây cho phép kết nối nhiều thiết bị (sensors, displays, memory) trên cùng 1 bus. Rất phổ biến trong embedded.

---

## 🎯 Kiến thức chính

### 1. I2C là gì?

- 2 dây: **SDA** (Data) + **SCL** (Clock)
- Master-Slave architecture (Pico = Master)
- Mỗi slave có địa chỉ 7-bit duy nhất
- Tối đa 127 thiết bị trên 1 bus
- Tốc độ: 100kHz (Standard), 400kHz (Fast), 1MHz (Fast+)

### 2. I2C trên RP2040

| I2C | SDA | SCL |
|-----|-----|-----|
| i2c0 | GP4 | GP5 |
| i2c1 | GP6 | GP7 |

### 3. Sơ đồ nối

```
         3.3V
          │ │
         [R][R]  ← Pull-up resistors (4.7kΩ)
          │ │
SDA ──────┼─┼──── Device 1 (SDA)──── Device 2 (SDA)
SCL ──────┼─┼──── Device 1 (SCL)──── Device 2 (SCL)
          │ │
Pico GP4  │ └── Pico GP5
```

### 4. Code cơ bản

```swift
// Khởi tạo I2C
i2c_init(i2c0, 100_000)  // 100kHz
gpio_set_function(4, GPIO_FUNC_I2C)
gpio_set_function(5, GPIO_FUNC_I2C)
gpio_pull_up(4)
gpio_pull_up(5)

// Write 1 byte to device
var data: UInt8 = 0xFF
i2c_write_blocking(i2c0, 0x3C, &data, 1, false)

// Read 1 byte from device
var result: UInt8 = 0
i2c_read_blocking(i2c0, 0x3C, &result, 1, false)
```

### 5. Địa chỉ I2C phổ biến

| Address | Device |
|---------|--------|
| 0x27/0x3F | LCD 16x2 I2C |
| 0x3C/0x3D | SSD1306 OLED |
| 0x48 | ADS1115 ADC |
| 0x68 | MPU6050 IMU |
| 0x76/0x77 | BMP280 Temperature |

---

## 📝 Tóm tắt

- I2C: 2 dây (SDA + SCL), nhiều devices cùng bus
- Mỗi device có địa chỉ 7-bit duy nhất
- Cần pull-up resistors (4.7kΩ) trên SDA và SCL
- Scanner quét tất cả addresses để tìm devices

---

## 🏋️ Challenge

1. Viết I2C scanner, liệt kê tất cả devices trên bus
2. Đọc chip ID từ một sensor I2C
3. Kết nối 2+ devices trên cùng bus
