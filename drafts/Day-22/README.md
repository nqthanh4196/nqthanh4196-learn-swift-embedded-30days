# Day 22 - Ultrasonic Sensor (HC-SR04)

## 📖 Introduction
HC-SR04 measures distance using ultrasonic waves. It sends a pulse → measures echo time → calculates distance.

---

## 🎯 Key Concepts

### Wiring Diagram
```
HC-SR04       Pico
├── VCC  ──── 5V (VBUS)
├── TRIG ──── GP14
├── ECHO ──── [Voltage divider] ──── GP15
└── GND  ──── GND

Voltage divider (5V → 3.3V):
ECHO ── [1kΩ] ── GP15 ── [2kΩ] ── GND
```

### Formula
```
distance_cm = echo_duration_us × 0.034 / 2
(Speed of sound: 343 m/s at 20°C)
```

---

## 🏋️ Challenge
1. Measure distance, display via serial
2. Proximity alarm (buzzer when < 30cm)
3. Display distance on OLED

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 22 - Ultrasonic Sensor (HC-SR04)

## 📖 Giới thiệu
HC-SR04 đo khoảng cách bằng sóng siêu âm. Gửi pulse → đo thời gian echo → tính khoảng cách.

---

## 🎯 Kiến thức chính

### Sơ đồ nối
```
HC-SR04       Pico
├── VCC  ──── 5V (VBUS)
├── TRIG ──── GP14
├── ECHO ──── [Voltage divider] ──── GP15
└── GND  ──── GND

Voltage divider (5V → 3.3V):
ECHO ── [1kΩ] ── GP15 ── [2kΩ] ── GND
```

### Công thức
```
distance_cm = echo_duration_us × 0.034 / 2
(Speed of sound: 343 m/s at 20°C)
```

---

## 🏋️ Challenge
1. Đo khoảng cách, hiển thị ra serial
2. Proximity alarm (buzzer khi < 30cm)
3. Hiển thị distance trên OLED
