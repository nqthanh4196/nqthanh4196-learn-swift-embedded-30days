// ============================================
// Day 15 - OLEDDisplay
// Topic: I2C - OLED Display (SSD1306)
// ============================================

// MARK: - SSD1306 Configuration
let OLED_ADDR: UInt8 = 0x3C
let OLED_WIDTH: Int = 128
let OLED_HEIGHT: Int = 64
let OLED_PAGES: Int = 8  // 64 / 8 = 8 pages

// SSD1306 Commands
let CMD_DISPLAY_OFF: UInt8 = 0xAE
let CMD_DISPLAY_ON: UInt8 = 0xAF
let CMD_SET_CONTRAST: UInt8 = 0x81
let CMD_NORMAL_DISPLAY: UInt8 = 0xA6
let CMD_INVERT_DISPLAY: UInt8 = 0xA7
let CMD_SET_MUX_RATIO: UInt8 = 0xA8
let CMD_SET_DISPLAY_OFFSET: UInt8 = 0xD3

// MARK: - Frame Buffer
var frameBuffer = [UInt8](repeating: 0, count: 128 * 8)  // 128x64 / 8

// MARK: - OLED Functions

func oledSendCommand(_ cmd: UInt8) {
    // var data: [UInt8] = [0x00, cmd]  // 0x00 = command mode
    // i2c_write_blocking(i2c0, OLED_ADDR, &data, 2, false)
}

func oledInit() {
    print("   📺 Initializing SSD1306 OLED...")
    
    let initSequence: [UInt8] = [
        CMD_DISPLAY_OFF,    // Display OFF
        0x20, 0x00,         // Memory addressing mode: Horizontal
        0xB0,               // Page start address
        0xC8,               // COM output scan direction
        0x00, 0x10,         // Low/High column address
        CMD_SET_MUX_RATIO, 0x3F,  // Mux ratio = 63 (64 lines)
        CMD_SET_DISPLAY_OFFSET, 0x00,
        0x40,               // Display start line
        0x8D, 0x14,         // Charge pump ON
        0xDA, 0x12,         // COM pin config
        CMD_SET_CONTRAST, 0xCF,
        0xD9, 0xF1,         // Pre-charge period
        0xDB, 0x40,         // VCOMH deselect level
        CMD_NORMAL_DISPLAY,
        CMD_DISPLAY_ON
    ]
    
    for cmd in initSequence {
        oledSendCommand(cmd)
    }
    
    print("   ✅ OLED initialized (\(OLED_WIDTH)x\(OLED_HEIGHT))")
}

func oledClear() {
    frameBuffer = [UInt8](repeating: 0, count: 128 * 8)
    // Send buffer to display
    print("   🧹 Display cleared")
}

func oledSetPixel(x: Int, y: Int, on: Bool = true) {
    guard x >= 0 && x < OLED_WIDTH && y >= 0 && y < OLED_HEIGHT else { return }
    let page = y / 8
    let bit = y % 8
    let index = page * OLED_WIDTH + x
    if on {
        frameBuffer[index] |= (1 << bit)
    } else {
        frameBuffer[index] &= ~(1 << bit)
    }
}

func oledDrawText(_ text: String, x: Int, y: Int) {
    print("   📝 Text at (\(x),\(y)): \"\(text)\"")
}

// MARK: - Demo: ASCII Art Display
func demoDisplay() {
    print("📌 Demo: OLED Display Content")
    print("")
    print("   ┌────────────────────────────────┐")
    print("   │ 🌡️ Temp: 25.3°C               │")
    print("   │ 💧 Hum:  65.2%                │")
    print("   │ ⏱️ Uptime: 00:05:23           │")
    print("   │                                │")
    print("   │ ▓▓▓▓▓▓▓▓▓░░░░░░░ 58%         │")
    print("   │                                │")
    print("   │ 🔌 Swift Embedded Pico         │")
    print("   └────────────────────────────────┘")
    print("     128 x 64 pixels (I2C @ 400kHz)")
    print("")
}

// MARK: - Demo: Graphics primitives
func demoGraphics() {
    print("📌 Demo: Drawing Primitives")
    print("")
    
    // Line
    print("   Line (0,0)→(127,63):")
    print("   ╲")
    print("    ╲")
    print("     ╲")
    print("      ╲")
    print("")
    
    // Rectangle
    print("   Rectangle (10,10,50,30):")
    print("   ┌──────────────────┐")
    print("   │                  │")
    print("   │                  │")
    print("   └──────────────────┘")
    print("")
    
    // Circle (Bresenham)
    print("   Circle center(64,32) r=20:")
    print("       ╭────────╮")
    print("      │          │")
    print("      │    ·     │")
    print("      │          │")
    print("       ╰────────╯")
    print("")
}

// MARK: - Demo: Scrolling text
func demoScrolling() {
    print("📌 Demo: Hardware Scrolling")
    print("")
    
    /*
    // SSD1306 hardware scroll commands
    oledSendCommand(0x26)  // Right horizontal scroll
    oledSendCommand(0x00)  // Dummy byte
    oledSendCommand(0x00)  // Start page 0
    oledSendCommand(0x07)  // Scroll speed (frames)
    oledSendCommand(0x07)  // End page 7
    oledSendCommand(0x00)  // Dummy
    oledSendCommand(0xFF)  // Dummy
    oledSendCommand(0x2F)  // Activate scroll
    */
    
    let text = "Hello Swift Embedded! 🔌"
    print("   ← Scrolling: \"\(text)\"")
    print("   Scroll speed: 5 frames/step")
    print("")
}

// MARK: - Main Program
print("🔌 === Day 15: OLED Display (SSD1306) ===")
print("📌 I2C Address: 0x\(String(format: "%02X", OLED_ADDR))")
print("📌 Resolution: \(OLED_WIDTH)x\(OLED_HEIGHT)")
print("")

oledInit()
print("")
oledClear()
print("")
demoDisplay()
demoGraphics()
demoScrolling()

print("✅ Day 15 complete!")
print("📝 Next: Day 16 - LED Matrix (MAX7219)")
