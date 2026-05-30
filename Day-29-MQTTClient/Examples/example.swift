// Day 29 - Extra Examples

print("🔌 === Day 29: Extra Examples ===\n")

print("🏠 Home Automation Topic Structure:")
print("   home/")
print("   ├── livingroom/")
print("   │   ├── temperature  → publish sensor")
print("   │   ├── humidity     → publish sensor")
print("   │   └── light/set    → subscribe command")
print("   ├── bedroom/")
print("   │   ├── temperature  → publish sensor")
print("   │   └── fan/set      → subscribe command")
print("   └── status           → online/offline (LWT)")
print("")

print("💀 Last Will & Testament (LWT):")
print("   Set on connect: if Pico disconnects unexpectedly,")
print("   broker publishes: home/status → {\"online\":false}")
print("   Other clients know device went offline!")
print("")
