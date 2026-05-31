# Day 5 - Timer & Interrupts

## 📖 Giới thiệu

Thay vì dùng `sleep_ms()` để delay (blocking), hôm nay chúng ta học cách sử dụng Timer hardware và Interrupts — cách tiếp cận non-blocking chuyên nghiệp hơn trong embedded systems.

---

## 🎯 Kiến thức chính

### 1. Tại sao cần Timer?

`sleep_ms()` là **blocking** — CPU không làm gì trong lúc chờ:
```swift
// ❌ Blocking approach
while true {
    gpio_put(LED_PIN, true)
    sleep_ms(500)     // CPU idle 500ms!
    gpio_put(LED_PIN, false)
    sleep_ms(500)     // CPU idle 500ms!
}
```

Timer + Interrupt là **non-blocking** — CPU có thể làm việc khác:
```swift
// ✅ Non-blocking approach
// Timer tự động gọi callback mỗi 500ms
```

### 2. Timer trên RP2040

RP2040 có một **64-bit system timer** chạy ở 1MHz:
- Đếm microseconds từ lúc boot
- Hỗ trợ 4 alarm (timer callback)
- Hỗ trợ repeating timer

### 3. Repeating Timer

```swift
var timer = repeating_timer_t()

/// Callback function - gọi mỗi 500ms
func timerCallback(rt: UnsafeMutablePointer<repeating_timer_t>?) -> Bool {
    // Toggle LED
    ledState.toggle()
    gpio_put(LED_PIN, ledState)
    return true  // true = tiếp tục repeat
}

// Khởi tạo timer: gọi mỗi 500ms (âm = delay sau khi callback xong)
add_repeating_timer_ms(-500, timerCallback, nil, &timer)
```

### 4. GPIO Interrupt

```swift
/// Callback khi button được nhấn
func buttonCallback(gpio: UInt32, events: UInt32) {
    if events & GPIO_IRQ_EDGE_FALL != 0 {
        // Button pressed (falling edge với pull-up)
        ledState.toggle()
        gpio_put(LED_PIN, ledState)
    }
}

// Enable interrupt cho button pin
gpio_set_irq_enabled_with_callback(
    BUTTON_PIN,
    GPIO_IRQ_EDGE_FALL,
    true,
    buttonCallback
)
```

### 5. Alarm (One-shot timer)

```swift
/// Gọi 1 lần sau 2 giây
func alarmCallback(id: alarm_id_t, userData: UnsafeMutableRawPointer?) -> Int64 {
    gpio_put(LED_PIN, false)
    return 0  // 0 = không repeat
}

// Set alarm: gọi sau 2,000,000 microseconds (2s)
add_alarm_in_ms(2000, alarmCallback, nil, false)
```

---

## 📝 Tóm tắt

- `sleep_ms()` là blocking, Timer/Interrupt là non-blocking
- RP2040 có 64-bit system timer @ 1MHz
- Repeating timer: gọi callback theo chu kỳ
- GPIO interrupt: gọi callback khi có sự kiện trên pin
- Alarm: gọi callback 1 lần sau delay

---

## 🏋️ Challenge

1. Blink LED bằng repeating timer (không dùng sleep)
2. Toggle LED bằng button interrupt
3. Kết hợp: button thay đổi tốc độ blink của timer
