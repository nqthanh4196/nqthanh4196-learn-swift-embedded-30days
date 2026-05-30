# Day 23 - DC Motor & H-Bridge (L298N)

## 📖 Giới thiệu
L298N là H-Bridge driver cho DC motor, cho phép điều khiển hướng quay và tốc độ bằng PWM.

---

## 🎯 Sơ đồ nối
```
L298N          Pico
├── IN1   ──── GP14
├── IN2   ──── GP15
├── ENA   ──── GP13 (PWM)
├── +12V  ──── External power (6-12V)
├── GND   ──── GND (shared with Pico)
└── Motor ──── DC Motor terminals
```

## 🏋️ Challenge
1. Forward/Reverse với speed control
2. Ramp up/down (smooth acceleration)
3. Dùng potentiometer điều khiển speed
