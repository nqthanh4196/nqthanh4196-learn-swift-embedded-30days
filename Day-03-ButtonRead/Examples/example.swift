// ============================================
// Day 03 - Extra Examples
// Topic: Button Handling Patterns
// ============================================

// MARK: - Example 1: Long Press Detection
/// Phát hiện nhấn giữ (long press) vs nhấn nhanh (short press)
func longPressDetection() {
    let LONG_PRESS_MS: UInt32 = 1000  // 1 giây = long press
    
    print("⏱️ Long Press Detection:")
    print("   < 1s = Short Press")
    print("   ≥ 1s = Long Press")
    print("")
    
    /*
    var pressStartTime: UInt32 = 0
    var wasPressed = false
    
    while true {
        let pressed = !gpio_get(BUTTON_PIN)
        
        if pressed && !wasPressed {
            // Button vừa được nhấn
            pressStartTime = to_ms_since_boot(get_absolute_time())
        }
        
        if !pressed && wasPressed {
            // Button vừa được nhả
            let duration = to_ms_since_boot(get_absolute_time()) - pressStartTime
            if duration >= LONG_PRESS_MS {
                print("Long Press! (\(duration)ms)")
            } else {
                print("Short Press (\(duration)ms)")
            }
        }
        
        wasPressed = pressed
        sleep_ms(10)
    }
    */
    
    // Mô phỏng
    let durations: [UInt32] = [150, 80, 1200, 500, 2000]
    for d in durations {
        let type = d >= LONG_PRESS_MS ? "🔴 LONG" : "🟢 SHORT"
        print("   Press \(d)ms → \(type)")
    }
    print("")
}

// MARK: - Example 2: Double Click Detection
func doubleClickDetection() {
    let DOUBLE_CLICK_MS: UInt32 = 300
    
    print("👆 Double Click Detection:")
    print("   2 clicks trong 300ms = Double Click")
    print("")
    
    /*
    var lastClickTime: UInt32 = 0
    var clickCount = 0
    
    while true {
        let pressed = !gpio_get(BUTTON_PIN)
        
        if pressed && !wasPressed {
            let now = to_ms_since_boot(get_absolute_time())
            if now - lastClickTime < DOUBLE_CLICK_MS {
                print("Double Click!")
                clickCount = 0
            } else {
                clickCount = 1
            }
            lastClickTime = now
        }
        
        wasPressed = pressed
        sleep_ms(10)
    }
    */
    
    // Mô phỏng
    print("   Click at 0ms")
    print("   Click at 200ms → 👆👆 Double Click!")
    print("   Click at 1000ms")
    print("   Click at 1800ms → Single Click")
    print("")
}

// MARK: - Example 3: Multi-button State Machine
/// Điều khiển nhiều chế độ bằng 2 nút
func multiButtonControl() {
    print("🎮 Multi-Button Control:")
    print("   Button A (GP14): Chuyển mode")
    print("   Button B (GP15): Thực hiện action")
    print("")
    
    let modes = ["Blink Slow", "Blink Fast", "SOS", "Breathing"]
    var currentMode = 0
    
    // Mô phỏng các lần nhấn
    let actions = ["A", "B", "A", "A", "B"]
    for action in actions {
        if action == "A" {
            currentMode = (currentMode + 1) % modes.count
            print("   [A] → Mode: \(modes[currentMode])")
        } else {
            print("   [B] → Execute: \(modes[currentMode]) ▶️")
        }
    }
    print("")
}

// MARK: - Run Examples
print("🔌 === Day 03: Extra Examples ===\n")
longPressDetection()
doubleClickDetection()
multiButtonControl()
