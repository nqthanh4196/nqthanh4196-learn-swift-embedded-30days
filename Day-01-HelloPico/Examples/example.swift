// ============================================
// Day 01 - Extra Examples
// Topic: Cấu trúc project & CMakeLists.txt
// ============================================

// MARK: - Example 1: CMakeLists.txt mẫu cho Swift Embedded Pico

/*
 CMakeLists.txt cho project Swift Embedded trên Pico:
 
 cmake_minimum_required(VERSION 3.24)
 
 # Include Pico SDK
 include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)
 
 project(HelloPico C CXX Swift)
 
 pico_sdk_init()
 
 add_executable(main
     Sources/Main.swift
 )
 
 # Link Pico SDK libraries
 target_link_libraries(main
     pico_stdlib
     hardware_gpio
 )
 
 # Enable USB output cho printf/print
 pico_enable_stdio_usb(main 1)
 pico_enable_stdio_uart(main 0)
 
 # Tạo file .uf2 để flash
 pico_add_extra_outputs(main)
*/

// MARK: - Example 2: BridgingHeader.h mẫu

/*
 BridgingHeader.h - Bridge giữa C (Pico SDK) và Swift:
 
 #ifndef BridgingHeader_h
 #define BridgingHeader_h
 
 #include "pico/stdlib.h"
 #include "hardware/gpio.h"
 #include "hardware/pwm.h"
 #include "hardware/adc.h"
 #include "hardware/i2c.h"
 #include "hardware/spi.h"
 #include "hardware/uart.h"
 #include "hardware/timer.h"
 
 #endif
*/

// MARK: - Example 3: Các kiểu dữ liệu trong Embedded Swift

/// Trong Embedded Swift, sử dụng kiểu dữ liệu fixed-size
/// để đảm bảo tương thích với hardware registers

let gpioPin: UInt32 = 25          // GPIO pin number
let registerValue: UInt32 = 0xFF  // 32-bit register
let adcValue: UInt16 = 4095      // 12-bit ADC max value
let byteData: UInt8 = 0xA5       // 8-bit data

print("🔢 Kiểu dữ liệu Embedded:")
print("   GPIO Pin (UInt32): \(gpioPin)")
print("   Register (UInt32): 0x\(String(registerValue, radix: 16, uppercase: true))")
print("   ADC Max (UInt16): \(adcValue)")
print("   Byte (UInt8): 0x\(String(byteData, radix: 16, uppercase: true))")
print("")

// MARK: - Example 4: Memory-mapped I/O concept

/// RP2040 sử dụng Memory-Mapped I/O
/// Các peripheral được truy cập thông qua địa chỉ bộ nhớ

let GPIO_BASE: UInt32 = 0x4001_4000       // GPIO base address
let SIO_BASE: UInt32 = 0xD000_0000        // SIO (Single-cycle IO) base
let GPIO_OUT_SET: UInt32 = SIO_BASE + 0x014  // Set output high
let GPIO_OUT_CLR: UInt32 = SIO_BASE + 0x018  // Set output low

print("🗺️ Memory Map (RP2040):")
print("   GPIO Base: 0x\(String(GPIO_BASE, radix: 16, uppercase: true))")
print("   SIO Base: 0x\(String(SIO_BASE, radix: 16, uppercase: true))")
print("   GPIO OUT SET: 0x\(String(GPIO_OUT_SET, radix: 16, uppercase: true))")
print("   GPIO OUT CLR: 0x\(String(GPIO_OUT_CLR, radix: 16, uppercase: true))")
