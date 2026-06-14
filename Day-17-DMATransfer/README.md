# Day 17 - DMA: Direct Memory Access

## 📖 Introduction

DMA allows data transfer between memory and peripherals without CPU intervention, freeing the CPU for other tasks.

---

## 🎯 Key Concepts

### 1. DMA on RP2040
- 12 DMA channels
- Supports memory↔memory, memory↔peripheral
- Ring buffer, chain transfers
- Triggered by peripheral (DREQ)

### 2. Applications
- SPI bulk transfer (OLED refresh)
- ADC continuous sampling
- Audio output via PWM
- Memory copy (faster than CPU loop)

### 3. Basic Code
```swift
let channel = dma_claim_unused_channel(true)
var config = dma_channel_get_default_config(channel)
channel_config_set_transfer_data_size(&config, DMA_SIZE_32)
channel_config_set_read_increment(&config, true)
channel_config_set_write_increment(&config, true)

dma_channel_configure(channel, &config,
    destination, source, count, true)

dma_channel_wait_for_finish_blocking(channel)
```

---

## 🏋️ Challenge
1. DMA memory-to-memory copy
2. DMA + SPI for OLED frame update
3. DMA + ADC for continuous sampling

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 17 - DMA: Direct Memory Access

## 📖 Giới thiệu
DMA cho phép truyền dữ liệu giữa memory và peripherals mà không cần CPU can thiệp, giải phóng CPU cho công việc khác.

---

## 🎯 Kiến thức chính

### 1. DMA trên RP2040
- 12 DMA channels
- Hỗ trợ memory↔memory, memory↔peripheral
- Ring buffer, chain transfers
- Trigger bởi peripheral (DREQ)

### 2. Ứng dụng
- SPI bulk transfer (OLED refresh)
- ADC continuous sampling
- Audio output via PWM
- Memory copy (faster than CPU loop)

### 3. Code cơ bản
```swift
let channel = dma_claim_unused_channel(true)
var config = dma_channel_get_default_config(channel)
channel_config_set_transfer_data_size(&config, DMA_SIZE_32)
channel_config_set_read_increment(&config, true)
channel_config_set_write_increment(&config, true)

dma_channel_configure(channel, &config,
    destination, source, count, true)

dma_channel_wait_for_finish_blocking(channel)
```

---

## 🏋️ Challenge
1. DMA memory-to-memory copy
2. DMA + SPI cho OLED frame update
3. DMA + ADC cho continuous sampling
