// ============================================
// Day 12 - Extra Examples
// ============================================

// MARK: - Example 1: I2C Multi-byte read/write
func multiBytDemo() {
    print("📦 Multi-byte I2C Transaction:")
    print("")
    
    // Write multiple bytes
    let writeData: [UInt8] = [0xF4, 0x2F]  // BMP280: ctrl_meas register
    print("   📤 Write 2 bytes to 0x76:")
    print("      Register: 0x\(String(format: "%02X", writeData[0]))")
    print("      Value:    0x\(String(format: "%02X", writeData[1]))")
    print("      [START][0x76+W][0xF4][0x2F][STOP]")
    print("")
    
    // Read multiple bytes
    let readData: [UInt8] = [0x50, 0x6B, 0x00, 0x80, 0x00, 0x00]
    print("   📥 Read 6 bytes from 0x76 (temperature data):")
    print("      Register 0xF7-0xFC:")
    for (i, byte) in readData.enumerated() {
        print("      [\(i)] 0x\(String(format: "%02X", byte))")
    }
    print("")
}

// MARK: - Example 2: I2C speed comparison
func speedComparison() {
    print("⚡ I2C Speed Modes:")
    print("")
    print("   Mode     | Speed    | Use Case")
    print("   ---------|----------|------------------")
    print("   Standard | 100 kHz  | Sensors, RTC")
    print("   Fast     | 400 kHz  | OLED, EEPROM")
    print("   Fast+    | 1 MHz    | High-speed sensor")
    print("")
    
    // Transfer time calculation
    let dataSize = 64  // bytes
    let speeds: [(String, UInt32)] = [
        ("100kHz", 100_000),
        ("400kHz", 400_000),
        ("1MHz", 1_000_000),
    ]
    
    print("   Time to transfer \(dataSize) bytes:")
    for (name, speed) in speeds {
        let bits = dataSize * 9  // 8 data + 1 ACK per byte
        let timeUs = bits * 1_000_000 / Int(speed)
        print("   \(name): ~\(timeUs)µs")
    }
    print("")
}

// MARK: - Example 3: I2C Error handling
func errorHandling() {
    print("❌ I2C Error Handling:")
    print("")
    
    /*
    func i2cReadSafe(addr: UInt8, reg: UInt8, buffer: inout [UInt8]) -> Bool {
        // Write register address
        var regAddr = reg
        let writeResult = i2c_write_blocking(i2c0, addr, &regAddr, 1, true)
        if writeResult < 0 {
            print("Write failed! Device not responding.")
            return false
        }
        
        // Read data
        let readResult = i2c_read_blocking(i2c0, addr, &buffer, buffer.count, false)
        if readResult < 0 {
            print("Read failed!")
            return false
        }
        
        return true
    }
    */
    
    let scenarios: [(String, String)] = [
        ("PICO_ERROR_GENERIC (-1)", "Device not found / NACK received"),
        ("PICO_ERROR_TIMEOUT (-2)", "SCL held low (bus stuck)"),
        ("Successful (>0)", "Returns number of bytes transferred"),
    ]
    
    for (code, meaning) in scenarios {
        print("   \(code)")
        print("   → \(meaning)")
        print("")
    }
}

// MARK: - Run Examples
print("🔌 === Day 12: Extra Examples ===\n")
multiBytDemo()
speedComparison()
errorHandling()
