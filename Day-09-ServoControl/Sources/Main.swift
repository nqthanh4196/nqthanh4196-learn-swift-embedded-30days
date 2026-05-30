// ============================================
// Day 09 - ServoControl
// Topic: PWM nâng cao - Servo Motor (SG90)
// ============================================

// MARK: - Servo Configuration
let SERVO_PIN: UInt32 = 15
let POT_PIN: UInt32 = 26       // ADC0 - Potentiometer

/// Servo SG90 specifications:
/// - PWM frequency: 50Hz (period = 20ms)
/// - Pulse width: 0.5ms (0°) to 2.5ms (180°)
let SERVO_FREQ_HZ: UInt32 = 50
let SERVO_MIN_US: UInt16 = 500    // 0.5ms = 0 degrees
let SERVO_MAX_US: UInt16 = 2500   // 2.5ms = 180 degrees
let SERVO_PERIOD_US: UInt32 = 20000  // 20ms period

// PWM wrap value for 50Hz at 125MHz
// wrap = 125MHz / (divider * 50Hz) - 1
let PWM_WRAP: UInt16 = 24999      // divider = 100
let PWM_DIVIDER: Float = 100.0

// MARK: - Servo Helper Functions

/// Convert angle (0-180) to PWM level
func angleToPWMLevel(_ angle: Int) -> UInt16 {
    let pulseUs = SERVO_MIN_US + UInt16(Float(angle) / 180.0 * Float(SERVO_MAX_US - SERVO_MIN_US))
    let level = UInt16(Float(pulseUs) / Float(SERVO_PERIOD_US) * Float(PWM_WRAP))
    return level
}

/// Set servo angle
func setServoAngle(_ angle: Int) {
    let clampedAngle = max(0, min(180, angle))
    let level = angleToPWMLevel(clampedAngle)
    let pulseUs = SERVO_MIN_US + UInt16(Float(clampedAngle) / 180.0 * Float(SERVO_MAX_US - SERVO_MIN_US))
    
    // pwm_set_chan_level(slice, channel, UInt32(level))
    
    let position = Int(Float(clampedAngle) / 180.0 * 20)
    let bar = String(repeating: "═", count: position) + "◆" + String(repeating: "═", count: 20 - position)
    print("   [\(bar)] \(String(format: "%3d", clampedAngle))° (pulse: \(pulseUs)µs, level: \(level))")
}

// MARK: - Demo 1: Basic angles
func demoBasicAngles() {
    print("📌 Demo 1: Preset Angles")
    print("")
    
    let angles = [0, 30, 45, 60, 90, 120, 135, 150, 180]
    for angle in angles {
        setServoAngle(angle)
        // sleep_ms(500)
    }
    print("")
}

// MARK: - Demo 2: Sweep (quét qua lại)
func demoSweep() {
    print("📌 Demo 2: Sweep 0° → 180° → 0°")
    print("")
    
    // Forward sweep
    print("   → Forward:")
    for angle in stride(from: 0, through: 180, by: 45) {
        setServoAngle(angle)
        // sleep_ms(20)
    }
    
    // Backward sweep
    print("   ← Backward:")
    for angle in stride(from: 180, through: 0, by: -45) {
        setServoAngle(angle)
        // sleep_ms(20)
    }
    print("")
}

// MARK: - Demo 3: Potentiometer control
func demoPotControl() {
    print("📌 Demo 3: Potentiometer → Servo")
    print("   GP26 (ADC) → map to 0-180°")
    print("")
    
    let potValues: [UInt16] = [0, 500, 1000, 2048, 3000, 4095]
    
    for potValue in potValues {
        let angle = Int(Float(potValue) / 4095.0 * 180.0)
        let voltage = Float(potValue) * 3.3 / 4095.0
        print("   Pot=\(String(format: "%4d", potValue)) (\(String(format: "%.2f", voltage))V) → ", terminator: "")
        setServoAngle(angle)
    }
    print("")
}

// MARK: - Main Program
print("🔌 === Day 09: Servo Control ===")
print("📌 Servo Pin: GP\(SERVO_PIN)")
print("📌 Pot Pin: GP\(POT_PIN)")
print("📌 Frequency: \(SERVO_FREQ_HZ)Hz (period: \(SERVO_PERIOD_US)µs)")
print("📌 Range: \(SERVO_MIN_US)µs - \(SERVO_MAX_US)µs (0° - 180°)")
print("")

demoBasicAngles()
demoSweep()
demoPotControl()

print("✅ Day 09 complete!")
print("📝 Next: Day 10 - Buzzer (Melody)")
