// ============================================
// Day 29 - MQTTClient
// Topic: MQTT IoT Communication
// ============================================

print("🔌 === Day 29: MQTT Client ===")
print("📌 Broker: mqtt://broker.hivemq.com:1883")
print("📌 Protocol: MQTT v3.1.1")
print("")

// MARK: - MQTT Demo
print("📌 Demo: Publish & Subscribe")
print("")

print("   1. Connect to broker...")
print("   ✅ Connected! Client ID: pico_swift_001")
print("")

print("   2. Subscribe to topics:")
print("   ├── home/livingroom/light/set")
print("   ├── home/bedroom/fan/set")
print("   └── home/+/temperature")
print("")

print("   3. Publish sensor data:")
let topics: [(String, String)] = [
    ("home/livingroom/temperature", "{\"value\":25.3,\"unit\":\"C\"}"),
    ("home/livingroom/humidity", "{\"value\":65.2,\"unit\":\"%\"}"),
    ("home/status", "{\"online\":true,\"uptime\":3600}"),
]
for (topic, payload) in topics {
    print("   📤 PUBLISH \(topic)")
    print("      → \(payload)")
}
print("")

print("   4. Receive commands:")
let commands: [(String, String)] = [
    ("home/livingroom/light/set", "ON"),
    ("home/bedroom/fan/set", "OFF"),
]
for (topic, payload) in commands {
    print("   📥 RECEIVED \(topic) → \(payload)")
}
print("")

print("📌 MQTT QoS Levels:")
print("   QoS 0: At most once (fire & forget)")
print("   QoS 1: At least once (with ACK)")
print("   QoS 2: Exactly once (4-step handshake)")
print("")

print("✅ Day 29 complete!")
print("📝 Next: Day 30 - Final Project!")
