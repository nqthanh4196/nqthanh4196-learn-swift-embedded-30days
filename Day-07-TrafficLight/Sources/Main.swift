// ============================================
// Day 07 - TrafficLight
// Topic: Multiple LEDs - Đèn giao thông
// ============================================

// MARK: - Pin Configuration
let RED_LED: UInt32 = 13
let YELLOW_LED: UInt32 = 14
let GREEN_LED: UInt32 = 15
let PEDESTRIAN_BUTTON: UInt32 = 16

// MARK: - Traffic Light State Machine
enum TrafficState: String {
    case red = "🔴 RED - STOP"
    case green = "🟢 GREEN - GO"
    case yellow = "🟡 YELLOW - CAUTION"
    case pedestrian = "🚶 PEDESTRIAN CROSSING"
    
    var duration: UInt32 {
        switch self {
        case .red: return 5000
        case .green: return 4000
        case .yellow: return 2000
        case .pedestrian: return 3000
        }
    }
    
    var leds: (red: Bool, yellow: Bool, green: Bool) {
        switch self {
        case .red: return (true, false, false)
        case .green: return (false, false, true)
        case .yellow: return (false, true, false)
        case .pedestrian: return (true, false, false)  // Red for cars
        }
    }
    
    var nextState: TrafficState {
        switch self {
        case .red: return .green
        case .green: return .yellow
        case .yellow: return .red
        case .pedestrian: return .red
        }
    }
}

// MARK: - LED Control
func setLEDs(red: Bool, yellow: Bool, green: Bool) {
    // gpio_put(RED_LED, red)
    // gpio_put(YELLOW_LED, yellow)
    // gpio_put(GREEN_LED, green)
    
    let r = red ? "🔴" : "⬛"
    let y = yellow ? "🟡" : "⬛"
    let g = green ? "🟢" : "⬛"
    print("   LEDs: \(r) \(y) \(g)")
}

// MARK: - Main Sequence
func runTrafficLight() {
    print("📌 Traffic Light Sequence:")
    print("")
    
    let sequence: [TrafficState] = [.red, .green, .yellow, .red, .green, .yellow]
    
    for state in sequence {
        print("   [\(state.rawValue)] - Duration: \(state.duration)ms")
        let leds = state.leds
        setLEDs(red: leds.red, yellow: leds.yellow, green: leds.green)
        // sleep_ms(state.duration)
        print("")
    }
}

// MARK: - Pedestrian Crossing
func pedestrianCrossing() {
    print("📌 Pedestrian Crossing (Button interrupt):")
    print("")
    
    print("   1. 🚶 Button pressed!")
    print("   2. Wait for current green to finish...")
    print("   3. 🟡 Yellow (2s) - cars slow down")
    setLEDs(red: false, yellow: true, green: false)
    print("   4. 🔴 Red for cars + 🟢 Walk signal (3s)")
    setLEDs(red: true, yellow: false, green: false)
    print("   5. 🔴 Blinking (warning: time running out)")
    for _ in 1...4 {
        print("   ... 🔴 blink ...")
    }
    print("   6. Return to normal cycle")
    print("")
}

// MARK: - Yellow Blinking Mode (Night mode)
func nightMode() {
    print("📌 Night Mode (Blinking Yellow):")
    print("")
    
    for i in 1...6 {
        let on = i % 2 == 1
        let icon = on ? "🟡" : "⬛"
        print("   [\(i)] \(icon) (500ms)")
        // gpio_put(YELLOW_LED, on)
        // sleep_ms(500)
    }
    print("")
}

// MARK: - Main Program
print("🔌 === Day 07: Traffic Light ===")
print("📌 Red LED: GP\(RED_LED)")
print("📌 Yellow LED: GP\(YELLOW_LED)")
print("📌 Green LED: GP\(GREEN_LED)")
print("📌 Button: GP\(PEDESTRIAN_BUTTON)")
print("")

runTrafficLight()
pedestrianCrossing()
nightMode()

print("✅ Day 07 complete!")
print("📝 Next: Day 08 - ADC (Analog Read)")
