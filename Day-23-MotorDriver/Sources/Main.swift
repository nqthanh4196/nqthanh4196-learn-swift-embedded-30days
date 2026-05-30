// ============================================
// Day 23 - MotorDriver
// Topic: DC Motor & H-Bridge (L298N)
// ============================================

let IN1: UInt32 = 14
let IN2: UInt32 = 15
let ENA: UInt32 = 13  // PWM speed control

print("🔌 === Day 23: DC Motor (L298N) ===")
print("📌 IN1=GP\(IN1), IN2=GP\(IN2), ENA=GP\(ENA)(PWM)")
print("")

enum MotorDirection: String {
    case forward = "⬆️ FORWARD"
    case reverse = "⬇️ REVERSE"
    case brake = "⏹️ BRAKE"
    case coast = "💨 COAST"
}

func setMotor(direction: MotorDirection, speed: Int) {
    let speedPct = min(100, max(0, speed))
    print("   Motor: \(direction.rawValue) @ \(speedPct)%")
    
    switch direction {
    case .forward:
        // gpio_put(IN1, true); gpio_put(IN2, false)
        break
    case .reverse:
        // gpio_put(IN1, false); gpio_put(IN2, true)
        break
    case .brake:
        // gpio_put(IN1, true); gpio_put(IN2, true)
        break
    case .coast:
        // gpio_put(IN1, false); gpio_put(IN2, false)
        break
    }
    // pwm_set_chan_level(slice, channel, speed * 655)
}

// Demo
print("📌 Demo: Motor Control Sequence")
print("")
setMotor(direction: .forward, speed: 50)
setMotor(direction: .forward, speed: 100)
setMotor(direction: .brake, speed: 0)
setMotor(direction: .reverse, speed: 75)
setMotor(direction: .coast, speed: 0)
print("")

print("📌 L298N Truth Table:")
print("   IN1 | IN2 | ENA | Action")
print("   ----|-----|-----|--------")
print("    H  |  L  |  H  | Forward")
print("    L  |  H  |  H  | Reverse")
print("    H  |  H  |  H  | Brake (short)")
print("    L  |  L  |  H  | Coast (free)")
print("    X  |  X  |  L  | Disabled")
print("")

print("✅ Day 23 complete!")
