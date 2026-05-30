// ============================================
// Day 13 - SPIBasics
// Topic: SPI - Giao tiếp tốc độ cao
// ============================================

// MARK: - Configuration
let SPI_PORT = 0   // spi0
let SCK_PIN: UInt32 = 18
let MOSI_PIN: UInt32 = 19
let MISO_PIN: UInt32 = 16
let CS_PIN: UInt32 = 17
let SPI_FREQ: UInt32 = 1_000_000  // 1 MHz

// MARK: - SPI Helper Functions

func csSelect() {
    // gpio_put(CS_PIN, false)  // Active LOW
    print("   CS ↓ (Select)")
}

func csDeselect() {
    // gpio_put(CS_PIN, true)
    print("   CS ↑ (Deselect)")
}

func spiWrite(_ data: [UInt8]) {
    // spi_write_blocking(spi0, data, data.count)
    let hex = data.map { String(format: "0x%02X", $0) }.joined(separator: " ")
    print("   📤 MOSI: [\(hex)]")
}

func spiRead(count: Int) -> [UInt8] {
    // var buffer = [UInt8](repeating: 0, count: count)
    // spi_read_blocking(spi0, 0x00, &buffer, count)
    let simData: [UInt8] = [0x58, 0x01, 0x23, 0x45]
    let result = Array(simData.prefix(count))
    let hex = result.map { String(format: "0x%02X", $0) }.joined(separator: " ")
    print("   📥 MISO: [\(hex)]")
    return result
}

// MARK: - Demo 1: Loopback Test
func demoLoopback() {
    print("📌 Demo 1: SPI Loopback (MOSI → MISO)")
    print("   Connect GP19 (MOSI) to GP16 (MISO)")
    print("")
    
    let testData: [UInt8] = [0xAA, 0x55, 0xF0, 0x0F]
    
    csSelect()
    print("   📤 Send: ", terminator: "")
    for byte in testData {
        print("0x\(String(format: "%02X", byte)) ", terminator: "")
    }
    print("")
    
    // In loopback, received = sent
    print("   📥 Recv: ", terminator: "")
    for byte in testData {
        print("0x\(String(format: "%02X", byte)) ", terminator: "")
    }
    print(" ✅ Match!")
    csDeselect()
    print("")
}

// MARK: - Demo 2: Read Register
func demoReadRegister() {
    print("📌 Demo 2: Read Device Register")
    print("   Target: Read chip ID register (0xD0)")
    print("")
    
    csSelect()
    spiWrite([0xD0 | 0x80])  // 0x80 = read bit for many SPI devices
    _ = spiRead(count: 1)    // Read response
    csDeselect()
    
    print("   → Chip ID: 0x58 (BMP280)")
    print("")
}

// MARK: - Demo 3: Write then Read
func demoWriteRead() {
    print("📌 Demo 3: Write Register then Read Data")
    print("   Write config, then read temperature")
    print("")
    
    // Write configuration
    csSelect()
    spiWrite([0x74, 0x27])  // ctrl_meas register = 0x27
    csDeselect()
    print("   ✅ Config written")
    print("")
    
    // Read data
    csSelect()
    spiWrite([0xFA | 0x80])  // Read temp register
    _ = spiRead(count: 3)    // 3 bytes temperature
    csDeselect()
    print("   ✅ Temperature data received")
    print("")
}

// MARK: - Demo 4: SPI Modes
func demoSPIModes() {
    print("📌 Demo 4: SPI Clock Modes (CPOL/CPHA)")
    print("")
    print("   Mode | CPOL | CPHA | Clock idle | Sample edge")
    print("   -----|------|------|------------|------------")
    print("     0  |  0   |  0   | LOW        | Rising")
    print("     1  |  0   |  1   | LOW        | Falling")
    print("     2  |  1   |  0   | HIGH       | Falling")
    print("     3  |  1   |  1   | HIGH       | Rising")
    print("")
    print("   Most devices use Mode 0 (CPOL=0, CPHA=0)")
    print("")
    
    /*
    // Pico SDK:
    spi_set_format(spi0, 8,         // data bits
                   SPI_CPOL_0,       // CPOL
                   SPI_CPHA_0,       // CPHA
                   SPI_MSB_FIRST)    // bit order
    */
}

// MARK: - Main Program
print("🔌 === Day 13: SPI Basics ===")
print("📌 SPI0: SCK=GP\(SCK_PIN), MOSI=GP\(MOSI_PIN), MISO=GP\(MISO_PIN), CS=GP\(CS_PIN)")
print("📌 Frequency: \(SPI_FREQ / 1_000_000) MHz")
print("")

demoLoopback()
demoReadRegister()
demoWriteRead()
demoSPIModes()

print("✅ Day 13 complete!")
print("📝 Next: Day 14 - I2C Temperature Sensor (BMP280)")
