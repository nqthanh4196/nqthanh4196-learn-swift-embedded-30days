// ============================================
// Day 01 - HelloPico
// Topic: Giới thiệu Swift Embedded & Setup
// ============================================

// Import Pico SDK bridging headers
// Trong thực tế, cần BridgingHeader.h để import C functions

// MARK: - Cấu trúc cơ bản của chương trình Swift Embedded

/// Entry point cho Raspberry Pi Pico
/// Không có `main()` function truyền thống
/// Swift Embedded sử dụng @main attribute hoặc top-level code

// MARK: - 1. Khởi tạo hệ thống
// stdio_init_all()  // Khởi tạo UART/USB cho debug output

// MARK: - 2. Cấu hình GPIO cho onboard LED (GP25)
let LED_PIN: UInt32 = 25

// gpio_init(LED_PIN)
// gpio_set_dir(LED_PIN, GPIO_OUT)

// MARK: - 3. Main loop
// Trong embedded, chương trình chạy mãi mãi
// while true {
//     gpio_put(LED_PIN, true)
//     sleep_ms(500)
//     gpio_put(LED_PIN, false)
//     sleep_ms(500)
// }

// MARK: - Pseudo-code minh họa cấu trúc

/// Mô phỏng cấu trúc chương trình Embedded Swift cho Pico
struct PicoApp {
    static let ledPin: UInt32 = 25
    
    /// Khởi tạo phần cứng
    static func setup() {
        // gpio_init(ledPin)
        // gpio_set_dir(ledPin, GPIO_OUT)
        print("✅ Pico initialized!")
        print("📌 LED Pin: GP\(ledPin)")
    }
    
    /// Vòng lặp chính - chạy vô hạn
    static func loop() {
        // gpio_put(ledPin, true)   // Bật LED
        // sleep_ms(1000)           // Đợi 1 giây
        // gpio_put(ledPin, false)  // Tắt LED
        // sleep_ms(1000)           // Đợi 1 giây
        print("💡 LED ON")
        print("💡 LED OFF")
    }
}

// Entry point
print("🔌 === Day 01: Hello Pico! ===")
print("")
print("📋 RP2040 Specs:")
print("   CPU: Dual-core ARM Cortex-M0+ @ 133MHz")
print("   RAM: 264KB SRAM")
print("   Flash: 2MB")
print("   GPIO: 26 pins")
print("")

PicoApp.setup()
print("")
print("🔄 Starting main loop...")
PicoApp.loop()
print("")
print("✅ Setup complete! Ready for Day 02 - Blink LED")
