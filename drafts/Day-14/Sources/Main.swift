// ============================================
// Day 14 - TempReader
// Topic: I2C - BMP280 Temperature Sensor
// ============================================

// MARK: - BMP280 Configuration
let BMP280_ADDR: UInt8 = 0x76
let BMP280_CHIP_ID: UInt8 = 0x58

// BMP280 Registers
let REG_CHIP_ID: UInt8 = 0xD0
let REG_CTRL_MEAS: UInt8 = 0xF4
let REG_CONFIG: UInt8 = 0xF5
let REG_TEMP_MSB: UInt8 = 0xFA
let REG_PRESS_MSB: UInt8 = 0xF7

// MARK: - I2C Setup
let SDA_PIN: UInt32 = 4
let SCL_PIN: UInt32 = 5

// MARK: - BMP280 Functions

func bmp280ReadRegister(_ reg: UInt8) -> UInt8 {
    // var regAddr = reg
    // i2c_write_blocking(i2c0, BMP280_ADDR, &regAddr, 1, true)
    // var data: UInt8 = 0
    // i2c_read_blocking(i2c0, BMP280_ADDR, &data, 1, false)
    // return data
    
    // Simulated values
    switch reg {
    case REG_CHIP_ID: return 0x58
    case REG_CTRL_MEAS: return 0x27
    default: return 0x00
    }
}

func bmp280Init() -> Bool {
    let chipId = bmp280ReadRegister(REG_CHIP_ID)
    print("   Chip ID: 0x\(String(format: "%02X", chipId))", terminator: "")
    
    if chipId == BMP280_CHIP_ID {
        print(" ✅ BMP280 detected!")
        // Set mode: Temp oversampling x2, Pressure x16, Normal mode
        // bmp280WriteRegister(REG_CTRL_MEAS, 0x57)
        // bmp280WriteRegister(REG_CONFIG, 0xA0)
        return true
    } else {
        print(" ❌ Wrong chip!")
        return false
    }
}

/// Mô phỏng đọc temperature từ BMP280
func bmp280ReadTemperature() -> Float {
    // Thực tế: đọc 3 bytes từ 0xFA, áp dụng compensation formula
    /*
    var regAddr = REG_TEMP_MSB
    i2c_write_blocking(i2c0, BMP280_ADDR, &regAddr, 1, true)
    var data = [UInt8](repeating: 0, count: 3)
    i2c_read_blocking(i2c0, BMP280_ADDR, &data, 3, false)
    
    let rawTemp = (Int32(data[0]) << 12) | (Int32(data[1]) << 4) | (Int32(data[2]) >> 4)
    // Apply compensation formula from calibration data
    */
    return 26.53  // Simulated
}

func bmp280ReadPressure() -> Float {
    return 1013.25  // Simulated - standard atmospheric pressure
}

// MARK: - Demo
func demoTemperatureReading() {
    print("📌 Demo: BMP280 Temperature & Pressure")
    print("")
    
    // Init
    print("   Initializing BMP280...")
    let success = bmp280Init()
    guard success else {
        print("   ❌ Init failed!")
        return
    }
    print("")
    
    // Simulated readings over time
    let readings: [(Float, Float)] = [
        (25.3, 1013.2),
        (25.5, 1013.1),
        (25.8, 1013.0),
        (26.1, 1012.9),
        (26.5, 1012.8),
    ]
    
    print("   #  | Temp (°C) | Pressure (hPa) | Altitude (m)")
    print("   ---|-----------|----------------|-------------")
    
    for (i, (temp, press)) in readings.enumerated() {
        // Altitude formula: alt = 44330 * (1 - (P/P0)^0.1903)
        let altitude = 44330.0 * (1.0 - pow(Double(press) / 1013.25, 0.1903))
        print("   \(i+1)  | \(String(format: "%5.1f", temp))     | \(String(format: "%7.1f", press))        | \(String(format: "%5.1f", altitude))")
    }
    print("")
}

// MARK: - Demo Compensation Formula
func demoCompensation() {
    print("📌 BMP280 Compensation Algorithm:")
    print("")
    print("   Raw ADC (20-bit) → Compensated Value")
    print("")
    print("   1. Read calibration data from NVM (0x88-0xA1)")
    print("   2. Read raw temperature (3 bytes from 0xFA)")
    print("   3. Apply compensation formula:")
    print("")
    print("   var1 = (raw/16384 - dig_T1/1024) * dig_T2")
    print("   var2 = ((raw/131072 - dig_T1/8192)^2) * dig_T3")
    print("   t_fine = var1 + var2")
    print("   temperature = t_fine / 5120.0")
    print("")
}

// MARK: - Main Program
print("🔌 === Day 14: BMP280 Temperature Reader ===")
print("📌 I2C0: SDA=GP\(SDA_PIN), SCL=GP\(SCL_PIN)")
print("📌 BMP280 Address: 0x\(String(format: "%02X", BMP280_ADDR))")
print("")

demoTemperatureReading()
demoCompensation()

print("✅ Day 14 complete!")
print("📝 Next: Day 15 - OLED Display (SSD1306)")
