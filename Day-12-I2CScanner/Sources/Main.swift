// ============================================
// Day 12 - I2CScanner
// Topic: I2C - Giao tiếp cơ bản
// ============================================

// MARK: - Configuration
let I2C_PORT = 0  // i2c0
let SDA_PIN: UInt32 = 4  // GP4
let SCL_PIN: UInt32 = 5  // GP5
let I2C_FREQ: UInt32 = 100_000  // 100kHz (Standard mode)

// MARK: - Setup
// i2c_init(i2c0, I2C_FREQ)
// gpio_set_function(SDA_PIN, GPIO_FUNC_I2C)
// gpio_set_function(SCL_PIN, GPIO_FUNC_I2C)
// gpio_pull_up(SDA_PIN)
// gpio_pull_up(SCL_PIN)

// MARK: - I2C Scanner
func i2cScan() {
    print("📌 I2C Bus Scanner")
    print("   Scanning addresses 0x00 - 0x7F...")
    print("")
    
    // Header
    print("     0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F")
    
    // Mô phỏng các thiết bị I2C thường gặp
    let connectedDevices: [UInt8: String] = [
        0x27: "LCD I2C",
        0x3C: "SSD1306 OLED",
        0x48: "ADS1115 ADC",
        0x68: "MPU6050 IMU",
        0x76: "BMP280 Temp",
    ]
    
    for row in stride(from: 0, to: 128, by: 16) {
        print("   \(String(format: "%02X", row))", terminator: "")
        
        for col in 0..<16 {
            let addr = UInt8(row + col)
            if addr < 0x03 || addr > 0x77 {
                print("   ", terminator: "")
            } else if connectedDevices[addr] != nil {
                print(" \(String(format: "%02X", addr))", terminator: "")
            } else {
                print(" --", terminator: "")
            }
        }
        print("")
    }
    
    print("")
    print("   Found \(connectedDevices.count) device(s):")
    for (addr, name) in connectedDevices.sorted(by: { $0.key < $1.key }) {
        print("   ├── 0x\(String(format: "%02X", addr)): \(name)")
    }
    print("")
}

// MARK: - I2C Read/Write Demo
func demoReadWrite() {
    print("📌 Demo: I2C Read/Write Operations")
    print("")
    
    let deviceAddr: UInt8 = 0x76  // BMP280
    
    // Write: Send register address
    print("   📤 Write to 0x\(String(format: "%02X", deviceAddr)):")
    print("      [START] [ADDR+W] [REG: 0xD0] [STOP]")
    // i2c_write_blocking(i2c0, deviceAddr, &regAddr, 1, false)
    
    // Read: Get data back
    print("   📥 Read from 0x\(String(format: "%02X", deviceAddr)):")
    print("      [START] [ADDR+R] [DATA: 0x58] [STOP]")
    print("      → Chip ID = 0x58 (BMP280 confirmed!)")
    // i2c_read_blocking(i2c0, deviceAddr, &data, 1, false)
    
    print("")
}

// MARK: - I2C Protocol Visualization
func demoProtocol() {
    print("📌 I2C Protocol Breakdown:")
    print("")
    print("   Single byte write:")
    print("   ┌───────┬──────────┬─────┬──────┬──────┬──────┐")
    print("   │ START │ ADDR(7b) │ W/R │ ACK  │ DATA │ STOP │")
    print("   │   ↓   │ 1110110  │  0  │  ✓   │ 0xFF │  ↑   │")
    print("   │  SDA↓  │  slave   │write│slave │ byte │ SDA↑ │")
    print("   └───────┴──────────┴─────┴──────┴──────┴──────┘")
    print("")
    print("   Clock: SCL ‾‾|__|‾‾|__|‾‾|__|‾‾|__|‾‾|__|‾‾|__")
    print("   Data:  SDA ──┐ D7  D6  D5  D4  D3  D2  D1  D0")
    print("")
}

// MARK: - Main Program
print("🔌 === Day 12: I2C Scanner ===")
print("📌 I2C0: SDA=GP\(SDA_PIN), SCL=GP\(SCL_PIN)")
print("📌 Frequency: \(I2C_FREQ / 1000)kHz")
print("")

i2cScan()
demoReadWrite()
demoProtocol()

print("✅ Day 12 complete!")
print("📝 Next: Day 13 - SPI Communication")
