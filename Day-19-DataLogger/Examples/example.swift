// ============================================
// Day 19 - Extra Examples
// ============================================

print("🔌 === Day 19: Extra Examples ===\n")

print("📁 Wear Leveling Strategy:")
print("   Flash has limited erase cycles (~100K)")
print("   Rotate write sector to spread wear")
print("   Track current sector with header byte")
print("")

print("🔄 Circular Buffer in Flash:")
print("   Sector: [HEAD_PTR][Entry0][Entry1]...[EntryN]")
print("   When full → erase next sector, continue")
print("   Head pointer tracks newest entry")
print("")

print("💾 Configuration Storage:")
print("   Store user settings in last flash sector")
print("   WiFi SSID, calibration data, device ID")
print("   Read on boot, write on config change")
print("")
