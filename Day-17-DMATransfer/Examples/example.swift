// ============================================
// Day 17 - Extra Examples
// ============================================

print("🔌 === Day 17: Extra Examples ===\n")

print("🔗 DMA Channel Chaining:")
print("   Channel 0 → triggers Channel 1 → triggers Channel 2")
print("   Use case: Double-buffered audio output")
print("")

print("🔄 DMA Ring Buffer (Address Wrapping):")
print("   Write address wraps every 256 bytes")
print("   Continuous circular buffer for audio/ADC")
print("   wrap_size = 8 → wraps every 2^8 = 256 bytes")
print("")

print("⚡ DMA vs CPU Performance:")
print("   Operation           | CPU    | DMA")
print("   --------------------|--------|--------")
print("   1KB memory copy     | 8µs    | 2µs")
print("   SPI 1024B transfer  | 82µs   | 82µs (but CPU free!)")
print("   ADC 1000 samples    | 2ms    | 2ms (CPU free!)")
print("")
