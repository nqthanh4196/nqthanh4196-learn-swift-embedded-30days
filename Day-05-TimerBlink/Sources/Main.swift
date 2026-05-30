// ============================================
// Day 05 - TimerBlink
// Topic: Timer & Interrupts
// ============================================

// MARK: - Pin Configuration
let LED_PIN: UInt32 = 25
let BUTTON_PIN: UInt32 = 14

// MARK: - State Variables
var ledState = false
var blinkInterval: Int32 = 500  // ms

// MARK: - Timer Callback (mô phỏng)
/// Được gọi tự động bởi hardware timer mỗi `blinkInterval` ms
func timerCallback() {
    ledState.toggle()
    // gpio_put(LED_PIN, ledState)
    let state = ledState ? "🟡 ON" : "⬛ OFF"
    print("   ⏱️ Timer fired → LED: \(state)")
}

// MARK: - GPIO Interrupt Callback (mô phỏng)
/// Được gọi khi button có falling edge (pressed)
func buttonInterruptCallback(gpio: UInt32, events: UInt32) {
    print("   ⚡ IRQ on GP\(gpio) - Button pressed!")
}

// MARK: - Demo 1: Repeating Timer
func demoRepeatingTimer() {
    print("📌 Demo 1: Repeating Timer")
    print("   Interval: \(blinkInterval)ms")
    print("   (Non-blocking - CPU free giữa các lần toggle)")
    print("")
    
    /*
    // Thực tế:
    var timer = repeating_timer_t()
    add_repeating_timer_ms(-blinkInterval, { rt in
        ledState.toggle()
        gpio_put(LED_PIN, ledState)
        return true
    }, nil, &timer)
    
    // CPU có thể làm việc khác ở đây!
    while true {
        // Do other work...
        tight_loop_contents()
    }
    */
    
    // Mô phỏng 6 lần timer fire
    for i in 1...6 {
        print("   [t=\(i * Int(blinkInterval))ms]", terminator: " ")
        timerCallback()
    }
    print("")
}

// MARK: - Demo 2: Button Interrupt
func demoButtonInterrupt() {
    print("📌 Demo 2: GPIO Interrupt (Button)")
    print("   Trigger: Falling edge (pull-up, nhấn = LOW)")
    print("")
    
    /*
    // Thực tế:
    gpio_set_irq_enabled_with_callback(
        BUTTON_PIN,
        GPIO_IRQ_EDGE_FALL,
        true,
        buttonInterruptCallback
    )
    */
    
    // Mô phỏng interrupt events
    let events = ["EDGE_FALL", "EDGE_FALL", "EDGE_FALL"]
    for (i, event) in events.enumerated() {
        print("   [\(i + 1)] GPIO \(BUTTON_PIN): \(event)")
        buttonInterruptCallback(gpio: BUTTON_PIN, events: 0x04)
    }
    print("")
}

// MARK: - Demo 3: Alarm (One-shot)
func demoAlarm() {
    print("📌 Demo 3: Alarm (One-shot Timer)")
    print("   LED ON ngay lập tức, tự tắt sau 3 giây")
    print("")
    
    /*
    // Thực tế:
    gpio_put(LED_PIN, true)
    add_alarm_in_ms(3000, { id, userData in
        gpio_put(LED_PIN, false)
        return 0  // Không repeat
    }, nil, false)
    */
    
    print("   t=0ms     → LED ON  🟡")
    print("   t=3000ms  → Alarm fires! LED OFF ⬛")
    print("")
}

// MARK: - Demo 4: Variable speed blink
func demoVariableSpeed() {
    print("📌 Demo 4: Variable Speed (Button changes interval)")
    print("")
    
    let speeds: [Int32] = [1000, 500, 250, 100, 50]
    let labels = ["Very Slow", "Normal", "Fast", "Very Fast", "Ultra Fast"]
    
    for (i, speed) in speeds.enumerated() {
        print("   Press #\(i + 1) → \(labels[i]) (\(speed)ms)")
        // cancel_repeating_timer(&timer)
        // blinkInterval = speed
        // add_repeating_timer_ms(-speed, callback, nil, &timer)
    }
    print("")
}

// MARK: - Main Program
print("🔌 === Day 05: Timer & Interrupts ===")
print("📌 LED: GP\(LED_PIN)")
print("📌 Button: GP\(BUTTON_PIN)")
print("")

demoRepeatingTimer()
demoButtonInterrupt()
demoAlarm()
demoVariableSpeed()

print("✅ Day 05 complete!")
print("📝 Next: Day 06 - Debounce & State Machine")
