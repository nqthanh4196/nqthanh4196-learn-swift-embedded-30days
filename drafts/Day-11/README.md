# Day 11 - UART: Serial Communication

## 📖 Introduction

UART (Universal Asynchronous Receiver-Transmitter) is the most basic serial protocol for communication between the Pico and a computer or other modules (GPS, Bluetooth, etc.)

---

## 🎯 Key Concepts

### 1. What is UART?

- Serial communication, asynchronous (no shared clock needed)
- 2 wires: TX (transmit) and RX (receive)
- Full-duplex: send and receive simultaneously
- Common baud rates: 9600, 115200

### 2. UART on RP2040

| UART | TX Pin | RX Pin |
|------|--------|--------|
| UART0 | GP0 | GP1 |
| UART1 | GP4 | GP5 |

### 3. Wiring Diagram

```
Pico GP0 (TX) ──────── RX (USB-Serial adapter / Module)
Pico GP1 (RX) ──────── TX (USB-Serial adapter / Module)
Pico GND      ──────── GND
```

> ⚠️ TX connects to the other side's RX! (Cross connection)

### 4. Basic Code

```swift
// Initialize UART0, 115200 baud
uart_init(uart0, 115200)
gpio_set_function(0, GPIO_FUNC_UART)  // GP0 = TX
gpio_set_function(1, GPIO_FUNC_UART)  // GP1 = RX

// Send string
uart_puts(uart0, "Hello from Pico!\r\n")

// Send byte
uart_putc(uart0, 0x41)  // 'A'

// Receive byte
if uart_is_readable(uart0) {
    let byte = uart_getc(uart0)
}
```

### 5. UART Frame Format

```
Start  Data (8-bit)  Parity  Stop
  |  |D0|D1|D2|D3|D4|D5|D6|D7|  P  |S|
  0   ←── LSB first ──→           1   1
```

---

## 📝 Summary

- UART: 2 wires (TX, RX), asynchronous
- RP2040 has 2 UARTs (uart0, uart1)
- Baud rate must match on both ends
- Used for debugging, module communication, telemetry

---

## 🏋️ Challenge

1. Send "Hello" from the Pico to a serial terminal
2. Echo: receive a character from the terminal, send it back
3. Command parser: receive text commands, control LEDs

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 11 - UART: Giao tiếp Serial

## 📖 Giới thiệu

UART (Universal Asynchronous Receiver-Transmitter) là giao thức serial cơ bản nhất để giao tiếp giữa Pico và máy tính hoặc module khác (GPS, Bluetooth, etc.)

---

## 🎯 Kiến thức chính

### 1. UART là gì?

- Giao tiếp nối tiếp, bất đồng bộ (không cần clock chung)
- 2 dây: TX (transmit) và RX (receive)
- Full-duplex: gửi và nhận đồng thời
- Tốc độ phổ biến: 9600, 115200 baud

### 2. UART trên RP2040

| UART | TX Pin | RX Pin |
|------|--------|--------|
| UART0 | GP0 | GP1 |
| UART1 | GP4 | GP5 |

### 3. Sơ đồ nối

```
Pico GP0 (TX) ──────── RX (USB-Serial adapter / Module)
Pico GP1 (RX) ──────── TX (USB-Serial adapter / Module)
Pico GND      ──────── GND
```

> ⚠️ TX nối với RX bên kia! (Cross connection)

### 4. Code cơ bản

```swift
// Khởi tạo UART0, 115200 baud
uart_init(uart0, 115200)
gpio_set_function(0, GPIO_FUNC_UART)  // GP0 = TX
gpio_set_function(1, GPIO_FUNC_UART)  // GP1 = RX

// Gửi string
uart_puts(uart0, "Hello from Pico!\r\n")

// Gửi byte
uart_putc(uart0, 0x41)  // 'A'

// Nhận byte
if uart_is_readable(uart0) {
    let byte = uart_getc(uart0)
}
```

### 5. UART Frame Format

```
Start  Data (8-bit)  Parity  Stop
  |  |D0|D1|D2|D3|D4|D5|D6|D7|  P  |S|
  0   ←── LSB first ──→           1   1
```

---

## 📝 Tóm tắt

- UART: 2 dây (TX, RX), bất đồng bộ
- RP2040 có 2 UART (uart0, uart1)
- Baudrate phải giống nhau ở cả 2 đầu
- Dùng để debug, giao tiếp module, telemetry

---

## 🏋️ Challenge

1. Gửi "Hello" từ Pico ra serial terminal
2. Echo: nhận ký tự từ terminal, gửi lại
3. Command parser: nhận lệnh text, điều khiển LED
