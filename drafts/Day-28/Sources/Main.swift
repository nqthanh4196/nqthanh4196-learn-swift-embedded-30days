// ============================================
// Day 28 - PicoWebServer
// Topic: HTTP Web Server on Pico W
// ============================================

print("🔌 === Day 28: Pico W Web Server ===")
print("📌 Listening on http://192.168.1.105:80")
print("")

let htmlPage = """
   <!DOCTYPE html>
   <html>
   <head><title>Pico W Dashboard</title></head>
   <body>
     <h1>🔌 Pico W IoT Dashboard</h1>
     <p>Temperature: <span id="temp">25.3</span>°C</p>
     <p>Humidity: <span id="hum">65.2</span>%</p>
     <button onclick="fetch('/led/on')">💡 LED ON</button>
     <button onclick="fetch('/led/off')">⬛ LED OFF</button>
     <script>
       setInterval(() => {
         fetch('/api/sensors').then(r=>r.json()).then(d=>{
           document.getElementById('temp').innerText = d.temp;
           document.getElementById('hum').innerText = d.hum;
         });
       }, 5000);
     </script>
   </body>
   </html>
"""

print("📌 Served HTML Dashboard:")
print(htmlPage)
print("")

print("📌 API Endpoints:")
print("   GET  /           → HTML dashboard")
print("   GET  /api/sensors → {\"temp\":25.3,\"hum\":65.2}")
print("   GET  /led/on     → Turn LED ON")
print("   GET  /led/off    → Turn LED OFF")
print("")

print("📌 Request Log:")
print("   192.168.1.100 GET / → 200 OK")
print("   192.168.1.100 GET /api/sensors → 200 JSON")
print("   192.168.1.100 GET /led/on → 200 LED toggled")
print("")

print("✅ Day 28 complete!")
