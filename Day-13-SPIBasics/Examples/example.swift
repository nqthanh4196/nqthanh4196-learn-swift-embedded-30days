// ============================================
// Day 13 - Extra Examples
// ============================================

// MARK: - Example 1: SPI DMA Transfer
func spiDMADemo() {
    print("⚡ SPI + DMA (Zero-copy transfer):")
    print("")
    print("   Regular SPI: CPU waits for each byte")
    print("   SPI + DMA: CPU free during transfer!")
    print("")
    
    let bufferSize = 256
    print("   Transfer \(bufferSize) bytes:")
    print("   ├── Without DMA: CPU busy ~\(bufferSize * 8)µs")
    print("   └── With DMA: CPU busy ~2µs (setup only)")
    print("")
    
    /*
    // DMA setup for SPI
    let dmaChannel = dma_claim_unused_channel(true)
    var config = dma_channel_get_default_config(dmaChannel)
    channel_config_set_transfer_data_size(&config, DMA_SIZE_8)
    channel_config_set_dreq(&config, spi_get_dreq(spi0, true))
    
    dma_channel_configure(dmaChannel, &config,
                          spi_get_hw(spi0).dr,  // Destination
                          txBuffer,              // Source
                          bufferSize,            // Count
                          true)                  // Start now
    
    // CPU is free here! Wait for completion:
    dma_channel_wait_for_finish_blocking(dmaChannel)
    */
}

// MARK: - Example 2: Multiple SPI devices
func multiDeviceDemo() {
    print("🔗 Multiple SPI Devices (shared bus):")
    print("")
    print("   All devices share SCK, MOSI, MISO")
    print("   Each device has its own CS pin")
    print("")
    print("   ┌─────────┐")
    print("   │  Pico   │")
    print("   │  SCK  ──┼──┬──── SD Card")
    print("   │  MOSI ──┼──┼──── OLED")
    print("   │  MISO ──┼──┼──── ")
    print("   │  GP17 ──┼──┘     CS_SD")
    print("   │  GP20 ──┼───────  CS_OLED")
    print("   └─────────┘")
    print("")
    
    // Accessing different devices
    let operations: [(String, UInt32)] = [
        ("Read SD Card", 17),
        ("Write OLED", 20),
        ("Read SD Card", 17),
    ]
    
    for (op, csPin) in operations {
        print("   [\(op)] → CS_GP\(csPin) LOW, transfer, CS HIGH")
    }
    print("")
}

// MARK: - Example 3: SPI Speed benchmark
func speedBenchmark() {
    print("📊 SPI Speed Benchmark:")
    print("")
    
    let speeds: [(String, UInt32, Float)] = [
        ("1 MHz", 1_000_000, 1.0),
        ("5 MHz", 5_000_000, 5.0),
        ("10 MHz", 10_000_000, 10.0),
        ("20 MHz", 20_000_000, 20.0),
        ("62.5 MHz", 62_500_000, 62.5),  // RP2040 max
    ]
    
    let dataSize = 1024  // 1KB
    
    print("   Transfer 1KB data:")
    print("   Speed     | Time      | Throughput")
    print("   ----------|-----------|----------")
    for (name, freq, mhz) in speeds {
        let timeUs = Float(dataSize * 8) / mhz
        print("   \(String(format: "%-9s", name)) | \(String(format: "%6.0f", timeUs))µs  | \(name)")
    }
    print("")
    print("   RP2040 max SPI clock: 62.5 MHz (sysclk/2)")
    print("")
}

// MARK: - Run Examples
print("🔌 === Day 13: Extra Examples ===\n")
spiDMADemo()
multiDeviceDemo()
speedBenchmark()
