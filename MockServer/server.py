from http.server import HTTPServer, BaseHTTPRequestHandler
from http import HTTPStatus
import socketserver
import json
import os
import random
import time

PORT = 3000

script_dir = os.path.dirname(os.path.abspath(__file__))
json_file_path = os.path.join(script_dir, 'PBTransactions.json')

class Server(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/transactions':
        	# Send a response containing error
        	if random.random() < 0.2:
	            self.send_response(HTTPStatus.INTERNAL_SERVER_ERROR.value)
	            self.end_headers()
	            self.wfile.write(b'Server Error')
	        else:
	            self.send_response(HTTPStatus.OK.value)
	            self.send_header('Content-type', 'application/json')
	            self.end_headers()

	            # Introduce random delays in the response
	            delay_seconds = random.uniform(0.2, 3)
	            time.sleep(delay_seconds)

	            with open(json_file_path, 'r') as json_file:
	                data = json.load(json_file)

	            json_data = json.dumps(data)
	            self.wfile.write(json_data.encode())
        else:
            self.send_response(HTTPStatus.NOT_FOUND.value)
            self.end_headers()
            self.wfile.write(b'Not Found')

with socketserver.TCPServer(("", PORT), Server) as httpd:
    print(f"Serving JSON data at http://localhost:{PORT}/transactions")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass