// ============================================
// Day 08 - AnalogRead
// Topic: ADC - Đọc tín hiệu Analog
// ============================================

// MARK: - Pin Configuration
let ADC_PIN: UInt32 = 26      // GP26 = ADC0
let LED_PIN: UInt32 = 15      // PWM output
let ADC_MAX: UInt16 = 4095    // 12-bit resolution (0-4095)
let VREF: Float = 3.3         // Reference voltage

// MARK: - Setup
// adc_init()
// adc_gpio_init(ADC_PIN)
// adc_select_input(0)  // ADC0 = GP26

// MARK: - Helper Functions

/// Đọc giá trị ADC (0-4095)
func readADC() -> UInt16 {
    // return adc_read()
    return 2048  // Mô phỏng
}

/// Chuyển ADC sang voltage
func adcToVoltage(_ adcValue: UInt16) -> Float {
    return Float(adcValue) / Float(ADC_MAX) * VREF
}

/// Chuyển ADC sang phần trăm
func adcToPercent(_ adcValue: UInt16) -> Int {
    return Int(Float(adcValue) / Float(ADC_MAX) * 100)
}

// MARK: - Demo 1: Đọc ADC cơ bản
func demoBasicADC() {
    print("📌 Demo 1: Basic ADC Reading")
    print("   Resolution: 12-bit (0-\(ADC_MAX))")
    print("   Vref: \(VREF)V")
    print("")
    
    // Mô phỏng nhiều giá trị ADC
    let readings: [UInt16] = [0, 512, 1024, 2048, 3072, 4095]
    
    print("   ADC   | Voltage | Percent")
    print("   ------|---------|--------")
    for reading in readings {
        let voltage = adcToVoltage(reading)
        let percent = adcToPercent(reading)
        print("   \(String(format: "%4d", reading))  | \(String(format: "%.2f", voltage))V   | \(percent)%")
    }
    print("")
}

// MARK: - Demo 2: Potentiometer điều khiển LED
func demoPotLED() {
    print("📌 Demo 2: Potentiometer → LED Brightness")
    print("   GP26 (ADC0) ← Potentiometer")
    print("   GP15 (PWM)  → LED")
    print("")
    
    let potValues: [UInt16] = [100, 500, 1500, 2500, 3500, 4000]
    
    for value in potValues {
        let percent = adcToPercent(value)
        let bars = percent / 5
        let bar = String(repeating: "█", count: bars)
        let space = String(repeating: "░", count: 20 - bars)
        let voltage = adcToVoltage(value)
        
        // pwm_set_chan_level(slice, channel, UInt32(value) * 16)
        print("   ADC=\(String(format: "%4d", value)) (\(String(format: "%.2f", voltage))V) LED: [\(bar)\(space)] \(percent)%")
    }
    print("")
}

// MARK: - Demo 3: Temperature Sensor (Internal)
func demoTemperature() {
    print("📌 Demo 3: Internal Temperature Sensor")
    print("   RP2040 has built-in temp sensor on ADC4")
    print("")
    
    // adc_select_input(4)  // Internal temp sensor
    // let raw = adc_read()
    // let voltage = Float(raw) * 3.3 / 4095.0
    // let tempC = 27.0 - (voltage - 0.706) / 0.001721
    
    // Mô phỏng
    let adcValues: [UInt16] = [876, 862, 848, 835]
    
    print("   ADC   | Voltage | Temperature")
    print("   ------|---------|------------")
    for raw in adcValues {
        let voltage = Float(raw) * 3.3 / 4095.0
        let tempC = 27.0 - (voltage - 0.706) / 0.001721
        print("   \(raw)  | \(String(format: "%.3f", voltage))V  | \(String(format: "%.1f", tempC))°C")
    }
    print("")
}

// MARK: - Demo 4: ADC Averaging (Noise reduction)
func demoAveraging() {
    print("📌 Demo 4: ADC Averaging (Reduce Noise)")
    print("   Take 10 samples, compute average")
    print("")
    
    // Mô phỏng noisy readings
    let samples: [UInt16] = [2035, 2055, 2040, 2060, 2045, 2038, 2052, 2041, 2058, 2036]
    
    print("   Samples: ", terminator: "")
    for s in samples {
        print("\(s) ", terminator: "")
    }
    print("")
    
    let sum = samples.reduce(0, { $0 + Int($1) })
    let average = sum / samples.count
    let min = samples.min()!
    let max = samples.max()!
    let noise = max - min
    
    print("   Average: \(average)")
    print("   Min: \(min), Max: \(max)")
    print("   Noise (peak-to-peak): \(noise)")
    print("   → Averaging reduces effective noise!")
    print("")
}

// MARK: - Main Program
print("🔌 === Day 08: Analog Read (ADC) ===")
print("📌 ADC Pin: GP\(ADC_PIN) (ADC0)")
print("📌 LED Pin: GP\(LED_PIN) (PWM)")
print("📌 Resolution: 12-bit (\(ADC_MAX + 1) levels)")
print("")

demoBasicADC()
demoPotLED()
demoTemperature()
demoAveraging()

print("✅ Day 08 complete!")
print("📝 Next: Day 09 - Servo Motor")
