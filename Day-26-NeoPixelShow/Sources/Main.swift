// ============================================
// Day 26 - NeoPixelShow
// Topic: WS2812B NeoPixel LED Strip
// ============================================

let NEOPIXEL_PIN: UInt32 = 28
let NUM_LEDS: Int = 8

print("🔌 === Day 26: NeoPixel (WS2812B) ===")
print("📌 Pin: GP\(NEOPIXEL_PIN), LEDs: \(NUM_LEDS)")
print("📌 Using PIO for precise 800kHz timing")
print("")

struct RGB {
    let r: UInt8, g: UInt8, b: UInt8
    var grb: UInt32 { UInt32(g) << 16 | UInt32(r) << 8 | UInt32(b) }
    
    static let red = RGB(r: 255, g: 0, b: 0)
    static let green = RGB(r: 0, g: 255, b: 0)
    static let blue = RGB(r: 0, g: 0, b: 255)
    static let white = RGB(r: 255, g: 255, b: 255)
    static let off = RGB(r: 0, g: 0, b: 0)
    static let yellow = RGB(r: 255, g: 255, b: 0)
    static let purple = RGB(r: 255, g: 0, b: 255)
    static let cyan = RGB(r: 0, g: 255, b: 255)
    static let orange = RGB(r: 255, g: 128, b: 0)
}

func showLEDs(_ leds: [RGB]) {
    for (i, led) in leds.enumerated() {
        let icon: String
        if led.r > 200 && led.g < 50 && led.b < 50 { icon = "🔴" }
        else if led.r < 50 && led.g > 200 && led.b < 50 { icon = "🟢" }
        else if led.r < 50 && led.g < 50 && led.b > 200 { icon = "🔵" }
        else if led.r > 200 && led.g > 200 && led.b < 50 { icon = "🟡" }
        else if led.r > 200 && led.g < 50 && led.b > 200 { icon = "🟣" }
        else if led.r == 0 && led.g == 0 && led.b == 0 { icon = "⬛" }
        else { icon = "🟠" }
        print(icon, terminator: "")
    }
    print("")
}

// Demo patterns
print("📌 Demo: NeoPixel Patterns")
print("")

print("   All Red:")
print("   ", terminator: "")
showLEDs([.red, .red, .red, .red, .red, .red, .red, .red])

print("   Rainbow:")
print("   ", terminator: "")
showLEDs([.red, .orange, .yellow, .green, .cyan, .blue, .purple, .red])

print("   Chase:")
for i in 0..<8 {
    var leds = [RGB](repeating: .off, count: 8)
    leds[i] = .blue
    print("   ", terminator: "")
    showLEDs(leds)
}
print("")

print("✅ Day 26 complete!")
