// ============================================
// Day 16 - Extra Examples: Scrolling text, animations
// ============================================

func scrollTextDemo() {
    print("📜 Scrolling Text on 8x8 Matrix:")
    print("   Text shifts left each frame")
    print("")
    
    let frames = [
        "H·······",
        "·H·e····",
        "··H·e·l·",
        "···H·e·l",
        "····H·e·",
    ]
    for (i, frame) in frames.enumerated() {
        print("   Frame \(i): |\(frame)|")
    }
    print("")
}

func animationDemo() {
    print("🎮 Bouncing Ball Animation:")
    print("")
    
    let positions = [(0,0), (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (6,6), (5,5)]
    for (i, (x, y)) in positions.enumerated() {
        var grid = [[String]](repeating: [String](repeating: "⬛", count: 8), count: 8)
        grid[y][x] = "🟡"
        print("   Frame \(i): ", terminator: "")
        for col in grid[y] { print(col, terminator: "") }
        print(" (y=\(y))")
    }
    print("")
}

print("🔌 === Day 16: Extra Examples ===\n")
scrollTextDemo()
animationDemo()
