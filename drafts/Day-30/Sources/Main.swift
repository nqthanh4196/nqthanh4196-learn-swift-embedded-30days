// ============================================
// Day 30 - WeatherStation
// Topic: Final Project - IoT Weather Station
// ============================================

print("🔌 === Day 30: FINAL PROJECT ===")
print("🌤️ IoT Weather Station")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("")

// MARK: - System Architecture
print("📌 System Components:")
print("   ├── BMP280 (I2C) → Temperature + Pressure")
print("   ├── DHT22 (GPIO) → Humidity")
print("   ├── SSD1306 OLED (I2C) → Display")
print("   ├── Buzzer (PWM) → Alerts")
print("   ├── Flash Storage → Data Logger")
print("   ├── WiFi (CYW43) → Network")
print("   ├── MQTT Client → Cloud Push")
print("   └── HTTP Server → Local Dashboard")
print("")

// MARK: - Configuration
struct WeatherConfig {
    static let sensorInterval: UInt32 = 5000  // 5s
    static let mqttInterval: UInt32 = 30000    // 30s
    static let logInterval: UInt32 = 60000     // 1min
    static let alertTempHigh: Float = 35.0
    static let alertTempLow: Float = 10.0
    static let wifiSSID = "MyNetwork"
    static let mqttBroker = "broker.hivemq.com"
    static let mqttTopic = "weather/pico/station1"
}

// MARK: - Sensor Data
struct SensorData {
    var temperature: Float = 0
    var humidity: Float = 0
    var pressure: Float = 0
    var timestamp: UInt32 = 0
    
    var altitude: Float {
        return 44330.0 * (1.0 - pow(pressure / 1013.25, 0.1903))
    }
}

// MARK: - Startup Sequence
func startupSequence() {
    print("📌 Startup Sequence:")
    print("   [1/7] ⏳ Init GPIO & Peripherals... ✅")
    print("   [2/7] ⏳ Init I2C (BMP280 + OLED)... ✅")
    print("   [3/7] ⏳ Init DHT22... ✅")
    print("   [4/7] ⏳ Init Flash Logger... ✅")
    print("   [5/7] ⏳ Connect WiFi... ✅ (192.168.1.105)")
    print("   [6/7] ⏳ Connect MQTT... ✅ (broker.hivemq.com)")
    print("   [7/7] ⏳ Start HTTP Server... ✅ (port 80)")
    print("")
    print("   🟢 All systems GO!")
    print("")
}

// MARK: - Main Loop Simulation
func mainLoop() {
    print("📌 Main Loop (running every \(WeatherConfig.sensorInterval/1000)s):")
    print("")
    
    let readings: [SensorData] = [
        SensorData(temperature: 25.3, humidity: 65.2, pressure: 1013.2, timestamp: 5000),
        SensorData(temperature: 25.5, humidity: 64.8, pressure: 1013.1, timestamp: 10000),
        SensorData(temperature: 25.8, humidity: 64.5, pressure: 1013.0, timestamp: 15000),
        SensorData(temperature: 26.1, humidity: 63.9, pressure: 1012.9, timestamp: 20000),
        SensorData(temperature: 36.0, humidity: 60.0, pressure: 1012.5, timestamp: 25000),
    ]
    
    for data in readings {
        let timeStr = String(format: "%02d:%02d", data.timestamp / 60000, (data.timestamp / 1000) % 60)
        print("   [\(timeStr)] Temp:\(String(format: "%.1f", data.temperature))°C Hum:\(String(format: "%.1f", data.humidity))% Press:\(String(format: "%.1f", data.pressure))hPa", terminator: "")
        
        if data.temperature > WeatherConfig.alertTempHigh {
            print(" 🚨 HIGH TEMP ALERT!")
        } else {
            print(" ✅")
        }
    }
    print("")
}

// MARK: - OLED Display
func oledDisplay() {
    print("📌 OLED Display:")
    print("   ┌────────────────────────────────┐")
    print("   │ 🌤️ Weather Station     12:35  │")
    print("   │━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━│")
    print("   │ Temp:     25.3 °C              │")
    print("   │ Humidity: 65.2 %               │")
    print("   │ Pressure: 1013.2 hPa           │")
    print("   │ Altitude: 0.3 m                │")
    print("   │━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━│")
    print("   │ WiFi: ✅  MQTT: ✅  Log: 342  │")
    print("   └────────────────────────────────┘")
    print("")
}

// MARK: - MQTT Publish
func mqttPublish() {
    print("📌 MQTT Publish:")
    print("   Topic: \(WeatherConfig.mqttTopic)")
    print("   Payload: {")
    print("     \"temp\": 25.3,")
    print("     \"humidity\": 65.2,")
    print("     \"pressure\": 1013.2,")
    print("     \"altitude\": 0.3,")
    print("     \"battery\": 98,")
    print("     \"uptime\": 3600")
    print("   }")
    print("")
}

// MARK: - Summary
func printSummary() {
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("🎉 CONGRATULATIONS!")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("")
    print("🏆 Bạn đã hoàn thành 30 ngày học Embedded Swift!")
    print("")
    print("📚 Kiến thức đã học:")
    print("   Week 1: GPIO, PWM, Timer, State Machine")
    print("   Week 2: ADC, Servo, Buzzer, UART, I2C, SPI")
    print("   Week 3: Sensors, OLED, DMA, Flash, PIO")
    print("   Week 4: Motors, WiFi, Web Server, MQTT, IoT")
    print("")
    print("🚀 Next Steps:")
    print("   • FreeRTOS trên Pico (multi-tasking)")
    print("   • Bluetooth Low Energy (BLE)")
    print("   • Custom PCB design")
    print("   • OTA firmware updates")
    print("   • Machine Learning on edge (TFLite Micro)")
    print("")
    print("Happy Embedded Coding! 🔌⚡🤖")
}

// MARK: - Main
startupSequence()
mainLoop()
oledDisplay()
mqttPublish()
printSummary()
