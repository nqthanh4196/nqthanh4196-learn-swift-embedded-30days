# Day 29 - MQTT: IoT Communication

## 📖 Giới thiệu
MQTT là protocol nhẹ cho IoT, dùng mô hình Publish/Subscribe. Phù hợp cho thiết bị embedded với bandwidth thấp.

## 🎯 MQTT Concepts
- **Broker**: Server trung gian (e.g., Mosquitto, HiveMQ)
- **Publisher**: Gửi message tới topic
- **Subscriber**: Nhận message từ topic
- **Topic**: Đường dẫn phân cấp (home/room/sensor)
- **QoS**: 0 (fire&forget), 1 (at-least-once), 2 (exactly-once)

## 🏋️ Challenge
1. Connect to public MQTT broker
2. Publish temperature mỗi 10 giây
3. Subscribe nhận lệnh điều khiển LED
