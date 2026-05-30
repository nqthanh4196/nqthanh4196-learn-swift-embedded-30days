# Day 25 - IR Remote Control

## 📖 Giới thiệu
Sử dụng IR receiver (VS1838B) để nhận tín hiệu từ remote TV/điều hòa. Decode NEC protocol.

## 🎯 NEC Protocol
- Carrier: 38kHz
- Leader: 9ms burst + 4.5ms space
- Bit 0: 562µs burst + 562µs space
- Bit 1: 562µs burst + 1687µs space
- 32 bits: Address(8) + ~Address(8) + Command(8) + ~Command(8)

## Sơ đồ
```
VS1838B → GP15 (with internal pull-up)
```

## 🏋️ Challenge
1. Decode NEC remote buttons
2. Map buttons to LED control
3. Volume button → PWM brightness
