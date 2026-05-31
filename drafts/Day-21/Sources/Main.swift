// ============================================
// Day 21 - DHTSensor
// Topic: DHT22 - Temperature & Humidity
// ============================================

let DHT_PIN: UInt32 = 15

print("🔌 === Day 21: DHT22 Sensor ===")
print("📌 Data Pin: GP\(DHT_PIN) (with 10kΩ pull-up)")
print("")

// MARK: - DHT22 Protocol
func readDHT22() -> (humidity: Float, temperature: Float)? {
    /*
    // 1. Send start signal
    gpio_set_dir(DHT_PIN, GPIO_OUT)
    gpio_put(DHT_PIN, false)
    sleep_ms(1)
    gpio_put(DHT_PIN, true)
    
    // 2. Switch to input & wait for response
    gpio_set_dir(DHT_PIN, GPIO_IN)
    // Wait for DHT to pull LOW (80µs) then HIGH (80µs)
    
    // 3. Read 40 bits
    var bits = [UInt8](repeating: 0, count: 40)
    for i in 0..<40 {
        // Wait for LOW→HIGH transition
        // Measure HIGH duration
        // > 50µs = bit 1, < 30µs = bit 0
    }
    
    // 4. Parse data
    let humHigh = bits[0..<8]
    let humLow = bits[8..<16]
    let tempHigh = bits[16..<24]
    let tempLow = bits[24..<32]
    let checksum = bits[32..<40]
    
    // 5. Verify checksum
    */
    
    return (humidity: 65.2, temperature: 25.3)
}

// MARK: - Demo
func demoReadings() {
    print("📌 Demo: DHT22 Readings (every 2 seconds)")
    print("")
    
    let readings: [(Float, Float)] = [
        (25.3, 65.2), (25.4, 65.0), (25.5, 64.8),
        (25.6, 64.5), (25.8, 64.2),
    ]
    
    print("   #  | Temp (°C) | Humidity (%) | Checksum")
    print("   ---|-----------|-------------|----------")
    for (i, (temp, hum)) in readings.enumerated() {
        let checksum = "✅ OK"
        print("   \(i+1)  | \(String(format: "%5.1f", temp))     | \(String(format: "%5.1f", hum))       | \(checksum)")
    }
    print("")
    
    // Data format
    print("📌 Data Format (40 bits):")
    print("   Byte 0-1: Humidity × 10 (e.g., 652 = 65.2%)")
    print("   Byte 2-3: Temperature × 10 (e.g., 253 = 25.3°C)")
    print("   Byte 4:   Checksum (sum of bytes 0-3)")
    print("")
    
    // Raw bits example
    let humRaw: UInt16 = 652
    let tempRaw: UInt16 = 253
    let chk = UInt8((humRaw >> 8) &+ UInt16(humRaw & 0xFF) &+ (tempRaw >> 8) &+ UInt16(tempRaw & 0xFF))
    print("   Example: 0x\(String(format: "%04X", humRaw)) 0x\(String(format: "%04X", tempRaw)) 0x\(String(format: "%02X", chk))")
    print("")
}

demoReadings()

print("✅ Day 21 complete!")
print("📝 Next: Day 22 - Ultrasonic Sensor (HC-SR04)")
