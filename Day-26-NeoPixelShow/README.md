# Day 26 - NeoPixel LED Strip (WS2812B)

## 📖 Giới thiệu
WS2812B (NeoPixel) là LED RGB addressable — mỗi LED có thể set màu riêng. Dùng PIO cho timing chính xác.

## 🎯 Protocol
- 1 wire, 800kHz
- 24 bits/LED (G8+R8+B8)
- Timing: bit 0 (0.4µs H, 0.85µs L), bit 1 (0.8µs H, 0.45µs L)
- Reset: >50µs LOW

## Sơ đồ
```
Pico GP28 → DIN (WS2812B strip)
5V → VCC, GND → GND
```

## 🏋️ Challenge
1. Set từng LED riêng lẻ
2. Rainbow animation
3. Chạy LED (theater chase)
