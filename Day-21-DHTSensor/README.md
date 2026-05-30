# Day 21 - DHT22: Temperature & Humidity Sensor

## 📖 Introduction
DHT22 is a popular, affordable 1-wire sensor that measures temperature and humidity. It communicates through a single data wire with precise timing.

---

## 🎯 Key Concepts

### 1. DHT22 Specs
| Parameter | Value |
|-----------|-------|
| Humidity | 0-100% RH (±2%) |
| Temperature | -40~80°C (±0.5°C) |
| Sampling | Max 0.5Hz (2s interval) |
| Interface | 1-wire (custom protocol) |
| Supply | 3.3V - 5V |

### 2. Wiring Diagram
```
DHT22        Pico
├── VCC ──── 3.3V
├── DATA ──── GP15 + [10kΩ pull-up → 3.3V]
├── NC  ──── (not connected)
└── GND ──── GND
```

### 3. Protocol Timing
```
Master: LOW (1ms) → HIGH (release)
DHT:   LOW (80µs) → HIGH (80µs) → Data bits
Bit 0: HIGH ~26µs
Bit 1: HIGH ~70µs
Total: 40 bits (16 humidity + 16 temp + 8 checksum)
```

---

## 🏋️ Challenge
1. Read temperature and humidity from DHT22
2. Verify checksum
3. Display on OLED (combine with Day 15)

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 21 - DHT22: Cảm biến nhiệt độ & độ ẩm

## 📖 Giới thiệu
DHT22 là cảm biến 1-wire đo nhiệt độ và độ ẩm phổ biến, giá rẻ. Giao tiếp qua 1 dây data với timing chính xác.

---

## 🎯 Kiến thức chính

### 1. DHT22 Specs
| Thông số | Giá trị |
|----------|---------|
| Humidity | 0-100% RH (±2%) |
| Temperature | -40~80°C (±0.5°C) |
| Sampling | Max 0.5Hz (2s interval) |
| Interface | 1-wire (custom protocol) |
| Supply | 3.3V - 5V |

### 2. Sơ đồ nối
```
DHT22        Pico
├── VCC ──── 3.3V
├── DATA ──── GP15 + [10kΩ pull-up → 3.3V]
├── NC  ──── (not connected)
└── GND ──── GND
```

### 3. Protocol Timing
```
Master: LOW (1ms) → HIGH (release)
DHT:   LOW (80µs) → HIGH (80µs) → Data bits
Bit 0: HIGH ~26µs
Bit 1: HIGH ~70µs
Total: 40 bits (16 humidity + 16 temp + 8 checksum)
```

---

## 🏋️ Challenge
1. Đọc temperature và humidity từ DHT22
2. Verify checksum
3. Hiển thị trên OLED (kết hợp Day 15)
