# Day 7 - Multiple LEDs: Traffic Light

## 📖 Giới thiệu

Hôm nay chúng ta kết hợp kiến thức từ các ngày trước (GPIO, Timer, State Machine) để xây dựng hệ thống đèn giao thông hoàn chỉnh với 3 LED đỏ-vàng-xanh.

---

## 🎯 Kiến thức chính

### 1. Sơ đồ nối mạch

```
GP13 ──── [220Ω] ──── 🔴 LED Đỏ ──── GND
GP14 ──── [220Ω] ──── 🟡 LED Vàng ──── GND
GP15 ──── [220Ω] ──── 🟢 LED Xanh ──── GND
GP16 ──── [Button] ──── GND (Pedestrian crossing)
```

### 2. Traffic Light Sequence

```
🔴 RED     → Dừng (5 giây)
🟢 GREEN   → Đi (4 giây)
🟡 YELLOW  → Chuẩn bị dừng (2 giây)
(repeat)
```

### 3. State Machine cho Traffic Light

```swift
enum TrafficState {
    case red          // 5000ms
    case green        // 4000ms
    case yellow       // 2000ms
    case pedestrian   // 3000ms (button triggered)
}
```

### 4. Quản lý nhiều GPIO Output

```swift
struct TrafficLED {
    static let red: UInt32 = 13
    static let yellow: UInt32 = 14
    static let green: UInt32 = 15
    
    static func setAll(r: Bool, y: Bool, g: Bool) {
        gpio_put(red, r)
        gpio_put(yellow, y)
        gpio_put(green, g)
    }
}
```

---

## 📝 Tóm tắt

- Quản lý nhiều GPIO output cùng lúc
- State machine cho chuỗi hoạt động tuần tự
- Kết hợp timer + button interrupt
- Real-world project: đèn giao thông

---

## 🏋️ Challenge

1. Implement đèn giao thông cơ bản (đỏ → xanh → vàng)
2. Thêm nút cho người đi bộ (pedestrian crossing)
3. Thêm countdown LED hoặc buzzer cảnh báo
