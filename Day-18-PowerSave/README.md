# Day 18 - Watchdog Timer & Power Management

## 📖 Introduction

The watchdog timer automatically resets the MCU if the software hangs. Power management helps save energy for battery-powered applications.

---

## 🎯 Key Concepts

### 1. Watchdog Timer
- Resets MCU if not "fed" within the specified time
- Protects against software hangs/deadlocks
- RP2040: max 8.3 seconds timeout

### 2. Sleep Modes on RP2040
| Mode | Power | Wake source |
|------|-------|-------------|
| Normal | ~25mA | - |
| Sleep | ~2mA | Timer, GPIO, UART |
| Dormant | ~0.18mA | GPIO edge, RTC |

### 3. Watchdog Code
```swift
watchdog_enable(2000, true)  // 2s timeout, pause on debug
while true {
    doWork()
    watchdog_update()  // Feed the watchdog
}
```

---

## 🏋️ Challenge
1. Implement watchdog, verify reset when not fed
2. Sleep mode with wake-up from button
3. Measure power consumption in each mode

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 18 - Watchdog Timer & Power Management

## 📖 Giới thiệu
Watchdog timer tự reset MCU nếu phần mềm bị treo. Power management giúp tiết kiệm năng lượng cho ứng dụng battery.

---

## 🎯 Kiến thức chính

### 1. Watchdog Timer
- Reset MCU nếu không được "fed" trong thời gian quy định
- Bảo vệ khỏi phần mềm bị treo/deadlock
- RP2040: max 8.3 seconds timeout

### 2. Sleep Modes trên RP2040
| Mode | Power | Wake source |
|------|-------|-------------|
| Normal | ~25mA | - |
| Sleep | ~2mA | Timer, GPIO, UART |
| Dormant | ~0.18mA | GPIO edge, RTC |

### 3. Code Watchdog
```swift
watchdog_enable(2000, true)  // 2s timeout, pause on debug
while true {
    doWork()
    watchdog_update()  // Feed the watchdog
}
```

---

## 🏋️ Challenge
1. Implement watchdog, verify reset khi không feed
2. Sleep mode với wake-up từ button
3. Đo power consumption ở các mode
