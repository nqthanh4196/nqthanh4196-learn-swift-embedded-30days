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

## 🏋️ Challenge
1. Quay 1 vòng (2048 steps)
2. Điều khiển góc chính xác
3. Half-step mode cho smooth rotation
