// Day 24 - Extra Examples

print("🔌 === Day 24: Extra Examples ===\n")

print("⏰ Clock Mechanism:")
print("   Second hand: 2048/60 = ~34 steps/second")
print("   Minute hand: 2048/3600 = ~0.57 steps/second")
print("")

print("🎯 Position Control:")
let positions = [0, 90, 180, 270, 45, 135]
for pos in positions {
    let steps = pos * 2048 / 360
    print("   Go to \(pos)° → \(steps) steps")
}
print("")
