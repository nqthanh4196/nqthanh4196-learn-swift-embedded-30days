# Day 24 - Stepper Motor (28BYJ-48)

## 📖 Introduction
A stepper motor rotates precisely in individual steps. The 28BYJ-48 + ULN2003 driver is popular for beginners.

---

## 🎯 Key Concepts

### Specs
- Steps/revolution: 2048 (full step with gearbox)
- Step angle: 0.176°
- Supply: 5V
- 4 phase, unipolar

### Wiring Diagram
```
ULN2003     Pico
├── IN1 ──── GP10
├── IN2 ──── GP11
├── IN3 ──── GP12
└── IN4 ──── GP13
```

---

## 🏋️ Challenge
1. Rotate 1 full revolution (2048 steps)
2. Control angle precisely
3. Half-step mode for smooth rotation

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 24 - Stepper Motor (28BYJ-48)

## 📖 Giới thiệu
Stepper motor quay chính xác theo từng bước (step). 28BYJ-48 + ULN2003 driver phổ biến cho beginner.

## 🎯 Specs
- Steps/revolution: 2048 (full step with gearbox)
- Step angle: 0.176°
- Supply: 5V
- 4 phase, unipolar

## Sơ đồ nối
```
ULN2003     Pico
├── IN1 ──── GP10
├── IN2 ──── GP11
├── IN3 ──── GP12
└── IN4 ──── GP13
```

---

## 🏋️ Challenge
1. Quay 1 vòng (2048 steps)
2. Điều khiển góc chính xác
3. Half-step mode cho smooth rotation
