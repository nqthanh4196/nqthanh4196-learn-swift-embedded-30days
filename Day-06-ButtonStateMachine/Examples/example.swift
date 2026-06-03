// ============================================
// Day 06 - Extra Examples
// Topic: Advanced State Machines
// ============================================

// MARK: - Example 1: Vending Machine State Machine
enum VendingState: String {
    case idle = "IDLE - Chờ tiền"
    case coinInserted = "COIN - Đã có tiền"
    case dispensing = "DISPENSE - Đang ra hàng"
    case error = "ERROR - Lỗi"
}

func vendingMachineDemo() {
    print("🎰 Vending Machine State Machine:")
    print("")
    
    var state: VendingState = .idle
    let events = ["insert_coin", "select_item", "item_dispensed", 
                  "insert_coin", "select_item", "jam_detected", "reset"]
    
    for event in events {
        let prev = state
        switch (state, event) {
        case (.idle, "insert_coin"):
            state = .coinInserted
        case (.coinInserted, "select_item"):
            state = .dispensing
        case (.dispensing, "item_dispensed"):
            state = .idle
        case (.dispensing, "jam_detected"):
            state = .error
        case (.error, "reset"):
            state = .idle
        default:
            break
        }
        print("   [\(event)] \(prev.rawValue) → \(state.rawValue)")
    }
    print("")
}

// MARK: - Example 2: Hysteresis (chống dao động)
func hysteresisDemo() {
    print("📊 Hysteresis (Anti-oscillation):")
    print("   Turn ON khi ADC > 3000")
    print("   Turn OFF khi ADC < 2500")
    print("   (Dead band: 2500-3000)")
    print("")
    
    let thresholdHigh: UInt16 = 3000
    let thresholdLow: UInt16 = 2500
    var outputOn = false
    
    let readings: [UInt16] = [2000, 2400, 2600, 2900, 3100, 3000, 2800, 2600, 2400, 2200, 2600, 3200]
    
    print("   ADC  | Output | Note")
    print("   -----|--------|------")
    for reading in readings {
        let prevState = outputOn
        if reading > thresholdHigh {
            outputOn = true
        } else if reading < thresholdLow {
            outputOn = false
        }
        // Else: giữ nguyên (hysteresis zone)
        
        let stateIcon = outputOn ? "🟢 ON " : "🔴 OFF"
        let changed = prevState != outputOn ? " ← Changed!" : ""
        print("   \(reading)  | \(stateIcon) | \(changed)")
    }
    print("")
}

// MARK: - Example 3: Enum-based command system
enum Command {
    case nop
    case toggleLED
    case setBrightness(UInt8)
    case setMode(String)
    case reset
}

func commandSystemDemo() {
    print("🎮 Enum-based Command System:")
    print("")
    
    let commands: [Command] = [
        .toggleLED,
        .setBrightness(128),
        .setMode("breathing"),
        .setBrightness(255),
        .reset
    ]
    
    for (i, cmd) in commands.enumerated() {
        switch cmd {
        case .nop:
            print("   [\(i)] NOP - do nothing")
        case .toggleLED:
            print("   [\(i)] TOGGLE LED 💡")
        case .setBrightness(let level):
            let pct = Int(Float(level) / 255.0 * 100)
            print("   [\(i)] SET BRIGHTNESS: \(level)/255 (\(pct)%)")
        case .setMode(let mode):
            print("   [\(i)] SET MODE: \(mode)")
        case .reset:
            print("   [\(i)] RESET - back to defaults")
        }
    }
    print("")
}

// MARK: - Run Examples
print("🔌 === Day 06: Extra Examples ===\n")
vendingMachineDemo()
hysteresisDemo()
commandSystemDemo()
