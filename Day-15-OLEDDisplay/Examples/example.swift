// ============================================
// Day 15 - Extra Examples
// ============================================

// MARK: - Example 1: Simple font rendering
func fontDemo() {
    print("🔤 5x7 Font Rendering:")
    print("")
    
    // 5x7 font for character 'A'
    let fontA: [UInt8] = [0x7E, 0x11, 0x11, 0x11, 0x7E]
    
    print("   Character 'A' (5x7):")
    for row in 0..<7 {
        print("   ", terminator: "")
        for col in 0..<5 {
            let pixel = (fontA[col] >> row) & 1
            print(pixel == 1 ? "██" : "  ", terminator: "")
        }
        print("")
    }
    print("")
}

// MARK: - Example 2: Real-time chart
func chartDemo() {
    print("📈 Real-time Temperature Chart:")
    print("")
    
    let data: [Int] = [22, 23, 24, 25, 27, 28, 26, 25, 24, 23, 25, 26, 28, 30, 29, 27]
    let minVal = 20
    let maxVal = 32
    let height = 8
    
    // Y-axis labels
    for row in stride(from: height, through: 0, by: -1) {
        let tempValue = minVal + row * (maxVal - minVal) / height
        print("   \(String(format: "%2d", tempValue))°│", terminator: "")
        
        for value in data {
            let normalized = (value - minVal) * height / (maxVal - minVal)
            if normalized >= row {
                print("▓", terminator: "")
            } else {
                print(" ", terminator: "")
            }
        }
        print("")
    }
    print("      └" + String(repeating: "─", count: data.count))
    print("       Time →")
    print("")
}

// MARK: - Example 3: Animated progress bar
func progressBarDemo() {
    print("⏳ Progress Bar on OLED:")
    print("")
    
    for percent in stride(from: 0, through: 100, by: 10) {
        let filled = percent / 5
        let empty = 20 - filled
        let bar = String(repeating: "█", count: filled) + String(repeating: "░", count: empty)
        print("   [\(bar)] \(String(format: "%3d", percent))%")
    }
    print("")
}

// MARK: - Run Examples
print("🔌 === Day 15: Extra Examples ===\n")
fontDemo()
chartDemo()
progressBarDemo()
