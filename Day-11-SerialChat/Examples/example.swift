// ============================================
// Day 11 - Extra Examples
// ============================================

// MARK: - Example 1: UART with FIFO & Interrupt
func uartInterruptDemo() {
    print("⚡ UART with RX Interrupt:")
    print("")
    
    /*
    // Enable UART RX interrupt
    irq_set_exclusive_handler(UART0_IRQ, uartRxHandler)
    irq_set_enabled(UART0_IRQ, true)
    uart_set_irq_enables(uart0, true, false)  // RX interrupt ON, TX OFF
    
    func uartRxHandler() {
        while uart_is_readable(uart0) {
            let ch = uart_getc(uart0)
            rxBuffer.append(ch)
            if ch == UInt8(ascii: "\n") {
                processCommand(rxBuffer)
                rxBuffer.removeAll()
            }
        }
    }
    */
    
    print("   1. Characters arrive → stored in buffer")
    print("   2. When '\\n' received → process command")
    print("   3. CPU free between characters (non-blocking)")
    print("")
    
    let timeline: [(String, String)] = [
        ("Char 'L'", "Buffer: [L]"),
        ("Char 'E'", "Buffer: [L,E]"),
        ("Char 'D'", "Buffer: [L,E,D]"),
        ("Char '\\n'", "→ Process 'LED' command!"),
    ]
    
    for (event, state) in timeline {
        print("   📥 \(event) → \(state)")
    }
    print("")
}

// MARK: - Example 2: GPS NMEA Parser
func gpsParserDemo() {
    print("🛰️ GPS NMEA Parser (UART):")
    print("   GPS module sends NMEA sentences at 9600 baud")
    print("")
    
    let nmea = "$GPGGA,123519,4807.038,N,01131.000,E,1,08,0.9,545.4,M,47.0,M,,*47"
    print("   Raw: \(nmea)")
    print("")
    print("   Parsed:")
    print("   ├── Time: 12:35:19 UTC")
    print("   ├── Lat: 48°07.038' N")
    print("   ├── Lon: 011°31.000' E")
    print("   ├── Fix: 1 (GPS fix)")
    print("   ├── Satellites: 8")
    print("   └── Altitude: 545.4m")
    print("")
}

// MARK: - Example 3: AT Command interface (Bluetooth/WiFi)
func atCommandDemo() {
    print("📡 AT Command Interface (HC-05 Bluetooth):")
    print("")
    
    let commands: [(String, String)] = [
        ("AT", "OK"),
        ("AT+NAME?", "+NAME:PicoBT"),
        ("AT+BAUD?", "+BAUD:115200"),
        ("AT+NAME=SwiftPico", "OK"),
        ("AT+PIN=1234", "OK"),
    ]
    
    for (cmd, response) in commands {
        print("   📤 TX: \"\(cmd)\"")
        print("   📥 RX: \"\(response)\"")
        print("")
    }
}

// MARK: - Run Examples
print("🔌 === Day 11: Extra Examples ===\n")
uartInterruptDemo()
gpsParserDemo()
atCommandDemo()
