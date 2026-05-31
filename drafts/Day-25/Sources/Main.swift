// ============================================
// Day 25 - IRRemote
// Topic: IR Remote Control (NEC Protocol)
// ============================================

let IR_PIN: UInt32 = 15

print("🔌 === Day 25: IR Remote Control ===")
print("📌 IR Receiver: GP\(IR_PIN)")
print("📌 Protocol: NEC (38kHz carrier)")
print("")

struct IRCommand {
    let address: UInt8
    let command: UInt8
    let name: String
}

let remoteButtons: [IRCommand] = [
    IRCommand(address: 0x00, command: 0x16, name: "0"),
    IRCommand(address: 0x00, command: 0x0C, name: "1"),
    IRCommand(address: 0x00, command: 0x18, name: "2"),
    IRCommand(address: 0x00, command: 0x5E, name: "3"),
    IRCommand(address: 0x00, command: 0x45, name: "CH-"),
    IRCommand(address: 0x00, command: 0x46, name: "CH"),
    IRCommand(address: 0x00, command: 0x47, name: "CH+"),
    IRCommand(address: 0x00, command: 0x44, name: "PREV"),
    IRCommand(address: 0x00, command: 0x40, name: "NEXT"),
    IRCommand(address: 0x00, command: 0x43, name: "PLAY"),
]

print("📌 NEC Decode Results:")
print("   Button | Address | Command | Hex")
print("   -------|---------|---------|------")
for btn in remoteButtons {
    print("   \(String(format: "%-6s", btn.name))  | 0x\(String(format: "%02X", btn.address))   | 0x\(String(format: "%02X", btn.command))   | OK")
}
print("")

print("📌 IR → LED Control Mapping:")
print("   1 → LED Mode: Blink Slow")
print("   2 → LED Mode: Blink Fast")
print("   3 → LED Mode: Breathing")
print("   CH+ → Brightness Up")
print("   CH- → Brightness Down")
print("   PLAY → Toggle ON/OFF")
print("")

print("✅ Day 25 complete!")
