# Day 2 - GPIO Output: Blink LED

## 📖 Giới thiệu

Hôm nay chúng ta sẽ học cách điều khiển GPIO Output để bật/tắt LED — bài học kinh điển nhất trong embedded programming. Đây là "Hello World" của thế giới vi điều khiển.

---

## 🎯 Kiến thức chính

### 1. GPIO là gì?

**GPIO** (General Purpose Input/Output) là các chân đa năng trên vi điều khiển có thể được cấu hình làm:
- **Output**: Xuất tín hiệu HIGH (3.3V) hoặc LOW (0V)
- **Input**: Đọc tín hiệu từ bên ngoài

### 2. Sơ đồ nối mạch

```
Pico GP15 ──── [220Ω] ──── LED(+) ──── LED(-) ──── GND
```

> ⚠️ **Quan trọng**: Luôn dùng điện trở hạn dòng (220Ω) để bảo vệ LED!

### 3. Các bước điều khiển GPIO Output

```swift
// Bước 1: Khởi tạo pin
gpio_init(15)

// Bước 2: Set direction = OUTPUT
gpio_set_dir(15, GPIO_OUT)

// Bước 3: Xuất tín hiệu
gpio_put(15, true)   // HIGH - LED sáng
gpio_put(15, false)  // LOW - LED tắt
```

### 4. Hàm sleep

```swift
sleep_ms(1000)  // Delay 1000ms = 1 giây
sleep_us(500)   // Delay 500 microseconds
```

### 5. Onboard LED

Raspberry Pi Pico có LED onboard ở **GP25** (Pico) hoặc qua WiFi chip (Pico W):

```swift
// Pico: GP25
let LED_BUILTIN: UInt32 = 25

// Pico W: Dùng cyw43_arch
// cyw43_arch_gpio_put(CYW43_WL_GPIO_LED_PIN, true)
```

---

## 📝 Tóm tắt

- GPIO Output xuất tín hiệu HIGH (3.3V) hoặc LOW (0V)
- Dùng `gpio_init()`, `gpio_set_dir()`, `gpio_put()`
- Luôn dùng điện trở hạn dòng với LED
- `sleep_ms()` để tạo delay

---

## 🏋️ Challenge

1. Thay đổi tốc độ nhấp nháy (200ms, 500ms, 2000ms)
2. Tạo pattern SOS bằng mã Morse (··· ─── ···)
3. Sử dụng LED ngoài (GP15) thay vì onboard LED
