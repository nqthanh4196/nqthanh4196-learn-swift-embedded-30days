// ============================================
// Day 21 - Extra Examples
// ============================================

print("🔌 === Day 21: Extra Examples ===\n")

print("🌡️ Heat Index Calculation:")
let temp: Float = 30.0
let hum: Float = 80.0
// Simplified heat index formula
let hi = -8.785 + 1.611*temp + 2.339*hum - 0.146*temp*hum
print("   Temp: \(temp)°C, Humidity: \(hum)%")
print("   Heat Index: \(String(format: "%.1f", hi))°C")
print("   Feels MUCH hotter than actual temp!")
print("")

print("💧 Dew Point Calculation:")
print("   Formula: Td = T - (100-RH)/5")
let dewPoint = temp - (100 - hum) / 5
print("   At \(temp)°C, \(hum)%RH → Dew point: \(String(format: "%.1f", dewPoint))°C")
print("")

print("⏱️ DHT Timing Critical Section:")
print("   Must disable interrupts during read!")
print("   Total read time: ~4ms")
print("   Bit timing resolution: ~1µs needed")
print("   Alternative: Use PIO for precise timing!")
print("")
