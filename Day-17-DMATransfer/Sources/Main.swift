// ============================================
// Day 17 - DMATransfer
// Topic: DMA - Direct Memory Access
// ============================================

// MARK: - DMA Concepts

print("🔌 === Day 17: DMA (Direct Memory Access) ===")
print("")
print("📌 RP2040 DMA Features:")
print("   • 12 independent channels")
print("   • Transfer sizes: 8, 16, 32 bit")
print("   • Address wrapping (ring buffer)")
print("   • Channel chaining")
print("   • Pacing by DREQ (peripheral request)")
print("")

// MARK: - Demo 1: Memory to Memory
func demoMemToMem() {
    print("📌 Demo 1: Memory-to-Memory Copy")
    print("")
    
    let source: [UInt32] = [0xDEADBEEF, 0xCAFEBABE, 0x12345678, 0xABCD1234]
    var destination: [UInt32] = [0, 0, 0, 0]
    
    print("   Source:      ", terminator: "")
    for val in source { print("0x\(String(format: "%08X", val)) ", terminator: "") }
    print("")
    
    // DMA Copy
    destination = source  // Simulated
    
    print("   Destination: ", terminator: "")
    for val in destination { print("0x\(String(format: "%08X", val)) ", terminator: "") }
    print(" ✅")
    print("")
    
    // Performance comparison
    print("   Performance (1024 words):")
    print("   ├── CPU loop: ~4096 cycles")
    print("   └── DMA:      ~1024 cycles (4x faster!)")
    print("")
}

// MARK: - Demo 2: DMA + ADC
func demoDMAadc() {
    print("📌 Demo 2: DMA + ADC (Continuous Sampling)")
    print("")
    print("   ADC triggers DMA on each conversion")
    print("   CPU is free while sampling!")
    print("")
    
    /*
    // Setup ADC for free-running with DMA
    adc_fifo_setup(true, true, 1, false, false)
    adc_set_clkdiv(96)  // 500kHz sample rate
    
    let channel = dma_claim_unused_channel(true)
    var config = dma_channel_get_default_config(channel)
    channel_config_set_transfer_data_size(&config, DMA_SIZE_16)
    channel_config_set_read_increment(&config, false)  // ADC FIFO = fixed addr
    channel_config_set_write_increment(&config, true)
    channel_config_set_dreq(&config, DREQ_ADC)
    
    dma_channel_configure(channel, &config,
        adcBuffer, &adc_hw->fifo, SAMPLE_COUNT, true)
    
    adc_run(true)  // Start free-running ADC
    dma_channel_wait_for_finish_blocking(channel)
    adc_run(false)
    */
    
    let samples: [UInt16] = [2048, 2055, 2040, 2060, 2045, 2038, 2052, 2041]
    print("   Captured \(samples.count) samples via DMA:")
    for (i, s) in samples.enumerated() {
        print("   [\(i)] \(s)")
    }
    print("")
}

// MARK: - Demo 3: DMA + SPI (OLED refresh)
func demaDMAspi() {
    print("📌 Demo 3: DMA + SPI (Frame Buffer → OLED)")
    print("")
    print("   Frame buffer (1024 bytes) → SPI → SSD1306")
    print("   CPU starts DMA, then does other work!")
    print("")
    print("   Timeline:")
    print("   t=0ms   CPU: Start DMA transfer")
    print("   t=0.1ms CPU: Free! Processing button input...")
    print("   t=0.5ms CPU: Free! Reading sensor...")
    print("   t=2ms   DMA: Transfer complete! (interrupt)")
    print("")
}

// MARK: - Main
demoMemToMem()
demoDMAadc()
demaDMAspi()

print("✅ Day 17 complete!")
print("📝 Next: Day 18 - Watchdog & Power Management")
