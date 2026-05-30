# Day 27 - WiFi với Pico W: HTTP Request

## 📖 Giới thiệu
Pico W có chip CYW43439 hỗ trợ WiFi 802.11n. Kết nối mạng, gửi HTTP request lấy data từ internet.

## 🎯 Kiến thức chính
- Pico W WiFi: 2.4GHz, 802.11b/g/n
- TCP/IP stack: lwIP
- Cần `pico_cyw43_arch_lwip_threadsafe_background`
- Connect → DNS resolve → TCP connect → HTTP request

## Code flow
```swift
cyw43_arch_init()
cyw43_arch_enable_sta_mode()
cyw43_arch_wifi_connect_blocking(ssid, password, auth)
// Now connected! Make HTTP requests...
```

## 🏋️ Challenge
1. Connect to WiFi, print IP address
2. HTTP GET request to a REST API
3. Parse JSON response
