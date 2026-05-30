// ============================================
// Day 27 - WiFiClient
// Topic: WiFi với Pico W - HTTP Request
// ============================================

print("🔌 === Day 27: WiFi Client (Pico W) ===")
print("📌 Chip: CYW43439 (WiFi + Bluetooth)")
print("📌 Standard: 802.11b/g/n (2.4GHz)")
print("")

// MARK: - WiFi Connection
func demoWiFiConnect() {
    print("📌 Demo 1: WiFi Connection")
    print("")
    
    /*
    cyw43_arch_init()
    cyw43_arch_enable_sta_mode()
    
    let result = cyw43_arch_wifi_connect_timeout_ms(
        "MyNetwork", "password123",
        CYW43_AUTH_WPA2_AES_PSK, 10000
    )
    
    if result == 0 {
        // Connected!
        let ip = cyw43_state.netif[0].ip_addr
        print("Connected! IP: \(ip)")
    }
    */
    
    print("   Scanning networks...")
    print("   ├── MyNetwork (RSSI: -45) 🟢")
    print("   ├── Neighbor_WiFi (RSSI: -72) 🟡")
    print("   └── IoT_Network (RSSI: -80) 🔴")
    print("")
    print("   Connecting to 'MyNetwork'...")
    print("   ✅ Connected!")
    print("   IP: 192.168.1.105")
    print("   Gateway: 192.168.1.1")
    print("   DNS: 8.8.8.8")
    print("")
}

// MARK: - HTTP GET
func demoHTTPGet() {
    print("📌 Demo 2: HTTP GET Request")
    print("")
    print("   GET http://api.open-meteo.com/v1/forecast?lat=10.8&lon=106.6")
    print("")
    print("   Response (200 OK):")
    print("   {")
    print("     \"temperature\": 32.5,")
    print("     \"humidity\": 75,")
    print("     \"weather\": \"partly_cloudy\"")
    print("   }")
    print("")
}

// MARK: - HTTP POST
func demoHTTPPost() {
    print("📌 Demo 3: HTTP POST (Send sensor data)")
    print("")
    print("   POST http://api.thingspeak.com/update")
    print("   Body: field1=25.3&field2=65.2")
    print("")
    print("   Response: 201 Created")
    print("   → Sensor data uploaded to cloud! ☁️")
    print("")
}

demoWiFiConnect()
demoHTTPGet()
demoHTTPPost()

print("✅ Day 27 complete!")
print("📝 Next: Day 28 - Web Server on Pico W")
