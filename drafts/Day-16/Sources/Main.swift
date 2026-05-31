// ============================================
// Day 16 - LEDMatrix
// Topic: SPI - LED Matrix (MAX7219)
// ============================================

// MARK: - Configuration
let CS_PIN: UInt32 = 17
let MAX7219_DECODE: UInt8 = 0x09
let MAX7219_INTENSITY: UInt8 = 0x0A
let MAX7219_SCANLIMIT: UInt8 = 0x0B
let MAX7219_SHUTDOWN: UInt8 = 0x0C
let MAX7219_TEST: UInt8 = 0x0F

// MARK: - MAX7219 Functions
func max7219Send(register: UInt8, data: UInt8) {
    // gpio_put(CS_PIN, false)
    // spi_write_blocking(spi0, [register, data], 2)
    // gpio_put(CS_PIN, true)
}

func max7219Init() {
    print("   Initializing MAX7219...")
    max7219Send(register: MAX7219_TEST, data: 0x00)
    max7219Send(register: MAX7219_DECODE, data: 0x00)
    max7219Send(register: MAX7219_SCANLIMIT, data: 0x07)
    max7219Send(register: MAX7219_INTENSITY, data: 0x08)
    max7219Send(register: MAX7219_SHUTDOWN, data: 0x01)
    print("   ✅ MAX7219 ready!")
}

// MARK: - Display Patterns
func displayPattern(_ pattern: [[Int]], name: String) {
    print("   \(name):")
    for row in pattern {
        print("   ", terminator: "")
        for pixel in row {
            print(pixel == 1 ? "🟥" : "⬛", terminator: "")
        }
        print("")
    }
    print("")
}

// MARK: - Demo
func demoPatterns() {
    print("📌 Demo: 8x8 LED Matrix Patterns")
    print("")
    
    let smile: [[Int]] = [
        [0,0,1,1,1,1,0,0],
        [0,1,0,0,0,0,1,0],
        [1,0,1,0,0,1,0,1],
        [1,0,0,0,0,0,0,1],
        [1,0,1,0,0,1,0,1],
        [1,0,0,1,1,0,0,1],
        [0,1,0,0,0,0,1,0],
        [0,0,1,1,1,1,0,0],
    ]
    displayPattern(smile, name: "😊 Smiley Face")
    
    let heart: [[Int]] = [
        [0,1,1,0,0,1,1,0],
        [1,1,1,1,1,1,1,1],
        [1,1,1,1,1,1,1,1],
        [1,1,1,1,1,1,1,1],
        [0,1,1,1,1,1,1,0],
        [0,0,1,1,1,1,0,0],
        [0,0,0,1,1,0,0,0],
        [0,0,0,0,0,0,0,0],
    ]
    displayPattern(heart, name: "❤️ Heart")
}

// MARK: - Main
print("🔌 === Day 16: LED Matrix (MAX7219) ===")
print("📌 SPI0: DIN=GP19, CLK=GP18, CS=GP\(CS_PIN)")
print("")
max7219Init()
print("")
demoPatterns()
print("✅ Day 16 complete!")
