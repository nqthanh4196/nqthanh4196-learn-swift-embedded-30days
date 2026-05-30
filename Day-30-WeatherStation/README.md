# Day 30 - Final Project: IoT Weather Station 🌤️

## 📖 Giới thiệu
Project cuối cùng kết hợp tất cả kiến thức 30 ngày: đọc sensors, hiển thị OLED, kết nối WiFi, push data lên cloud qua MQTT.

---

## 🎯 Features
1. **Sensors**: BMP280 (temp + pressure) + DHT22 (humidity)
2. **Display**: SSD1306 OLED hiển thị real-time
3. **Storage**: Flash data logger
4. **WiFi**: Pico W kết nối network
5. **Cloud**: MQTT publish sensor data
6. **Web**: HTTP dashboard local
7. **Alert**: Buzzer cảnh báo nhiệt độ cao

## Sơ đồ tổng thể
```
┌─────────────────────────────────────────────┐
│               Pico W (RP2040)               │
│                                              │
│  I2C0 ──── BMP280 (temp/pressure)           │
│  I2C0 ──── SSD1306 OLED                    │
│  GP15 ──── DHT22 (humidity)                 │
│  GP13 ──── Buzzer (alert)                   │
│  GP25 ──── Onboard LED (status)             │
│  WiFi ──── MQTT Broker (cloud)              │
│  WiFi ──── HTTP Server (dashboard)          │
│  Flash ──── Data Logger                      │
└─────────────────────────────────────────────┘
```

## Architecture
```
[Sensors] → [Read every 5s] → [Display on OLED]
                             → [Log to Flash]
                             → [MQTT Publish]
                             → [Serve via HTTP]
                             → [Check Alerts]
```

---

## 🏋️ Mở rộng
- Thêm Solar panel + battery monitoring
- OTA firmware update qua WiFi
- Multi-room sensors (MQTT network)
- Mobile app dashboard
