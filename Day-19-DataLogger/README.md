# Day 19 - Flash Storage: Lưu dữ liệu

## 📖 Giới thiệu
RP2040 có 2MB flash onboard. Ngoài chứa firmware, có thể dùng phần còn lại để lưu dữ liệu, settings, data log.

---

## 🎯 Kiến thức chính

### 1. Flash Memory RP2040
- Total: 2MB (W25Q16)
- Erase sector: 4KB
- Write page: 256 bytes
- Read: trực tiếp qua XIP (Execute-In-Place)

### 2. Quy trình Write
```swift
// 1. Disable interrupts (XIP conflict!)
let ints = save_and_disable_interrupts()
// 2. Erase sector (set all bits = 1)
flash_range_erase(offset, FLASH_SECTOR_SIZE)
// 3. Program page (set bits 1→0)
flash_range_program(offset, data, FLASH_PAGE_SIZE)
// 4. Restore interrupts
restore_interrupts(ints)
```

### 3. Flash Wear
- ~100,000 erase cycles per sector
- Use wear leveling for frequent writes
- Use circular buffer pattern

---

## 🏋️ Challenge
1. Lưu và đọc lại 1 struct từ flash
2. Data logger: ghi temperature mỗi phút
3. Persist user configuration qua reset
