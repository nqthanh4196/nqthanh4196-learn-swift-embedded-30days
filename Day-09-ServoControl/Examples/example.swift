// ============================================
// Day 09 - Extra Examples
// ============================================

// MARK: - Example 1: Door Lock Servo
func doorLockDemo() {
    print("🔐 Smart Door Lock:")
    print("")
    
    enum DoorState: String {
        case locked = "🔒 LOCKED (0°)"
        case unlocked = "🔓 UNLOCKED (90°)"
    }
    
    let actions: [(String, DoorState)] = [
        ("Correct PIN", .unlocked),
        ("Auto-lock (5s)", .locked),
        ("Fingerprint OK", .unlocked),
        ("Auto-lock (5s)", .locked),
        ("Wrong PIN x3", .locked),
    ]
    
    for (action, state) in actions {
        print("   [\(action)] → \(state.rawValue)")
    }
    print("")
}

// MARK: - Example 2: Radar sweep with sensor
func radarSweep() {
    print("📡 Radar Sweep (Servo + Ultrasonic):")
    print("")
    
    let readings: [(Int, Int)] = [  // (angle, distance_cm)
        (0, 45), (15, 42), (30, 38), (45, 60),
        (60, 120), (75, 95), (90, 200), (105, 150),
        (120, 30), (135, 25), (150, 28), (165, 55), (180, 80)
    ]
    
    print("   Angle | Distance | Map")
    print("   ------|----------|----")
    for (angle, dist) in readings {
        let bars = min(dist / 10, 20)
        let bar = String(repeating: "▓", count: bars)
        let icon = dist < 30 ? "⚠️" : "  "
        print("   \(String(format: "%3d", angle))°  | \(String(format: "%3d", dist))cm    | \(bar) \(icon)")
    }
    print("")
}

// MARK: - Example 3: Multi-servo robot arm
func robotArm() {
    print("🤖 Robot Arm (3 Servos):")
    print("   Base (GP15): Rotation 0-180°")
    print("   Shoulder (GP14): Lift 0-120°")
    print("   Gripper (GP13): Open/Close 0-60°")
    print("")
    
    struct ArmPosition {
        let name: String
        let base: Int
        let shoulder: Int
        let gripper: Int
    }
    
    let positions = [
        ArmPosition(name: "Home", base: 90, shoulder: 90, gripper: 0),
        ArmPosition(name: "Reach Left", base: 30, shoulder: 60, gripper: 0),
        ArmPosition(name: "Grab", base: 30, shoulder: 45, gripper: 50),
        ArmPosition(name: "Lift", base: 30, shoulder: 90, gripper: 50),
        ArmPosition(name: "Move Right", base: 150, shoulder: 90, gripper: 50),
        ArmPosition(name: "Lower", base: 150, shoulder: 45, gripper: 50),
        ArmPosition(name: "Release", base: 150, shoulder: 45, gripper: 0),
        ArmPosition(name: "Home", base: 90, shoulder: 90, gripper: 0),
    ]
    
    for pos in positions {
        print("   [\(pos.name)] Base:\(pos.base)° Shoulder:\(pos.shoulder)° Gripper:\(pos.gripper)°")
    }
    print("")
}

// MARK: - Run Examples
print("🔌 === Day 09: Extra Examples ===\n")
doorLockDemo()
radarSweep()
robotArm()
