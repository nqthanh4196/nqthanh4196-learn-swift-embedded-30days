# Day 10 - Buzzer: Phát âm thanh

## 📖 Giới thiệu

Hôm nay ta dùng PWM để điều khiển passive buzzer, phát âm thanh ở các tần số khác nhau và tạo giai điệu đơn giản.

---

## 🎯 Kiến thức chính

### 1. Active vs Passive Buzzer

| Loại | Hoạt động | Điều khiển |
|------|-----------|------------|
| Active | Có oscillator bên trong | HIGH/LOW (on/off) |
| Passive | Cần tín hiệu ngoài | PWM (thay đổi tần số) |

> Ta dùng **Passive buzzer** vì có thể phát nhiều nốt nhạc khác nhau.

### 2. Sơ đồ nối

```
GP15 (PWM) ──── Buzzer(+) ──── Buzzer(-) ──── GND
```

### 3. Nguyên lý: Tần số = Cao độ

```swift
// Tần số PWM = Cao độ nốt nhạc
// Duty cycle 50% cho âm lượng tối đa

func playTone(frequency: UInt32) {
    let wrap = 125_000_000 / (divider * frequency) - 1
    pwm_set_wrap(slice, wrap)
    pwm_set_chan_level(slice, channel, wrap / 2)  // 50% duty
}
```

### 4. Bảng tần số nốt nhạc

```
Nốt | Octave 4 | Octave 5
-----|----------|--------
Do   | 262 Hz   | 523 Hz
Re   | 294 Hz   | 587 Hz
Mi   | 330 Hz   | 659 Hz
Fa   | 349 Hz   | 698 Hz
Sol  | 392 Hz   | 784 Hz
La   | 440 Hz   | 880 Hz
Si   | 494 Hz   | 988 Hz
```

### 5. Phát một bài hát

```swift
struct MusicNote {
    let frequency: UInt32
    let duration: UInt32  // ms
}

let twinkle: [MusicNote] = [
    MusicNote(frequency: 262, duration: 250),  // Do
    MusicNote(frequency: 262, duration: 250),  // Do
    MusicNote(frequency: 392, duration: 250),  // Sol
    MusicNote(frequency: 392, duration: 250),  // Sol
    // ...
]

for note in twinkle {
    playTone(frequency: note.frequency)
    sleep_ms(note.duration)
    noTone()
    sleep_ms(20)  // Gap between notes
}
```

---

## 📝 Tóm tắt

- Passive buzzer dùng PWM để phát âm thanh
- Tần số PWM = cao độ (pitch) nốt nhạc
- Duty cycle 50% = âm lượng max
- Dùng array of notes để phát melody

---

## 🏋️ Challenge

1. Phát scale Do Re Mi Fa Sol La Si Do
2. Tạo melody "Happy Birthday" hoặc "Twinkle Twinkle"
3. Dùng potentiometer để thay đổi cao độ real-time (theremin)
