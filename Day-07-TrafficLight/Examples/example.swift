// ============================================
// Day 07 - Extra Examples
// ============================================

// MARK: - Example 1: Intersection with 2 directions
func intersectionDemo() {
    print("🚗 4-Way Intersection:")
    print("")
    
    struct Direction {
        let name: String
        var red: Bool
        var yellow: Bool
        var green: Bool
    }
    
    let phases: [(String, Direction, Direction)] = [
        ("Phase 1", Direction(name: "N-S", red: false, yellow: false, green: true),
                    Direction(name: "E-W", red: true, yellow: false, green: false)),
        ("Phase 2", Direction(name: "N-S", red: false, yellow: true, green: false),
                    Direction(name: "E-W", red: true, yellow: false, green: false)),
        ("Phase 3", Direction(name: "N-S", red: true, yellow: false, green: false),
                    Direction(name: "E-W", red: false, yellow: false, green: true)),
        ("Phase 4", Direction(name: "N-S", red: true, yellow: false, green: false),
                    Direction(name: "E-W", red: false, yellow: true, green: false)),
    ]
    
    for (phase, ns, ew) in phases {
        let nsR = ns.red ? "🔴" : "⬛"
        let nsY = ns.yellow ? "🟡" : "⬛"
        let nsG = ns.green ? "🟢" : "⬛"
        let ewR = ew.red ? "🔴" : "⬛"
        let ewY = ew.yellow ? "🟡" : "⬛"
        let ewG = ew.green ? "🟢" : "⬛"
        
        print("   \(phase): N-S[\(nsR)\(nsY)\(nsG)] E-W[\(ewR)\(ewY)\(ewG)]")
    }
    print("")
}

// MARK: - Example 2: Countdown display
func countdownDemo() {
    print("⏱️ Countdown Timer Display:")
    print("")
    
    let greenTime = 4
    let yellowTime = 2
    let redTime = 5
    
    print("   🟢 GREEN countdown:")
    for i in stride(from: greenTime, through: 1, by: -1) {
        print("   \(i)... 🟢")
    }
    print("   🟡 YELLOW countdown:")
    for i in stride(from: yellowTime, through: 1, by: -1) {
        print("   \(i)... 🟡")
    }
    print("   🔴 RED countdown:")
    for i in stride(from: redTime, through: 1, by: -1) {
        print("   \(i)... 🔴")
    }
    print("")
}

// MARK: - Example 3: Emergency override
func emergencyOverride() {
    print("🚨 Emergency Vehicle Override:")
    print("")
    
    let timeline: [(String, String)] = [
        ("Normal operation", "N-S: 🟢 | E-W: 🔴"),
        ("🚨 Emergency detected!", "All: 🔴 (clear intersection)"),
        ("Emergency passing", "Emergency route: 🟢 | Others: 🔴"),
        ("Emergency passed", "All: 🔴 (2s safety)"),
        ("Resume normal", "N-S: 🟢 | E-W: 🔴"),
    ]
    
    for (event, state) in timeline {
        print("   [\(event)]")
        print("   → \(state)")
        print("")
    }
}

// MARK: - Run Examples
print("🔌 === Day 07: Extra Examples ===\n")
intersectionDemo()
countdownDemo()
emergencyOverride()
