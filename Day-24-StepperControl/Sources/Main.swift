// ============================================
// Day 24 - StepperControl
// Topic: Stepper Motor (28BYJ-48 + ULN2003)
// ============================================

let STEPPER_PINS: [UInt32] = [10, 11, 12, 13]
let STEPS_PER_REV: Int = 2048

print("🔌 === Day 24: Stepper Motor ===")
print("📌 Pins: GP10, GP11, GP12, GP13")
print("📌 Steps/revolution: \(STEPS_PER_REV)")
print("")

// Full-step sequence
let fullStepSequence: [[UInt8]] = [
    [1, 1, 0, 0],
    [0, 1, 1, 0],
    [0, 0, 1, 1],
    [1, 0, 0, 1],
]

// Half-step sequence (smoother, 4096 steps/rev)
let halfStepSequence: [[UInt8]] = [
    [1, 0, 0, 0],
    [1, 1, 0, 0],
    [0, 1, 0, 0],
    [0, 1, 1, 0],
    [0, 0, 1, 0],
    [0, 0, 1, 1],
    [0, 0, 0, 1],
    [1, 0, 0, 1],
]

func stepMotor(steps: Int, delayMs: UInt32 = 2) {
    let direction = steps > 0 ? "CW ↻" : "CCW ↺"
    let angle = Float(abs(steps)) / Float(STEPS_PER_REV) * 360.0
    print("   🔄 \(direction): \(abs(steps)) steps (\(String(format: "%.1f", angle))°)")
}

// Demo
print("📌 Demo: Stepper Motor Control")
print("")
stepMotor(steps: 512)   // 90°
stepMotor(steps: 1024)  // 180°
stepMotor(steps: 2048)  // 360°
stepMotor(steps: -1024) // -180°
print("")

print("📌 Full-Step Sequence:")
print("   Step | IN1 IN2 IN3 IN4")
print("   -----|----------------")
for (i, step) in fullStepSequence.enumerated() {
    let pins = step.map { $0 == 1 ? "█" : "░" }.joined(separator: "   ")
    print("    \(i+1)   | \(pins)")
}
print("")

print("✅ Day 24 complete!")
