#!/bin/bash
# bash <(curl -fsSL https://raw.githubusercontent.com/vanhooferwin/scripts/main/python/hello-webserver.sh) 8080

set -e  # Exit on error

# Check if a port is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <port>"
  exit 1
fi

PORT="$1"

# Create a temporary directory for the server
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR" || exit

# Create the Python web server script
cat <<EOF > server.py
from http.server import SimpleHTTPRequestHandler, HTTPServer
import time

PORT = $PORT  # Correctly embedding shell variable

class TimeHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        current_time = time.strftime("%Y-%m-%d %H:%M:%S")
        self.wfile.write(f"<h1>Hello, World!</h1><p>Current Time: {current_time}</p>".encode())

server = HTTPServer(("0.0.0.0", PORT), TimeHandler)
print(f"Serving on port {PORT}. Press Ctrl+C to stop.")

try:
    server.serve_forever()
except KeyboardInterrupt:
    pass

server.server_close()
EOF

# Start the server
echo "Starting web server on port $PORT..."
python3 server.py &

SERVER_PID=$!
trap "echo 'Stopping server...'; kill $SERVER_PID; rm -rf $TMP_DIR" EXIT

# Keep the script running
wait $SERVER_PID