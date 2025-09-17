// Types of Basic HTTP Servers in Node.js


// 1️⃣ Basic HTTP Server (Plain Node.js)

// The simplest way using only the http module.

// 🔹 Features
// ✔ No external dependencies
// ✔ Manual request handling
// ✔ Best for learning core concepts

const http = require('http');

const http_server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');

    res.writeHead(200, { 'Content-Type': 'text/plain' });

    res.write('Hello from basic HTTP server!') 
    
    res.end();                               
});

http_server.listen(3000, () => console.log('Server running on port 3000'));


// -----------------------------------------------------------------------


// 2️⃣ HTTPS Server (Secure HTTP)

// Uses TLS/SSL encryption for secure connections.

    // Features
        // ✔ Encrypts data transmission
        // ✔ Requires SSL certificate (key.pem, cert.pem)

const https = require('https');
const fs = require('fs');

const options = {
    key: fs.readFileSync('key.pem'),
    cert: fs.readFileSync('cert.pem')
};

const server = https.createServer(options, (req, res) => {
    res.end('Secure HTTPS Server!');
});

server.listen(443, () => console.log('HTTPS Server running'));


// -----------------------------------------------------------------------


// 3️⃣ HTTP/2 Server (Modern Protocol)

// Faster and more efficient than HTTP/1.1.
    
    // 🔹 Features
        // ✔ Multiplexing (multiple requests over one connection)
        // ✔ Lower latency
        // ✔ Requires SSL

const http2 = require('http2');
const fs = require('fs');

const server = http2.createSecureServer({
    key: fs.readFileSync('key.pem'),
    cert: fs.readFileSync('cert.pem')
}, (req, res) => {
    res.end('Hello from HTTP/2 Server!');
});

server.listen(443, () => console.log('HTTP/2 Server running'));


// -----------------------------------------------------------------------


// 4️⃣ WebSocket Server (Real-Time)

// Allows bidirectional communication (e.g., chat apps).

    // 🔹 Features
        // ✔ Persistent connection
        // ✔ Real-time updates
        // ✔ Uses ws library


const WebSocket = require('ws');
const http = require('http');

// Create HTTP server (optional, for hybrid HTTP + WS)
const server = http.createServer((req, res) => {
    res.end('HTTP Server');
});

// Attach WebSocket
const wss = new WebSocket.Server({ server });

wss.on('connection', (ws) => {
    ws.send('Welcome to WebSocket!');
});

server.listen(3000, () => console.log('HTTP + WebSocket running'));


// -----------------------------------------------------------------------


// 5️⃣ Reverse Proxy Server

// Forwards requests to other servers (useful in microservices).

    // 🔹 Features
        // ✔ Load balancing
        // ✔ SSL termination
        // ✔ Uses http-proxy

const http = require('http');
const httpProxy = require('http-proxy');

const proxy = httpProxy.createProxyServer();

const server = http.createServer((req, res) => {
    proxy.web(req, res, { target: 'http://localhost:4000' });
});

server.listen(3000, () => console.log('Proxy Server running'));


// -----------------------------------------------------------------------


// 6️⃣ Static File Server

// Serves HTML, CSS, JS files (like nginx but in Node.js).

    // 🔹 Features
        // ✔ Serves static assets
        // ✔ Uses fs and path modules

const http = require('http');
const fs = require('fs');
const path = require('path');

const server = http.createServer((req, res) => {
    const filePath = path.join(__dirname, 'public', req.url);
    fs.readFile(filePath, (err, data) => {
    if (err) {
        res.writeHead(404);
        res.end('File not found!');
    } else {
        res.writeHead(200);
        res.end(data);
    }
    });
});

server.listen(3000, () => console.log('Static Server running'));


// -----------------------------------------------------------------------


// 📌 Summary Table
// Type	Module          Used	        Use Case
// --------------------------------------------------------------------
// Basic HTTP	        http	        Simple APIs, learning
// HTTPS	            https	        Secure websites
// HTTP/2	            http2	        Faster web apps
// WebSocket	        ws	            Real-time apps (chat, games)
// Reverse Proxy	    http-proxy	    Load balancing, microservices
// Static File Server	http + fs	    Serving HTML/CSS/JS files