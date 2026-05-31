// ============================================
// Day 02 - BlinkLED
// Topic: GPIO Output - Blink LED
// ============================================

// MARK: - Hardware Configuration
let LED_PIN: UInt32 = 25       // Onboard LED (Pico)
let EXTERNAL_LED: UInt32 = 15  // External LED on GP15

// MARK: - 1. Khởi tạo hệ thống
// stdio_init_all()

// MARK: - 2. Cấu hình GPIO Output
// gpio_init(LED_PIN)
// gpio_set_dir(LED_PIN, GPIO_OUT)

// gpio_init(EXTERNAL_LED)
// gpio_set_dir(EXTERNAL_LED, GPIO_OUT)

// MARK: - 3. Blink cơ bản
func blinkBasic(pin: UInt32, delayMs: UInt32, count: Int) {
    print("💡 Blinking GP\(pin) - \(delayMs)ms interval, \(count) times")
    for i in 1...count {
        // gpio_put(pin, true)
        // sleep_ms(delayMs)
        print("   [\(i)] LED ON  ⬛ → 🟡")
        
        // gpio_put(pin, false)
        // sleep_ms(delayMs)
        print("   [\(i)] LED OFF 🟡 → ⬛")
    }
    print("")
}

// MARK: - 4. Blink SOS (Morse Code)
/// SOS: ··· ─── ···
/// Dot = 200ms, Dash = 600ms, Gap = 200ms
func blinkSOS(pin: UInt32) {
    let dotMs: UInt32 = 200
    let dashMs: UInt32 = 600
    let gapMs: UInt32 = 200
    let letterGap: UInt32 = 600
    
    print("🆘 SOS Pattern (··· ─── ···):")
    
    // S: ···
    print("   S: ", terminator: "")
    for _ in 0..<3 {
        // gpio_put(pin, true)
        // sleep_ms(dotMs)
        // gpio_put(pin, false)
        // sleep_ms(gapMs)
        print("· ", terminator: "")
    }
    // sleep_ms(letterGap)
    print("")
    
    // O: ───
    print("   O: ", terminator: "")
    for _ in 0..<3 {
        // gpio_put(pin, true)
        // sleep_ms(dashMs)
        // gpio_put(pin, false)
        // sleep_ms(gapMs)
        print("─ ", terminator: "")
    }
    // sleep_ms(letterGap)
    print("")
    
    // S: ···
    print("   S: ", terminator: "")
    for _ in 0..<3 {
        // gpio_put(pin, true)
        // sleep_ms(dotMs)
        // gpio_put(pin, false)
        // sleep_ms(gapMs)
        print("· ", terminator: "")
    }
    print("\n")
}

// MARK: - 5. Heartbeat pattern
func heartbeat(pin: UInt32) {
    print("❤️ Heartbeat Pattern:")
    // Beat 1 - short
    // gpio_put(pin, true); sleep_ms(100)
    // gpio_put(pin, false); sleep_ms(100)
    print("   💓 beat")
    
    // Beat 2 - short
    // gpio_put(pin, true); sleep_ms(100)
    // gpio_put(pin, false); sleep_ms(700)
    print("   💓 beat")
    print("   ... pause ...")
    print("")
}

// MARK: - Main Program
print("🔌 === Day 02: Blink LED ===")
print("📌 Onboard LED: GP\(LED_PIN)")
print("📌 External LED: GP\(EXTERNAL_LED)")
print("")

blinkBasic(pin: LED_PIN, delayMs: 500, count: 3)
blinkSOS(pin: LED_PIN)
heartbeat(pin: LED_PIN)

print("✅ Day 02 complete!")
print("📝 Next: Day 03 - GPIO Input (Button)")
