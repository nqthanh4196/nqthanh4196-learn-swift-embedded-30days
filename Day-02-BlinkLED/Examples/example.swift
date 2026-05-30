// ============================================
// Day 02 - Extra Examples
// Topic: Blink LED Variations
// ============================================

// MARK: - Example 1: Breathing LED (dùng delay thay đổi)
/// Tạo hiệu ứng "thở" bằng cách thay đổi duty cycle thủ công
func breathingEffect(pin: UInt32) {
    print("🫁 Breathing Effect (pseudo-PWM):")
    
    // Fade in
    for i in stride(from: 0, to: 100, by: 10) {
        // let onTime = UInt32(i * 10)      // microseconds ON
        // let offTime = UInt32((100 - i) * 10)  // microseconds OFF
        // gpio_put(pin, true); sleep_us(onTime)
        // gpio_put(pin, false); sleep_us(offTime)
        let bar = String(repeating: "█", count: i / 10)
        let space = String(repeating: "░", count: 10 - i / 10)
        print("   [\(bar)\(space)] \(i)%")
    }
    
    // Fade out
    for i in stride(from: 100, through: 0, by: -10) {
        let bar = String(repeating: "█", count: i / 10)
        let space = String(repeating: "░", count: 10 - i / 10)
        print("   [\(bar)\(space)] \(i)%")
    }
    print("")
}

// MARK: - Example 2: Binary Counter với 4 LEDs
/// Đếm nhị phân từ 0-15 hiển thị trên 4 LED
func binaryCounter() {
    let pins: [UInt32] = [15, 14, 13, 12]  // GP15-GP12
    
    print("🔢 Binary Counter (4 LEDs):")
    print("   GP15 GP14 GP13 GP12 | Decimal")
    print("   ─────────────────────────────")
    
    for number in 0..<16 {
        let bit3 = (number >> 3) & 1
        let bit2 = (number >> 2) & 1
        let bit1 = (number >> 1) & 1
        let bit0 = number & 1
        
        // for (index, pin) in pins.enumerated() {
        //     let bitValue = (number >> (3 - index)) & 1
        //     gpio_put(pin, bitValue == 1)
        // }
        // sleep_ms(500)
        
        let led3 = bit3 == 1 ? "🟡" : "⬛"
        let led2 = bit2 == 1 ? "🟡" : "⬛"
        let led1 = bit1 == 1 ? "🟡" : "⬛"
        let led0 = bit0 == 1 ? "🟡" : "⬛"
        
        print("    \(led3)   \(led2)   \(led1)   \(led0)  |  \(number)")
    }
    print("")
}

// MARK: - Example 3: Knight Rider (LED chạy qua lại)
func knightRider() {
    let leds: [UInt32] = [12, 13, 14, 15, 16, 17]
    
    print("🚗 Knight Rider Effect:")
    
    // Forward
    for i in 0..<leds.count {
        var display = ""
        for j in 0..<leds.count {
            display += (i == j) ? "🔴 " : "⬛ "
        }
        print("   \(display)")
        // gpio_put(leds[i], true); sleep_ms(100)
        // gpio_put(leds[i], false)
    }
    
    // Backward
    for i in stride(from: leds.count - 2, through: 1, by: -1) {
        var display = ""
        for j in 0..<leds.count {
            display += (i == j) ? "🔴 " : "⬛ "
        }
        print("   \(display)")
    }
    print("")
}

// MARK: - Run examples
print("🔌 === Day 02: Extra Examples ===\n")
breathingEffect(pin: 25)
binaryCounter()
knightRider()
