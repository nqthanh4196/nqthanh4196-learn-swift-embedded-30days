# 🔌 Learn Embedded Swift in 30 Days - Plan

## Overview
Mỗi ngày 1 bài học, từ cơ bản đến nâng cao, lập trình Embedded bằng Swift trên Raspberry Pi Pico (RP2040).

---

## Week 1: Cơ bản GPIO & Digital I/O

| Day | Topic | Project |
|-----|-------|---------|
| 01 | Giới thiệu Swift Embedded & Setup môi trường | HelloPico |
| 02 | GPIO Output - Blink LED | BlinkLED |
| 03 | GPIO Input - Đọc nút nhấn | ButtonRead |
| 04 | PWM - Điều khiển độ sáng LED | LEDDimmer |
| 05 | Timer & Interrupts | TimerBlink |
| 06 | Debounce Button & State Machine | ButtonStateMachine |
| 07 | Multiple LEDs - Traffic Light | TrafficLight |

## Week 2: Analog & Actuators

| Day | Topic | Project |
|-----|-------|---------|
| 08 | Analog Input (ADC) - Đọc cảm biến | AnalogRead |
| 09 | PWM nâng cao - Servo Motor | ServoControl |
| 10 | Buzzer - Phát âm thanh | MelodyPlayer |
| 11 | UART - Giao tiếp Serial | SerialChat |
| 12 | I2C - Giao tiếp cơ bản | I2CScanner |
| 13 | SPI - Giao tiếp tốc độ cao | SPIBasics |
| 14 | I2C - Đọc cảm biến nhiệt độ (BMP280) | TempReader |

## Week 3: Peripherals & Protocols nâng cao

| Day | Topic | Project |
|-----|-------|---------|
| 15 | I2C - OLED Display (SSD1306) | OLEDDisplay |
| 16 | SPI - LED Matrix (MAX7219) | LEDMatrix |
| 17 | DMA - Direct Memory Access | DMATransfer |
| 18 | Watchdog Timer & Power Management | PowerSave |
| 19 | Flash Storage - Lưu dữ liệu | DataLogger |
| 20 | PIO - Programmable I/O | PIOBlink |
| 21 | DHT22 - Cảm biến nhiệt độ & độ ẩm | DHTSensor |

## Week 4: Sensors, Actuators & IoT

| Day | Topic | Project |
|-----|-------|---------|
| 22 | Ultrasonic Sensor (HC-SR04) | DistanceMeter |
| 23 | DC Motor & H-Bridge (L298N) | MotorDriver |
| 24 | Stepper Motor (28BYJ-48) | StepperControl |
| 25 | IR Remote Control | IRRemote |
| 26 | NeoPixel LED Strip (WS2812B) | NeoPixelShow |
| 27 | WiFi với Pico W - HTTP Request | WiFiClient |
| 28 | WiFi - Web Server trên Pico W | PicoWebServer |
| 29 | MQTT - IoT Communication | MQTTClient |
| 30 | Final Project - Weather Station IoT | WeatherStation |

---

## Cấu trúc mỗi bài học

```
Day-XX-TopicName/
├── README.md          # Lý thuyết + sơ đồ nối mạch + giải thích
├── Sources/
│   └── Main.swift     # Code chính cho Pico
└── Examples/
    └── example.swift  # Ví dụ bổ sung / biến thể
```

## Yêu cầu Hardware
- Raspberry Pi Pico / Pico W
- Breadboard + Jumper wires
- LEDs (đỏ, vàng, xanh), Resistors (220Ω, 10kΩ)
- Push buttons
- Potentiometer 10kΩ
- Servo motor SG90
- Buzzer (passive)
- BMP280 (I2C temperature sensor)
- SSD1306 OLED 0.96" (I2C)
- MAX7219 LED Matrix
- DHT22 temperature & humidity sensor
- HC-SR04 ultrasonic sensor
- L298N motor driver + DC motor
- 28BYJ-48 stepper motor + ULN2003 driver
- IR receiver + remote
- WS2812B NeoPixel LED strip
- (Pico W cho bài WiFi/IoT)

## Yêu cầu Software
- Swift 5.9+ (Embedded mode)
- CMake 3.24+
- Pico SDK 1.5+
- ARM GCC Toolchain (arm-none-eabi-gcc)
- macOS hoặc Linux
