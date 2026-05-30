// ============================================
// Day 11 - SerialChat
// Topic: UART - Giao tiếp Serial
// ============================================

// MARK: - Configuration
let UART_ID = 0  // uart0
let BAUD_RATE: UInt32 = 115200
let TX_PIN: UInt32 = 0   // GP0
let RX_PIN: UInt32 = 1   // GP1

// MARK: - Setup
// uart_init(uart0, BAUD_RATE)
// gpio_set_function(TX_PIN, GPIO_FUNC_UART)
// gpio_set_function(RX_PIN, GPIO_FUNC_UART)
// uart_set_format(uart0, 8, 1, UART_PARITY_NONE)  // 8N1

// MARK: - UART Functions

func uartSend(_ message: String) {
    // uart_puts(uart0, message + "\r\n")
    print("   📤 TX: \"\(message)\"")
}

func uartReceive() -> String {
    // var buffer = ""
    // while uart_is_readable(uart0) {
    //     let c = Character(UnicodeScalar(uart_getc(uart0)))
    //     buffer.append(c)
    // }
    // return buffer
    return "simulated_input"
}

// MARK: - Demo 1: Basic Send
func demoBasicSend() {
    print("📌 Demo 1: Send Messages")
    print("")
    
    uartSend("Hello from Pico!")
    uartSend("UART0 at 115200 baud")
    uartSend("Swift Embedded is awesome!")
    print("")
}

// MARK: - Demo 2: Echo
func demoEcho() {
    print("📌 Demo 2: Echo (receive → send back)")
    print("")
    
    /*
    while true {
        if uart_is_readable(uart0) {
            let c = uart_getc(uart0)
            uart_putc(uart0, c)  // Echo back
        }
    }
    */
    
    let received = ["H", "e", "l", "l", "o"]
    for ch in received {
        print("   📥 RX: '\(ch)' → 📤 TX: '\(ch)'")
    }
    print("")
}

// MARK: - Demo 3: Command Parser
func demoCommandParser() {
    print("📌 Demo 3: Command Parser")
    print("   Commands: LED_ON, LED_OFF, BLINK, STATUS")
    print("")
    
    let commands = ["LED_ON", "STATUS", "BLINK", "LED_OFF", "UNKNOWN"]
    
    for cmd in commands {
        print("   📥 RX: \"\(cmd)\"", terminator: " → ")
        
        switch cmd {
        case "LED_ON":
            // gpio_put(LED_PIN, true)
            print("💡 LED ON")
        case "LED_OFF":
            // gpio_put(LED_PIN, false)
            print("⬛ LED OFF")
        case "BLINK":
            print("✨ Blink mode activated")
        case "STATUS":
            print("📊 Pico OK, uptime: 12345ms")
        default:
            print("❌ Unknown command: \(cmd)")
        }
    }
    print("")
}

// MARK: - Demo 4: Data Logger
func demoDataLogger() {
    print("📌 Demo 4: Sensor Data Logger via UART")
    print("   Format: CSV (timestamp, temperature, humidity)")
    print("")
    
    let data: [(UInt32, Float, Float)] = [
        (1000, 25.3, 65.2),
        (2000, 25.5, 64.8),
        (3000, 25.7, 64.5),
        (4000, 26.0, 63.9),
        (5000, 25.8, 64.1),
    ]
    
    uartSend("timestamp,temp_c,humidity_%")
    for (time, temp, hum) in data {
        let line = "\(time),\(String(format: "%.1f", temp)),\(String(format: "%.1f", hum))"
        uartSend(line)
    }
    print("")
}

// MARK: - Main Program
print("🔌 === Day 11: UART Serial Chat ===")
print("📌 UART0: TX=GP\(TX_PIN), RX=GP\(RX_PIN)")
print("📌 Baud Rate: \(BAUD_RATE)")
print("📌 Format: 8N1 (8 data, No parity, 1 stop)")
print("")

demoBasicSend()
demoEcho()
demoCommandParser()
demoDataLogger()

print("✅ Day 11 complete!")
print("📝 Next: Day 12 - I2C Communication")
