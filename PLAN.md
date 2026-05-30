# 🔌 Learn Embedded Swift in 30 Days - Plan

## Overview
One lesson per day, from basic to advanced, embedded programming with Swift on Raspberry Pi Pico (RP2040).

---

## Week 1: GPIO Basics & Digital I/O

| Day | Topic | Project |
|-----|-------|---------|
| 01 | Introduction to Swift Embedded & Setup | HelloPico |
| 02 | GPIO Output - Blink LED | BlinkLED |
| 03 | GPIO Input - Reading a Button | ButtonRead |
| 04 | PWM - LED Brightness Control | LEDDimmer |
| 05 | Timer & Interrupts | TimerBlink |
| 06 | Debounce Button & State Machine | ButtonStateMachine |
| 07 | Multiple LEDs - Traffic Light | TrafficLight |

## Week 2: Analog & Actuators

| Day | Topic | Project |
|-----|-------|---------|
| 08 | Analog Input (ADC) - Reading Sensors | AnalogRead |
| 09 | Advanced PWM - Servo Motor | ServoControl |
| 10 | Buzzer - Playing Sounds | MelodyPlayer |
| 11 | UART - Serial Communication | SerialChat |
| 12 | I2C - Basic Communication | I2CScanner |
| 13 | SPI - High-Speed Communication | SPIBasics |
| 14 | I2C - Temperature Sensor (BMP280) | TempReader |

## Week 3: Advanced Peripherals & Protocols

| Day | Topic | Project |
|-----|-------|---------|
| 15 | I2C - OLED Display (SSD1306) | OLEDDisplay |
| 16 | SPI - LED Matrix (MAX7219) | LEDMatrix |
| 17 | DMA - Direct Memory Access | DMATransfer |
| 18 | Watchdog Timer & Power Management | PowerSave |
| 19 | Flash Storage - Data Persistence | DataLogger |
| 20 | PIO - Programmable I/O | PIOBlink |
| 21 | DHT22 - Temperature & Humidity | DHTSensor |

## Week 4: Sensors, Actuators & IoT

| Day | Topic | Project |
|-----|-------|---------|
| 22 | Ultrasonic Sensor (HC-SR04) | DistanceMeter |
| 23 | DC Motor & H-Bridge (L298N) | MotorDriver |
| 24 | Stepper Motor (28BYJ-48) | StepperControl |
| 25 | IR Remote Control | IRRemote |
| 26 | NeoPixel LED Strip (WS2812B) | NeoPixelShow |
| 27 | WiFi with Pico W - HTTP Request | WiFiClient |
| 28 | WiFi - Web Server on Pico W | PicoWebServer |
| 29 | MQTT - IoT Communication | MQTTClient |
| 30 | Final Project - IoT Weather Station | WeatherStation |

---

## Lesson Structure

```
Day-XX-TopicName/
├── README.md          # Theory + wiring diagrams + explanations (EN & VI)
├── Sources/
│   └── Main.swift     # Main Pico code
└── Examples/
    └── example.swift  # Extra examples / variations
```

## Hardware Requirements
- Raspberry Pi Pico / Pico W
- Breadboard + Jumper wires
- LEDs (red, yellow, green), Resistors (220Ω, 10kΩ)
- Push buttons
- 10kΩ Potentiometer
- SG90 Servo motor
- Passive Buzzer
- BMP280 (I2C temperature sensor)
- SSD1306 OLED 0.96" (I2C)
- MAX7219 LED Matrix
- DHT22 temperature & humidity sensor
- HC-SR04 ultrasonic sensor
- L298N motor driver + DC motor
- 28BYJ-48 stepper motor + ULN2003 driver
- IR receiver + remote
- WS2812B NeoPixel LED strip
- (Pico W for WiFi/IoT lessons)

## Software Requirements
- Swift 5.9+ (Embedded mode)
- CMake 3.24+
- Pico SDK 1.5+
- ARM GCC Toolchain (arm-none-eabi-gcc)
- macOS or Linux

---

# 🇻🇳 Phiên bản Tiếng Việt

# 🔌 Học Embedded Swift trong 30 ngày - Kế hoạch

## Tổng quan
Mỗi ngày 1 bài học, từ cơ bản đến nâng cao, lập trình Embedded bằng Swift trên Raspberry Pi Pico (RP2040).

---

## Tuần 1: Cơ bản GPIO & Digital I/O

| Ngày | Chủ đề | Project |
|------|--------|---------|
| 01 | Giới thiệu Swift Embedded & Setup môi trường | HelloPico |
| 02 | GPIO Output - Blink LED | BlinkLED |
| 03 | GPIO Input - Đọc nút nhấn | ButtonRead |
| 04 | PWM - Điều khiển độ sáng LED | LEDDimmer |
| 05 | Timer & Interrupts | TimerBlink |
| 06 | Debounce Button & State Machine | ButtonStateMachine |
| 07 | Multiple LEDs - Traffic Light | TrafficLight |

## Tuần 2: Analog & Actuators

| Ngày | Chủ đề | Project |
|------|--------|---------|
| 08 | Analog Input (ADC) - Đọc cảm biến | AnalogRead |
| 09 | PWM nâng cao - Servo Motor | ServoControl |
| 10 | Buzzer - Phát âm thanh | MelodyPlayer |
| 11 | UART - Giao tiếp Serial | SerialChat |
| 12 | I2C - Giao tiếp cơ bản | I2CScanner |
| 13 | SPI - Giao tiếp tốc độ cao | SPIBasics |
| 14 | I2C - Đọc cảm biến nhiệt độ (BMP280) | TempReader |

## Tuần 3: Peripherals & Protocols nâng cao

| Ngày | Chủ đề | Project |
|------|--------|---------|
| 15 | I2C - OLED Display (SSD1306) | OLEDDisplay |
| 16 | SPI - LED Matrix (MAX7219) | LEDMatrix |
| 17 | DMA - Direct Memory Access | DMATransfer |
| 18 | Watchdog Timer & Power Management | PowerSave |
| 19 | Flash Storage - Lưu dữ liệu | DataLogger |
| 20 | PIO - Programmable I/O | PIOBlink |
| 21 | DHT22 - Cảm biến nhiệt độ & độ ẩm | DHTSensor |

## Tuần 4: Sensors, Actuators & IoT

| Ngày | Chủ đề | Project |
|------|--------|---------|
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
├── README.md          # Lý thuyết + sơ đồ nối mạch + giải thích (EN & VI)
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
