// ============================================
// Day 08 - Extra Examples
// ============================================

// MARK: - Example 1: Light sensor (LDR)
func ldrSensorDemo() {
    print("💡 Light Sensor (LDR) with ADC:")
    print("   Circuit: 3.3V → LDR → GP26 → 10kΩ → GND")
    print("")
    
    // Mô phỏng các mức ánh sáng
    let readings: [(UInt16, String)] = [
        (3800, "☀️ Bright sunlight"),
        (2500, "🌤️ Indoor light"),
        (1200, "🌥️ Dim room"),
        (500, "🌙 Twilight"),
        (100, "🌑 Dark"),
    ]
    
    for (adc, condition) in readings {
        let voltage = Float(adc) * 3.3 / 4095.0
        print("   ADC=\(String(format: "%4d", adc)) (\(String(format: "%.2f", voltage))V) → \(condition)")
    }
    print("")
}

// MARK: - Example 2: Battery voltage monitor
func batteryMonitor() {
    print("🔋 Battery Voltage Monitor:")
    print("   Voltage divider: Vin → [10kΩ] → ADC → [10kΩ] → GND")
    print("   Ratio: 2:1 (multiply ADC voltage by 2)")
    print("")
    
    let readings: [(UInt16, String)] = [
        (2482, "🟢 Full (4.1V)"),
        (2296, "🟢 Good (3.8V)"),
        (2172, "🟡 Medium (3.6V)"),
        (2048, "🟠 Low (3.4V)"),
        (1862, "🔴 Critical (3.1V)"),
    ]
    
    for (adc, status) in readings {
        let adcVoltage = Float(adc) * 3.3 / 4095.0
        let batteryVoltage = adcVoltage * 2.0  // Voltage divider ratio
        print("   ADC=\(adc) → \(String(format: "%.2f", batteryVoltage))V \(status)")
    }
    print("")
}

// MARK: - Example 3: Joystick (2 axis ADC)
func joystickDemo() {
    print("🕹️ Joystick (2-Axis Analog):")
    print("   X-axis: GP26 (ADC0)")
    print("   Y-axis: GP27 (ADC1)")
    print("   Center ≈ 2048")
    print("")
    
    let positions: [(UInt16, UInt16, String)] = [
        (2048, 2048, "⊕ Center"),
        (4000, 2048, "→ Right"),
        (100, 2048, "← Left"),
        (2048, 4000, "↑ Up"),
        (2048, 100, "↓ Down"),
        (3800, 3800, "↗ Up-Right"),
        (200, 200, "↙ Down-Left"),
    ]
    
    print("   X    | Y    | Direction")
    print("   -----|------|----------")
    for (x, y, dir) in positions {
        print("   \(String(format: "%4d", x)) | \(String(format: "%4d", y)) | \(dir)")
    }
    print("")
}

// MARK: - Run Examples
print("🔌 === Day 08: Extra Examples ===\n")
ldrSensorDemo()
batteryMonitor()
joystickDemo()
