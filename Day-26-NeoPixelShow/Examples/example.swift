// Day 26 - Extra Examples

print("🔌 === Day 26: Extra Examples ===\n")

print("🌈 Color Wheel (HSV → RGB):")
print("   Hue 0° = Red, 120° = Green, 240° = Blue")
for h in stride(from: 0, through: 360, by: 60) {
    let name: String
    switch h {
    case 0: name = "🔴 Red"
    case 60: name = "🟡 Yellow"
    case 120: name = "🟢 Green"
    case 180: name = "🔵 Cyan"
    case 240: name = "🔵 Blue"
    case 300: name = "🟣 Magenta"
    default: name = "🔴 Red"
    }
    print("   Hue \(String(format: "%3d", h))° → \(name)")
}
print("")

print("✨ Fire Effect:")
print("   Random orange/red/yellow flickering")
print("   Each LED: base_color + random_variation")
print("")
