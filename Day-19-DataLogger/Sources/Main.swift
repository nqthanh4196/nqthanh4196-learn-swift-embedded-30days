// ============================================
// Day 19 - DataLogger
// Topic: Flash Storage - Lưu dữ liệu
// ============================================

print("🔌 === Day 19: Flash Storage (Data Logger) ===")
print("")
print("📌 RP2040 Flash: 2MB total")
print("   Program: ~200KB (varies)")
print("   Available for data: ~1.8MB")
print("   Sector size: 4KB (erase unit)")
print("   Page size: 256 bytes (write unit)")
print("")

// MARK: - Flash Operations
func demoFlashOps() {
    print("📌 Demo: Flash Read/Write/Erase")
    print("")
    
    /*
    let FLASH_TARGET_OFFSET: UInt32 = 0x1F0000  // Last 64KB
    
    // CRITICAL: Disable interrupts during flash write!
    let ints = save_and_disable_interrupts()
    
    // Erase (must erase sector before writing)
    flash_range_erase(FLASH_TARGET_OFFSET, FLASH_SECTOR_SIZE)
    
    // Write (256-byte aligned)
    var data = [UInt8](repeating: 0, count: FLASH_PAGE_SIZE)
    data[0] = 0x42
    flash_range_program(FLASH_TARGET_OFFSET, &data, FLASH_PAGE_SIZE)
    
    restore_interrupts(ints)
    
    // Read (direct memory access)
    let flashPtr = UnsafePointer<UInt8>(bitPattern: XIP_BASE + FLASH_TARGET_OFFSET)
    let value = flashPtr![0]  // 0x42
    */
    
    print("   ⚠️ Rules:")
    print("   1. Must ERASE before WRITE (set bits to 1)")
    print("   2. Write can only set bits from 1→0")
    print("   3. Erase granularity: 4KB sectors")
    print("   4. Write granularity: 256B pages")
    print("   5. DISABLE INTERRUPTS during flash operations!")
    print("")
}

// MARK: - Data Logger
func demoDataLogger() {
    print("📌 Demo: Temperature Data Logger")
    print("")
    
    struct LogEntry {
        let timestamp: UInt32
        let temperature: Float
        let humidity: Float
    }
    
    let entries = [
        LogEntry(timestamp: 0, temperature: 25.3, humidity: 65.2),
        LogEntry(timestamp: 60, temperature: 25.5, humidity: 64.8),
        LogEntry(timestamp: 120, temperature: 25.8, humidity: 64.5),
        LogEntry(timestamp: 180, temperature: 26.1, humidity: 63.9),
        LogEntry(timestamp: 240, temperature: 26.5, humidity: 63.2),
    ]
    
    print("   Stored in Flash (sector 0x1F0000):")
    print("   #  | Time(s) | Temp(°C) | Hum(%)")
    print("   ---|---------|----------|-------")
    for (i, e) in entries.enumerated() {
        print("   \(i)  | \(String(format: "%4d", e.timestamp))s   | \(String(format: "%5.1f", e.temperature))    | \(String(format: "%4.1f", e.humidity))")
    }
    print("")
    print("   Entry size: 12 bytes")
    print("   Sector capacity: 4096 / 12 = 341 entries")
    print("   At 1 entry/min = ~5.7 hours per sector")
    print("")
}

demoFlashOps()
demoDataLogger()

print("✅ Day 19 complete!")
print("📝 Next: Day 20 - PIO (Programmable I/O)")
