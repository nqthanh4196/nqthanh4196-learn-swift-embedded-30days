// ============================================
// Day 10 - MelodyPlayer
// Topic: Buzzer - Phát âm thanh & giai điệu
// ============================================

// MARK: - Pin Configuration
let BUZZER_PIN: UInt32 = 15  // Passive buzzer on GP15 (PWM)

// MARK: - Music Notes (Frequency in Hz)
struct Note {
    static let C4: UInt32 = 262
    static let D4: UInt32 = 294
    static let E4: UInt32 = 330
    static let F4: UInt32 = 349
    static let G4: UInt32 = 392
    static let A4: UInt32 = 440
    static let B4: UInt32 = 494
    static let C5: UInt32 = 523
    static let D5: UInt32 = 587
    static let E5: UInt32 = 659
    static let REST: UInt32 = 0
}

// MARK: - Duration
let WHOLE: UInt32 = 1000
let HALF: UInt32 = 500
let QUARTER: UInt32 = 250
let EIGHTH: UInt32 = 125

// MARK: - Tone Functions

/// Play a tone at specific frequency
func playTone(frequency: UInt32, durationMs: UInt32) {
    if frequency == 0 {
        // Rest - no sound
        // pwm_set_chan_level(slice, channel, 0)
        print("   🔇 Rest (\(durationMs)ms)")
    } else {
        // Set PWM frequency to match note
        // let wrap = 125_000_000 / (divider * frequency) - 1
        // pwm_set_wrap(slice, wrap)
        // pwm_set_chan_level(slice, channel, wrap / 2)  // 50% duty
        print("   🎵 \(frequency)Hz (\(durationMs)ms)")
    }
    // sleep_ms(durationMs)
    // pwm_set_chan_level(slice, channel, 0)  // Short silence between notes
    // sleep_ms(20)
}

/// Stop tone
func noTone() {
    // pwm_set_chan_level(slice, channel, 0)
}

// MARK: - Demo 1: Scale
func demoScale() {
    print("📌 Demo 1: C Major Scale")
    print("")
    
    let scale: [(String, UInt32)] = [
        ("Do ", Note.C4), ("Re ", Note.D4), ("Mi ", Note.E4),
        ("Fa ", Note.F4), ("Sol", Note.G4), ("La ", Note.A4),
        ("Si ", Note.B4), ("Do'", Note.C5)
    ]
    
    for (name, freq) in scale {
        let bars = Int(freq / 30)
        let bar = String(repeating: "♪", count: min(bars, 20))
        print("   \(name) = \(String(format: "%3d", freq))Hz  \(bar)")
        // playTone(frequency: freq, durationMs: QUARTER)
    }
    print("")
}

// MARK: - Demo 2: Twinkle Twinkle Little Star
func demoTwinkle() {
    print("📌 Demo 2: Twinkle Twinkle Little Star ⭐")
    print("")
    
    let melody: [(UInt32, UInt32)] = [
        (Note.C4, QUARTER), (Note.C4, QUARTER),  // Twin-kle
        (Note.G4, QUARTER), (Note.G4, QUARTER),  // twin-kle
        (Note.A4, QUARTER), (Note.A4, QUARTER),  // lit-tle
        (Note.G4, HALF),                          // star
        (Note.F4, QUARTER), (Note.F4, QUARTER),  // how I
        (Note.E4, QUARTER), (Note.E4, QUARTER),  // won-der
        (Note.D4, QUARTER), (Note.D4, QUARTER),  // what you
        (Note.C4, HALF),                          // are
    ]
    
    let lyrics = ["Twin-", "kle,", "twin-", "kle,", "lit-", "tle", "star,",
                  "how", "I", "won-", "der", "what", "you", "are."]
    
    for (i, (freq, dur)) in melody.enumerated() {
        let word = i < lyrics.count ? lyrics[i] : ""
        let noteType = dur == HALF ? "♩♩" : "♩ "
        print("   \(noteType) \(String(format: "%3d", freq))Hz \(String(format: "%3d", dur))ms  \(word)")
    }
    print("")
}

// MARK: - Demo 3: Alert tones
func demoAlerts() {
    print("📌 Demo 3: Alert Tones")
    print("")
    
    // Beep
    print("   🔔 Single Beep:")
    print("      1000Hz × 200ms")
    // playTone(frequency: 1000, durationMs: 200)
    print("")
    
    // Double beep
    print("   🔔🔔 Double Beep:")
    print("      1000Hz × 100ms, pause, 1000Hz × 100ms")
    print("")
    
    // Siren
    print("   🚨 Siren (sweep frequency):")
    for freq in stride(from: 500, through: 2000, by: 300) {
        let bars = (freq - 500) / 75
        let bar = String(repeating: "~", count: bars)
        print("      \(freq)Hz \(bar)")
    }
    print("")
    
    // Error sound
    print("   ❌ Error (descending):")
    print("      800Hz → 600Hz → 400Hz → 200Hz")
    print("")
}

// MARK: - Demo 4: Mario coin sound
func demoMarioCoin() {
    print("📌 Demo 4: Mario Coin Sound 🪙")
    print("")
    print("   🎮 B5(988Hz, 100ms) → E6(1319Hz, 400ms)")
    print("      ♪ bing! ♪♪♪♪♪")
    print("")
}

// MARK: - Main Program
print("🔌 === Day 10: Melody Player (Buzzer) ===")
print("📌 Buzzer Pin: GP\(BUZZER_PIN) (Passive, PWM)")
print("📌 Type: Passive buzzer (cần tín hiệu PWM)")
print("")

demoScale()
demoTwinkle()
demoAlerts()
demoMarioCoin()

print("✅ Day 10 complete!")
print("📝 Next: Day 11 - UART Serial Communication")
