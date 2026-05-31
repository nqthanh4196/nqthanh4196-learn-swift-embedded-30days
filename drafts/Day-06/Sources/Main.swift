// ============================================
// Day 06 - ButtonStateMachine
// Topic: Debounce & State Machine
// ============================================

// MARK: - Pin Configuration
let LED_PIN: UInt32 = 25
let BUTTON_PIN: UInt32 = 14
let DEBOUNCE_MS: UInt32 = 50

// MARK: - State Machine
enum LEDMode: String {
    case off = "OFF"
    case blinkSlow = "BLINK SLOW (1000ms)"
    case blinkFast = "BLINK FAST (200ms)"
    case solid = "SOLID ON"
    
    var nextMode: LEDMode {
        switch self {
        case .off: return .blinkSlow
        case .blinkSlow: return .blinkFast
        case .blinkFast: return .solid
        case .solid: return .off
        }
    }
    
    var blinkInterval: UInt32 {
        switch self {
        case .off: return 0
        case .blinkSlow: return 1000
        case .blinkFast: return 200
        case .solid: return 0
        }
    }
}

var currentMode: LEDMode = .off

// MARK: - Debounce Logic
struct Debouncer {
    var lastDebounceTime: UInt32 = 0
    var lastStableState: Bool = false
    var lastReading: Bool = false
    let debounceDelay: UInt32
    
    init(delay: UInt32 = 50) {
        self.debounceDelay = delay
    }
    
    /// Returns true if a valid state change detected
    mutating func update(rawReading: Bool, currentTime: UInt32) -> Bool {
        if rawReading != lastReading {
            lastDebounceTime = currentTime
            lastReading = rawReading
        }
        
        if currentTime - lastDebounceTime > debounceDelay {
            if lastReading != lastStableState {
                lastStableState = lastReading
                return true
            }
        }
        return false
    }
}

// MARK: - Demo Debounce
func demoDebounce() {
    print("📌 Demo: Software Debounce")
    print("   Debounce time: \(DEBOUNCE_MS)ms")
    print("")
    
    // Mô phỏng raw signal với bounce
    let rawSignal: [(UInt32, Bool, String)] = [
        (0, false, "Stable HIGH (released)"),
        (100, true, "First contact (press start)"),
        (102, false, "Bounce!"),
        (104, true, "Bounce!"),
        (106, false, "Bounce!"),
        (110, true, "Settling..."),
        (112, false, "Bounce!"),
        (115, true, "Settling..."),
        (150, true, "STABLE LOW (pressed) ✅"),
        (500, false, "Released - Bounce start"),
        (502, true, "Bounce!"),
        (505, false, "Settling..."),
        (550, false, "STABLE HIGH (released) ✅"),
    ]
    
    print("   Time  | Raw | Status")
    print("   ------|-----|-------")
    for (time, pressed, status) in rawSignal {
        let rawIcon = pressed ? "LOW " : "HIGH"
        let bounceIcon = status.contains("Bounce") ? "⚡" : 
                        status.contains("STABLE") ? "✅" : "  "
        print("   \(String(format: "%3d", time))ms | \(rawIcon) | \(bounceIcon) \(status)")
    }
    print("")
    print("   Kết quả sau debounce: 1 press + 1 release (clean!)")
    print("")
}

// MARK: - Demo State Machine
func demoStateMachine() {
    print("📌 Demo: LED State Machine")
    print("")
    
    var mode: LEDMode = .off
    
    // Mô phỏng 5 lần nhấn button
    for i in 1...5 {
        let previousMode = mode
        mode = mode.nextMode
        print("   Press #\(i): \(previousMode.rawValue) → \(mode.rawValue)")
        
        switch mode {
        case .off:
            print("           💡 LED: ⬛")
        case .blinkSlow:
            print("           💡 LED: 🟡⬛🟡⬛ (slow)")
        case .blinkFast:
            print("           💡 LED: 🟡⬛🟡⬛🟡⬛ (fast!)")
        case .solid:
            print("           💡 LED: 🟡🟡🟡🟡 (always on)")
        }
    }
    print("")
}

// MARK: - Demo Timing Diagram
func demoTimingDiagram() {
    print("📌 Demo: Non-blocking Blink with State Machine")
    print("")
    print("   Pseudo-code:")
    print("   ┌─────────────────────────────────────────────┐")
    print("   │ while true {                                 │")
    print("   │     // Check button (debounced)              │")
    print("   │     if debouncer.update(reading, now) {      │")
    print("   │         currentMode = currentMode.nextMode   │")
    print("   │     }                                        │")
    print("   │                                              │")
    print("   │     // Handle LED based on mode              │")
    print("   │     switch currentMode {                     │")
    print("   │     case .off:                               │")
    print("   │         gpio_put(LED_PIN, false)             │")
    print("   │     case .solid:                             │")
    print("   │         gpio_put(LED_PIN, true)              │")
    print("   │     case .blinkSlow, .blinkFast:             │")
    print("   │         if now - lastBlink > interval {      │")
    print("   │             ledState.toggle()                │")
    print("   │             gpio_put(LED_PIN, ledState)      │")
    print("   │             lastBlink = now                  │")
    print("   │         }                                    │")
    print("   │     }                                        │")
    print("   │     sleep_ms(1)                              │")
    print("   │ }                                            │")
    print("   └─────────────────────────────────────────────┘")
    print("")
}

// MARK: - Main Program
print("🔌 === Day 06: Debounce & State Machine ===")
print("📌 LED: GP\(LED_PIN)")
print("📌 Button: GP\(BUTTON_PIN)")
print("📌 Debounce: \(DEBOUNCE_MS)ms")
print("")

demoDebounce()
demoStateMachine()
demoTimingDiagram()

print("✅ Day 06 complete!")
print("📝 Next: Day 07 - Traffic Light")
