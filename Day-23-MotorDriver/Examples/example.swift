// Day 23 - Extra Examples

print("🔌 === Day 23: Extra Examples ===\n")

print("🏎️ Smooth Acceleration:")
print("   Ramp up 0% → 100% in 2 seconds")
for speed in stride(from: 0, through: 100, by: 20) {
    let bar = String(repeating: "▓", count: speed / 5)
    let space = String(repeating: "░", count: 20 - speed / 5)
    print("   [\(bar)\(space)] \(speed)%")
}
print("")

print("🤖 Tank Drive (2 motors):")
print("   Left Motor + Right Motor = Movement")
print("   100% + 100% = Forward")
print("   -100% + -100% = Reverse")
print("   100% + -100% = Spin Right")
print("   50% + 100% = Turn Left")
print("")
