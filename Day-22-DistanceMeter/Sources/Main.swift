// ============================================
// Day 22 - DistanceMeter
// Topic: Ultrasonic Sensor (HC-SR04)
// ============================================

let TRIG_PIN: UInt32 = 14
let ECHO_PIN: UInt32 = 15

print("🔌 === Day 22: Ultrasonic Distance (HC-SR04) ===")
print("📌 Trig: GP\(TRIG_PIN), Echo: GP\(ECHO_PIN)")
print("")

func measureDistance() -> Float {
    // 1. Send 10µs pulse on TRIG
    // gpio_put(TRIG_PIN, true)
    // sleep_us(10)
    // gpio_put(TRIG_PIN, false)
    
    // 2. Measure ECHO pulse duration
    // let startTime = time_us_64()
    // while !gpio_get(ECHO_PIN) {} // wait for HIGH
    // let echoStart = time_us_64()
    // while gpio_get(ECHO_PIN) {} // wait for LOW
    // let echoEnd = time_us_64()
    // let duration = echoEnd - echoStart
    
    // 3. Calculate distance: d = t × 0.034 / 2
    // return Float(duration) * 0.034 / 2.0
    return 25.5
}

func demoDistanceReadings() {
    print("📌 Demo: Distance Measurements")
    print("   Formula: distance = echo_time × 343m/s / 2")
    print("")
    
    let readings: [(UInt32, Float)] = [
        (588, 10.0), (1470, 25.0), (2940, 50.0),
        (5880, 100.0), (11760, 200.0), (23520, 400.0),
    ]
    
    print("   Echo(µs) | Distance(cm) | Bar")
    print("   ---------|-------------|----")
    for (echoUs, dist) in readings {
        let bars = min(Int(dist / 20), 20)
        let bar = String(repeating: "▓", count: bars)
        print("   \(String(format: "%5d", echoUs))    | \(String(format: "%6.1f", dist))      | \(bar)")
    }
    print("")
    print("   Range: 2cm - 400cm")
    print("   ⚠️ HC-SR04 needs 5V, use voltage divider on ECHO!")
    print("")
}

demoDistanceReadings()

print("✅ Day 22 complete!")
print("📝 Next: Day 23 - DC Motor (L298N)")
