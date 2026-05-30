# Day 14 - I2C: Đọc cảm biến nhiệt độ (BMP280)

## 📖 Giới thiệu

Áp dụng I2C để giao tiếp với BMP280 — cảm biến nhiệt độ và áp suất phổ biến. Học cách đọc register, xử lý calibration data.

---

## 🎯 Kiến thức chính

### 1. BMP280 Specifications

| Thông số | Giá trị |
|----------|---------|
| Interface | I2C (0x76/0x77) hoặc SPI |
| Temperature | -40 ~ +85°C (±1°C) |
| Pressure | 300 ~ 1100 hPa (±1 hPa) |
| Resolution | 0.01°C / 0.01 hPa |
| Supply | 1.7V ~ 3.6V |

### 2. Sơ đồ nối

```
BMP280          Pico
├── VCC    ──── 3.3V
├── GND    ──── GND
├── SDA    ──── GP4 (I2C0 SDA)
└── SCL    ──── GP5 (I2C0 SCL)
```

### 3. Register Map

```
0xD0 - Chip ID (0x58 = BMP280)
0x88-0xA1 - Calibration data (26 bytes)
0xF4 - ctrl_meas (oversampling & mode)
0xF5 - config (standby, filter, SPI)
0xF7-0xF9 - Pressure data (20-bit)
0xFA-0xFC - Temperature data (20-bit)
```

### 4. Quy trình đọc BMP280

```swift
// 1. Verify chip ID
let id = readRegister(0xD0)  // Expect 0x58

// 2. Read calibration data
let cal = readRegisters(0x88, count: 26)

// 3. Configure (Normal mode, oversampling)
writeRegister(0xF4, value: 0x57)

// 4. Read raw temperature
let rawTemp = readRegisters(0xFA, count: 3)

// 5. Apply compensation formula
let temperature = compensate(rawTemp, calibration: cal)
```

---

## 📝 Tóm tắt

- BMP280 đo nhiệt độ + áp suất qua I2C
- Cần đọc calibration data để tính toán chính xác
- Raw data 20-bit cần compensation formula
- Từ áp suất có thể tính altitude

---

## 🏋️ Challenge

1. Đọc chip ID xác nhận BMP280
2. Đọc và hiển thị nhiệt độ mỗi giây
3. Tính toán altitude từ pressure data
