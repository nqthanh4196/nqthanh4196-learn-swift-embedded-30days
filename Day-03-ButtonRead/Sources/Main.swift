// ============================================
// Day 03 - ButtonRead
// Topic: GPIO Input - Đọc nút nhấn
// ============================================

// MARK: - Pin Configuration
let LED_PIN: UInt32 = 25      // Onboard LED
let BUTTON_PIN: UInt32 = 14   // Button on GP14

// MARK: - Setup
// stdio_init_all()
// gpio_init(LED_PIN)
// gpio_set_dir(LED_PIN, GPIO_OUT)
// gpio_init(BUTTON_PIN)
// gpio_set_dir(BUTTON_PIN, GPIO_IN)
// gpio_pull_up(BUTTON_PIN)  // Internal pull-up

// MARK: - Mô phỏng đọc button

/// Trạng thái LED
var ledState = false
var pressCount = 0
var lastButtonState = false

/// Đọc trạng thái button (mô phỏng)
func readButton() -> Bool {
    // Trong thực tế: return !gpio_get(BUTTON_PIN)
    // Pull-up nên: LOW = pressed, HIGH = released
    return false
}

/// Mode 1: Hold to light - Giữ nút = LED sáng
func holdToLight() {
    print("📌 Mode 1: Hold to Light")
    print("   Giữ button → LED ON")
    print("   Nhả button → LED OFF")
    
    // while true {
    //     let pressed = !gpio_get(BUTTON_PIN)
    //     gpio_put(LED_PIN, pressed)
    //     sleep_ms(10)
    // }
    
    // Mô phỏng
    let states = [false, true, true, true, false, false]
    for (i, pressed) in states.enumerated() {
        let led = pressed ? "🟡 ON" : "⬛ OFF"
        let btn = pressed ? "🔘 PRESSED" : "⭕ RELEASED"
        print("   [\(i)] Button: \(btn) → LED: \(led)")
    }
    print("")
}

/// Mode 2: Toggle - Nhấn một lần bật, nhấn lần nữa tắt
func toggleMode() {
    print("📌 Mode 2: Toggle LED")
    print("   Mỗi lần nhấn → đổi trạng thái LED")
    
    // while true {
    //     let currentState = !gpio_get(BUTTON_PIN)
    //     if currentState && !lastButtonState {  // Rising edge
    //         ledState.toggle()
    //         gpio_put(LED_PIN, ledState)
    //     }
    //     lastButtonState = currentState
    //     sleep_ms(10)
    // }
    
    // Mô phỏng
    var simLed = false
    let presses = ["press", "release", "press", "release", "press", "release"]
    for action in presses {
        if action == "press" {
            simLed.toggle()
            let led = simLed ? "🟡 ON" : "⬛ OFF"
            print("   🔘 Button pressed → LED: \(led)")
        }
    }
    print("")
}

/// Mode 3: Counter - Đếm số lần nhấn
func counterMode() {
    print("📌 Mode 3: Press Counter")
    
    // while true {
    //     let currentState = !gpio_get(BUTTON_PIN)
    //     if currentState && !lastButtonState {
    //         pressCount += 1
    //         print("Count: \(pressCount)")
    //     }
    //     lastButtonState = currentState
    //     sleep_ms(10)
    // }
    
    // Mô phỏng
    for i in 1...5 {
        print("   🔘 Press #\(i) detected → Total: \(i)")
    }
    print("")
}

// MARK: - Main Program
print("🔌 === Day 03: Button Read ===")
print("📌 LED: GP\(LED_PIN)")
print("📌 Button: GP\(BUTTON_PIN) (Pull-up)")
print("")

holdToLight()
toggleMode()
counterMode()

print("✅ Day 03 complete!")
print("📝 Next: Day 04 - PWM (LED Dimmer)")
