// ============================================
// Day 04 - Extra Examples
// Topic: PWM Applications
// ============================================

// MARK: - Example 1: RGB LED Control
/// Điều khiển LED RGB bằng 3 kênh PWM
func rgbLedControl() {
    let RED_PIN: UInt32 = 13     // PWM6B
    let GREEN_PIN: UInt32 = 14   // PWM7A
    let BLUE_PIN: UInt32 = 15    // PWM7B
    
    print("🌈 RGB LED Control:")
    
    struct Color {
        let name: String
        let r: Float
        let g: Float
        let b: Float
    }
    
    let colors = [
        Color(name: "Red", r: 1.0, g: 0.0, b: 0.0),
        Color(name: "Green", r: 0.0, g: 1.0, b: 0.0),
        Color(name: "Blue", r: 0.0, g: 0.0, b: 1.0),
        Color(name: "Yellow", r: 1.0, g: 1.0, b: 0.0),
        Color(name: "Cyan", r: 0.0, g: 1.0, b: 1.0),
        Color(name: "Purple", r: 1.0, g: 0.0, b: 1.0),
        Color(name: "White", r: 1.0, g: 1.0, b: 1.0),
        Color(name: "Orange", r: 1.0, g: 0.5, b: 0.0),
    ]
    
    for color in colors {
        let rPct = Int(color.r * 100)
        let gPct = Int(color.g * 100)
        let bPct = Int(color.b * 100)
        print("   \(color.name): R=\(rPct)% G=\(gPct)% B=\(bPct)%")
        // pwm_set_chan_level(sliceR, PWM_CHAN_B, UInt32(color.r * 65535))
        // pwm_set_chan_level(sliceG, PWM_CHAN_A, UInt32(color.g * 65535))
        // pwm_set_chan_level(sliceB, PWM_CHAN_B, UInt32(color.b * 65535))
    }
    print("")
}

// MARK: - Example 2: PWM Frequency Calculator
func pwmFrequencyCalc() {
    let sysClock: UInt32 = 125_000_000  // 125 MHz
    
    print("📊 PWM Frequency Calculator:")
    print("   System clock: \(sysClock / 1_000_000) MHz")
    print("")
    
    struct PWMConfig {
        let divider: Float
        let wrap: UInt16
        var frequency: Float {
            return Float(125_000_000) / (divider * Float(wrap + 1))
        }
    }
    
    let configs = [
        PWMConfig(divider: 1.0, wrap: 65535),
        PWMConfig(divider: 1.0, wrap: 9999),
        PWMConfig(divider: 125.0, wrap: 999),
        PWMConfig(divider: 125.0, wrap: 9999),
    ]
    
    print("   Divider  | Wrap   | Frequency")
    print("   ---------|--------|----------")
    for config in configs {
        let freq = config.frequency
        let freqStr: String
        if freq >= 1000 {
            freqStr = String(format: "%.1f kHz", freq / 1000)
        } else {
            freqStr = String(format: "%.1f Hz", freq)
        }
        print("   \(config.divider)\t | \(config.wrap)\t| \(freqStr)")
    }
    print("")
}

// MARK: - Example 3: Candle Flicker Effect
func candleFlicker() {
    print("🕯️ Candle Flicker Effect:")
    print("   Random brightness variations to simulate candle")
    
    // Mô phỏng random brightness
    let flickerValues: [Int] = [80, 45, 90, 70, 95, 40, 85, 60, 92, 50]
    
    for (i, value) in flickerValues.enumerated() {
        let bars = value / 5
        let bar = String(repeating: "█", count: bars)
        let space = String(repeating: "░", count: 20 - bars)
        print("   [\(String(format: "%02d", i))] [\(bar)\(space)] \(value)%")
        // let level = UInt16.random(in: 20000...65535)
        // pwm_set_chan_level(slice, channel, UInt32(level))
        // sleep_ms(UInt32.random(in: 50...150))
    }
    print("")
}

// MARK: - Run examples
print("🔌 === Day 04: Extra Examples ===\n")
rgbLedControl()
pwmFrequencyCalc()
candleFlicker()
