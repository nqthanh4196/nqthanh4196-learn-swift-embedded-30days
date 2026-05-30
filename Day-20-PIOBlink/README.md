# Day 20 - PIO: Programmable I/O

## 📖 Giới thiệu
PIO là tính năng độc đáo của RP2040 — "state machine" lập trình được chạy I/O operations độc lập với CPU. Có thể implement bất kỳ protocol nào!

---

## 🎯 Kiến thức chính

### 1. PIO Overview
- 2 PIO blocks, mỗi block có 4 state machines
- Tổng: 8 PIO state machines
- Instruction set riêng (9 instructions)
- Chạy ở system clock speed (133MHz)
- Hoàn toàn độc lập với CPU

### 2. PIO Instructions
```
SET   - Set pin/direction
MOV   - Move data
IN    - Shift data in
OUT   - Shift data out
PUSH  - Push to RX FIFO
PULL  - Pull from TX FIFO
JMP   - Jump conditional
WAIT  - Wait for condition
IRQ   - Set/clear interrupt
```

### 3. Ứng dụng thực tế
- WS2812B NeoPixel protocol
- VGA video output
- Quadrature encoder
- Custom serial protocols
- High-speed parallel I/O

---

## 🏋️ Challenge
1. PIO blink LED (không cần CPU)
2. PIO tạo tín hiệu PWM
3. PIO đọc button với debounce
