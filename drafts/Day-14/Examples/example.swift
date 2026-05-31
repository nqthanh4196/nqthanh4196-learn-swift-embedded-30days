// ============================================
// Day 14 - Extra Examples
// ============================================

// MARK: - Example 1: Moving Average Filter
func movingAverageDemo() {
    print("📊 Moving Average Filter for Temperature:")
    print("")
    
    struct MovingAverage {
        var buffer: [Float]
        var index = 0
        var count = 0
        let size: Int
        
        init(size: Int) {
            self.size = size
            self.buffer = [Float](repeating: 0, count: size)
        }
        
        mutating func add(_ value: Float) -> Float {
            buffer[index] = value
            index = (index + 1) % size
            count = min(count + 1, size)
            return buffer.prefix(count).reduce(0, +) / Float(count)
        }
    }
    
    var filter = MovingAverage(size: 5)
    let rawReadings: [Float] = [25.0, 25.8, 24.9, 26.2, 25.1, 25.4, 25.3, 25.7, 25.0, 25.5]
    
    print("   Raw    | Filtered (MA-5) | Noise")
    print("   -------|-----------------|------")
    for raw in rawReadings {
        let filtered = filter.add(raw)
        let noise = abs(raw - filtered)
        print("   \(String(format: "%5.1f", raw))  | \(String(format: "%5.2f", filtered))           | \(String(format: "%.2f", noise))")
    }
    print("")
}

// MARK: - Example 2: Temperature alarm
func tempAlarmDemo() {
    print("🚨 Temperature Alarm System:")
    print("")
    
    let thresholdHigh: Float = 30.0
    let thresholdLow: Float = 18.0
    
    let readings: [Float] = [25.0, 27.5, 29.0, 30.5, 31.2, 28.0, 20.0, 17.5, 16.0]
    
    for temp in readings {
        let status: String
        if temp > thresholdHigh {
            status = "🔴 HIGH ALARM!"
        } else if temp < thresholdLow {
            status = "🔵 LOW ALARM!"
        } else {
            status = "🟢 Normal"
        }
        print("   \(String(format: "%5.1f", temp))°C → \(status)")
    }
    print("")
}

// MARK: - Example 3: Weather prediction from pressure
func weatherPrediction() {
    print("🌤️ Weather Prediction from Pressure Trend:")
    print("")
    
    let pressureHistory: [Float] = [1015.0, 1014.5, 1013.8, 1012.5, 1011.0, 1009.5]
    
    print("   Hour | Pressure | Trend")
    print("   -----|----------|------")
    for (i, p) in pressureHistory.enumerated() {
        let trend: String
        if i > 0 {
            let diff = p - pressureHistory[i-1]
            if diff < -1.0 {
                trend = "↓↓ Dropping fast → 🌧️ Storm likely"
            } else if diff < 0 {
                trend = "↓  Dropping → ☁️ Clouds"
            } else if diff > 1.0 {
                trend = "↑↑ Rising fast → ☀️ Clear"
            } else {
                trend = "→  Stable → 🌤️ Fair"
            }
        } else {
            trend = "-- Baseline"
        }
        print("   \(String(format: "%3d", i))h  | \(String(format: "%6.1f", p))  | \(trend)")
    }
    print("")
}

// MARK: - Run Examples
print("🔌 === Day 14: Extra Examples ===\n")
movingAverageDemo()
tempAlarmDemo()
weatherPrediction()
