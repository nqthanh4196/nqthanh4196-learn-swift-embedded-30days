// ============================================
// Day 10 - Extra Examples
// ============================================

// MARK: - Example 1: RTTTL Parser (Ring Tone Transfer Language)
func rtttlDemo() {
    print("📱 RTTTL Ringtone Format:")
    print("   Format: name:d=4,o=5,b=120:notes")
    print("")
    
    print("   Nokia Tune: ")
    print("   'NokiaTune:d=4,o=5,b=120:e,d,8f#4,8g#4,c#,b4,8d4,8e4,b4,a4,8c#4,8e4,a4'")
    print("")
    print("   Parsed notes:")
    
    let notes: [(String, Int, Int)] = [
        ("E5", 330, 250), ("D5", 294, 250), ("F#4", 185, 125),
        ("G#4", 208, 125), ("C#5", 277, 250), ("B4", 247, 250),
    ]
    
    for (name, freq, dur) in notes {
        print("   \(name) → \(freq)Hz × \(dur)ms")
    }
    print("")
}

// MARK: - Example 2: Theremin (potentiometer → pitch)
func thereminDemo() {
    print("🎹 Theremin (ADC → Frequency):")
    print("   Potentiometer on GP26 controls pitch")
    print("")
    
    let adcValues: [UInt16] = [0, 500, 1000, 2000, 3000, 4095]
    
    print("   ADC  | Freq   | Sound")
    print("   -----|--------|------")
    for adc in adcValues {
        // Map ADC (0-4095) to frequency (200-2000 Hz)
        let freq = 200 + Int(Float(adc) / 4095.0 * 1800.0)
        let bars = freq / 100
        let bar = String(repeating: "~", count: min(bars, 20))
        print("   \(String(format: "%4d", adc)) | \(String(format: "%4d", freq))Hz | \(bar)")
    }
    print("")
}

// MARK: - Example 3: Sound effects
func soundEffects() {
    print("🎮 Game Sound Effects:")
    print("")
    
    print("   🪙 Coin: B5→E6 (quick ascending)")
    print("   💀 Death: 400→200Hz (slow descending)")
    print("   ⬆️ Power-up: 500→1500Hz (sweep up)")
    print("   🏆 Victory: C-E-G-C' (arpeggio)")
    print("   💥 Explosion: White noise (random freq)")
    print("")
    
    // Explosion simulation (random frequencies)
    print("   💥 Explosion pattern:")
    let freqs = [1500, 800, 1200, 300, 900, 400, 1100, 200, 600, 100]
    for freq in freqs {
        let bars = freq / 100
        let bar = String(repeating: "▓", count: bars)
        print("      \(freq)Hz \(bar)")
    }
    print("")
}

// MARK: - Run Examples
print("🔌 === Day 10: Extra Examples ===\n")
rtttlDemo()
thereminDemo()
soundEffects()
