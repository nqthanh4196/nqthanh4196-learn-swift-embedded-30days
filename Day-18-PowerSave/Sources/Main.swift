// ============================================
// Day 18 - PowerSave
// Topic: Watchdog Timer & Power Management
// ============================================

print("🔌 === Day 18: Watchdog & Power Management ===")
print("")

// MARK: - Watchdog Demo
func demoWatchdog() {
    print("📌 Demo 1: Watchdog Timer")
    print("   Timeout: 2000ms")
    print("")
    
    // watchdog_enable(2000, true)
    
    let events: [(UInt32, String, Bool)] = [
        (0, "Start - watchdog enabled", true),
        (500, "Working... feed watchdog", true),
        (1000, "Working... feed watchdog", true),
        (1500, "Working... feed watchdog", true),
        (2000, "Still working... feed watchdog", true),
        (2500, "⚠️ Bug! Infinite loop starts...", false),
        (4500, "💀 WATCHDOG RESET! (2s without feed)", false),
    ]
    
    for (time, event, fed) in events {
        let icon = fed ? "🐕 Fed" : "❌ Not fed"
        print("   t=\(String(format: "%4d", time))ms: \(event) [\(icon)]")
    }
    print("")
}

// MARK: - Sleep Mode Demo
func demoSleep() {
    print("📌 Demo 2: Sleep Modes")
    print("")
    print("   Mode     | Current | Wake Source")
    print("   ---------|---------|------------------")
    print("   Active   | ~25mA   | -")
    print("   Sleep    | ~2mA    | Timer, GPIO, UART")
    print("   Dormant  | ~0.18mA | GPIO edge only")
    print("")
    
    /*
    // Sleep until GPIO interrupt
    gpio_set_dormant_irq_enabled(BUTTON_PIN, GPIO_IRQ_EDGE_FALL, true)
    sleep_goto_sleep_until_edge(BUTTON_PIN, GPIO_IRQ_EDGE_FALL)
    // ... Pico sleeps here ...
    // Wakes up when button pressed!
    */
    
    print("   Battery Life Estimate (2000mAh):")
    print("   ├── Always Active: ~80 hours")
    print("   ├── Sleep + wake every 1s: ~1000 hours")
    print("   └── Dormant + GPIO wake: ~11000 hours!")
    print("")
}

// MARK: - Power Optimization Tips
func demoOptimization() {
    print("📌 Demo 3: Power Optimization Tips")
    print("")
    print("   1. Disable unused peripherals")
    print("   2. Lower clock speed when possible")
    print("   3. Use sleep between sensor readings")
    print("   4. Disable second core if not used")
    print("   5. Use dormant mode for rare wake events")
    print("")
}

demoWatchdog()
demoSleep()
demoOptimization()

print("✅ Day 18 complete!")
print("📝 Next: Day 19 - Flash Storage")
