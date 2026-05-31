// ============================================
// Day 04 - LEDDimmer
// Topic: PWM - Điều khiển độ sáng LED
// ============================================

// MARK: - Pin Configuration
let LED_PIN: UInt32 = 15     // PWM output to LED
let PWM_WRAP: UInt16 = 65535 // 16-bit resolution

// MARK: - Setup PWM
// gpio_set_function(LED_PIN, GPIO_FUNC_PWM)
// let slice = pwm_gpio_to_slice_num(LED_PIN)
// pwm_set_wrap(slice, UInt32(PWM_WRAP))
// pwm_set_clkdiv(slice, 1.0)
// pwm_set_enabled(slice, true)

// MARK: - Helper functions

/// Set LED brightness (0.0 - 1.0)
func setLEDBrightness(_ brightness: Float) {
    let level = UInt16(brightness * Float(PWM_WRAP))
    // pwm_set_chan_level(slice, PWM_CHAN_B, UInt32(level))
    
    let percent = Int(brightness * 100)
    let bars = Int(brightness * 20)
    let bar = String(repeating: "█", count: bars)
    let space = String(repeating: "░", count: 20 - bars)
    print("   [\(bar)\(space)] \(percent)%  (level: \(level))")
}

// MARK: - 1. Các mức sáng cố định
func fixedBrightness() {
    print("📌 Fixed Brightness Levels:")
    
    let levels: [(String, Float)] = [
        ("OFF", 0.0),
        ("Dim", 0.1),
        ("Quarter", 0.25),
        ("Half", 0.5),
        ("Bright", 0.75),
        ("Full", 1.0)
    ]
    
    for (name, value) in levels {
        print("   \(name):")
        setLEDBrightness(value)
    }
    print("")
}

// MARK: - 2. Fade In (sáng dần)
func fadeIn(steps: Int, delayMs: UInt32) {
    print("🌅 Fade In (\(steps) steps, \(delayMs)ms each):")
    
    for i in 0...steps {
        let brightness = Float(i) / Float(steps)
        setLEDBrightness(brightness)
        // sleep_ms(delayMs)
    }
    print("")
}

// MARK: - 3. Fade Out (tối dần)
func fadeOut(steps: Int, delayMs: UInt32) {
    print("🌇 Fade Out (\(steps) steps):")
    
    for i in stride(from: steps, through: 0, by: -1) {
        let brightness = Float(i) / Float(steps)
        setLEDBrightness(brightness)
        // sleep_ms(delayMs)
    }
    print("")
}

// MARK: - 4. Breathing effect (sáng rồi tối lặp lại)
func breathing(cycles: Int) {
    print("🫁 Breathing Effect (\(cycles) cycles):")
    
    for cycle in 1...cycles {
        print("   --- Cycle \(cycle) ---")
        // Fade in
        for i in stride(from: 0, through: 100, by: 20) {
            setLEDBrightness(Float(i) / 100.0)
            // sleep_ms(30)
        }
        // Fade out
        for i in stride(from: 100, through: 0, by: -20) {
            setLEDBrightness(Float(i) / 100.0)
            // sleep_ms(30)
        }
    }
    print("")
}

// MARK: - 5. Gamma correction (mắt người nhìn phi tuyến)
func gammaCorrection() {
    print("🎨 Gamma Correction (perceived brightness):")
    print("   Linear vs Gamma-corrected:")
    
    let gamma: Float = 2.2
    
    for i in stride(from: 0, through: 100, by: 20) {
        let linear = Float(i) / 100.0
        let corrected = pow(linear, gamma)
        
        let linBars = Int(linear * 10)
        let corBars = Int(corrected * 10)
        let linBar = String(repeating: "█", count: linBars) + String(repeating: "░", count: 10 - linBars)
        let corBar = String(repeating: "█", count: corBars) + String(repeating: "░", count: 10 - corBars)
        
        print("   Input \(i)% → Linear[\(linBar)] Gamma[\(corBar)]")
    }
    print("")
}

// MARK: - Main Program
print("🔌 === Day 04: LED Dimmer (PWM) ===")
print("📌 LED Pin: GP\(LED_PIN) (PWM7B)")
print("📌 Resolution: 16-bit (0-\(PWM_WRAP))")
print("")

fixedBrightness()
fadeIn(steps: 5, delayMs: 100)
fadeOut(steps: 5, delayMs: 100)
breathing(cycles: 2)
gammaCorrection()

print("✅ Day 04 complete!")
print("📝 Next: Day 05 - Timer & Interrupts")
