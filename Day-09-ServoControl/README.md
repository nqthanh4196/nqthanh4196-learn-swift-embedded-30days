# Day 9 - PWM nâng cao: Servo Motor

## 📖 Giới thiệu

Servo motor (SG90) sử dụng PWM ở 50Hz để điều khiển góc quay (0° - 180°). Đây là ứng dụng PWM quan trọng trong robotics.

---

## 🎯 Kiến thức chính

### 1. Servo Motor hoạt động thế nào?

Servo nhận tín hiệu PWM 50Hz, thay đổi **pulse width** để điều khiển góc:

```
0°:    |█|___________________| pulse = 0.5ms / period = 20ms
90°:   |████|________________| pulse = 1.5ms / period = 20ms
180°:  |████████|____________| pulse = 2.5ms / period = 20ms
```

### 2. Sơ đồ nối mạch

```
Servo SG90:
├── Đỏ (VCC)   → 5V (VBUS trên Pico)
├── Nâu (GND)  → GND
└── Cam (Signal) → GP15 (PWM)
    
Potentiometer (optional):
├── VCC → 3.3V
├── GND → GND
└── Wiper → GP26 (ADC0)
```

> ⚠️ Servo cần 5V! Dùng VBUS pin, không dùng 3V3.

### 3. Cấu hình PWM cho Servo

```swift
// PWM 50Hz tại 125MHz system clock:
// divider = 100, wrap = 24999
// f = 125MHz / (100 * 25000) = 50Hz

let SERVO_PIN: UInt32 = 15
gpio_set_function(SERVO_PIN, GPIO_FUNC_PWM)
let slice = pwm_gpio_to_slice_num(SERVO_PIN)

pwm_set_clkdiv(slice, 100.0)
pwm_set_wrap(slice, 24999)
pwm_set_enabled(slice, true)
```

### 4. Chuyển đổi góc → PWM level

```swift
func angleToPWM(_ angle: Int) -> UInt16 {
    // 0° = 0.5ms pulse, 180° = 2.5ms pulse
    // period = 20ms, wrap = 24999
    let pulseMs = 0.5 + Float(angle) / 180.0 * 2.0
    let level = UInt16(pulseMs / 20.0 * 25000)
    return level
}
```

---

## 📝 Tóm tắt

- Servo dùng PWM 50Hz, thay đổi pulse width (0.5ms - 2.5ms)
- Góc tỷ lệ thuận với pulse width
- Cần nguồn 5V riêng cho servo
- Kết hợp ADC + PWM để điều khiển bằng potentiometer

---

## 🏋️ Challenge

1. Sweep servo 0° → 180° → 0° liên tục
2. Dùng potentiometer điều khiển góc servo
3. Dùng 2 button: +10° và -10°
