// ============================================
// Day 05 - Extra Examples
// Topic: Timer Applications
// ============================================

// MARK: - Example 1: Millis counter (like Arduino millis())
/// Đếm thời gian elapsed
func millisExample() {
    print("⏱️ Millis Counter (non-blocking timing):")
    print("")
    
    /*
    // Thực tế trên Pico:
    let startTime = to_ms_since_boot(get_absolute_time())
    
    while true {
        let currentTime = to_ms_since_boot(get_absolute_time())
        let elapsed = currentTime - startTime
        
        if elapsed % 1000 < 10 {
            print("Uptime: \(elapsed)ms")
        }
    }
    */
    
    // Mô phỏng uptime
    let timestamps: [UInt32] = [0, 1000, 2000, 5000, 10000, 60000]
    for t in timestamps {
        let seconds = t / 1000
        let minutes = seconds / 60
        let secs = seconds % 60
        print("   Uptime: \(t)ms = \(minutes)m \(secs)s")
    }
    print("")
}

// MARK: - Example 2: Multiple independent timers
func multipleTimers() {
    print("🔄 Multiple Independent Timers:")
    print("   Timer A: Blink LED mỗi 500ms")
    print("   Timer B: Đọc sensor mỗi 2000ms")
    print("   Timer C: In status mỗi 5000ms")
    print("")
    
    /*
    var timerA = repeating_timer_t()
    var timerB = repeating_timer_t()
    var timerC = repeating_timer_t()
    
    add_repeating_timer_ms(-500, blinkCallback, nil, &timerA)
    add_repeating_timer_ms(-2000, sensorCallback, nil, &timerB)
    add_repeating_timer_ms(-5000, statusCallback, nil, &timerC)
    */
    
    // Mô phỏng timeline
    let timeline: [(UInt32, String)] = [
        (500, "Timer A: LED toggle"),
        (1000, "Timer A: LED toggle"),
        (1500, "Timer A: LED toggle"),
        (2000, "Timer A: LED toggle + Timer B: Read sensor"),
        (2500, "Timer A: LED toggle"),
        (3000, "Timer A: LED toggle"),
        (3500, "Timer A: LED toggle"),
        (4000, "Timer A: LED toggle + Timer B: Read sensor"),
        (4500, "Timer A: LED toggle"),
        (5000, "Timer A: LED toggle + Timer C: Print status"),
    ]
    
    for (time, event) in timeline {
        print("   t=\(time)ms: \(event)")
    }
    print("")
}

// MARK: - Example 3: Watchdog-like timeout
func timeoutExample() {
    print("⏰ Timeout Detection:")
    print("   Nếu button không nhấn trong 5s → cảnh báo")
    print("")
    
    /*
    var lastActivityTime = to_ms_since_boot(get_absolute_time())
    let TIMEOUT_MS: UInt32 = 5000
    
    // Trong button callback:
    func buttonPressed() {
        lastActivityTime = to_ms_since_boot(get_absolute_time())
    }
    
    // Trong timer check:
    func checkTimeout() {
        let now = to_ms_since_boot(get_absolute_time())
        if now - lastActivityTime > TIMEOUT_MS {
            print("⚠️ TIMEOUT! No activity for 5s")
        }
    }
    */
    
    // Mô phỏng
    let events: [(UInt32, String)] = [
        (0, "🔘 Button pressed - Reset timer"),
        (2000, "🔘 Button pressed - Reset timer"),
        (3000, "🔘 Button pressed - Reset timer"),
        (8500, "⚠️ TIMEOUT! 5000ms since last press"),
        (9000, "🔘 Button pressed - Reset timer"),
    ]
    
    for (time, event) in events {
        print("   t=\(time)ms: \(event)")
    }
    print("")
}

// MARK: - Run examples
print("🔌 === Day 05: Extra Examples ===\n")
millisExample()
multipleTimers()
timeoutExample()
