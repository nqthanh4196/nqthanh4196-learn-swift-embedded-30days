// ============================================
// Day 22 - Extra Examples
// ============================================

print("🔌 === Day 22: Extra Examples ===\n")

print("🚨 Parking Sensor (distance → beep rate):")
let distances = [200, 100, 50, 30, 15, 5]
for d in distances {
    let beepRate: String
    if d > 100 { beepRate = "🔇 Silent" }
    else if d > 50 { beepRate = "🔔 Slow beep (1Hz)" }
    else if d > 20 { beepRate = "🔔🔔 Fast beep (5Hz)" }
    else { beepRate = "🔔🔔🔔 Continuous!" }
    print("   \(String(format: "%3d", d))cm → \(beepRate)")
}
print("")

print("📐 Median Filter (remove outliers):")
print("   Raw: [25, 24, 26, 95, 25, 24, 26]")
print("   Sorted: [24, 24, 25, 25, 26, 26, 95]")
print("   Median: 25cm ← outlier (95) removed!")
print("")
