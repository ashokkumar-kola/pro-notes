/**
 * 🖥️ BUILDING WEB SERVERS IN NODE.JS
 * 
 * File: 04_web_servers.js
 * Author: Your Name
 * Date: ${new Date().toISOString().split('T')[0]}
 * 
 * ░█▀▀░█▀█░█▀▄░█▀▀░█▀▀░▀█▀░█▀█░█▀█░█▀▀
 * ░█░░░█░█░█▀▄░█▀▀░█▀▀░░█░░█░█░█░█░▀▀█
 * ░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀▀▀
 */

// ====================== ⚡ WHAT ======================
/**
 * 🟢 WHAT: Building Web Servers
 * 
 * Node.js provides core 'http' module to create web servers
 * that can handle HTTP requests and responses.
 * 
 * Key capabilities:
 * - Create servers without external dependencies
 * - Handle different HTTP methods (GET, POST, etc.)
 * - Manage request/response lifecycle
 * - Support middleware pipeline
 */
const http = require('http');

// ====================== ⚡ WHY ======================
/**
 * 🟡 WHY: Node.js for Web Servers
 * 
 * Advantages:
 * - Event-driven architecture handles concurrent connections efficiently
 * - Non-blocking I/O ideal for data-intensive real-time applications
 * - Unified JavaScript stack (frontend + backend)
 * - Rich ecosystem (Express, Fastify, etc. build on core http)
 * 
 * Use cases:
 * - APIs (REST, GraphQL)
 * - Real-time services (chat, notifications)
 * - Proxy servers
 * - Microservices
 */

// ====================== ⚡ MECHANISMS ======================
/**
 * 🔵 MECHANISMS: Core Components
 * 
 * 1. HTTP Module: Low-level server creation
 * 2. Request Object: Incoming message (URL, headers, body)
 * 3. Response Object: Outgoing message (status, headers, body)
 * 4. Event Emitters: Request/response events
 * 
 * Data Flow:
 * Client → Request → Node Server → Response → Client
 */

// ====================== ⚡ HOW ======================
// 🔹 Basic HTTP Server
const basicServer = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello from Node.js HTTP server!');
});

// 🔹 Start Server (uncomment to run)
// basicServer.listen(3000, () => {
//   console.log('Server running at http://localhost:3000');
// });

// ====================== ⚡ TYPES ======================
/**
 * 🟠 TYPES: Server Implementations
 * 
 * 1. Pure HTTP (core module) - shown above
 * 2. Express.js - most popular framework
 * 3. Fastify - high performance alternative
 * 4. Koa - more modern middleware approach
 * 5. NestJS - enterprise-grade framework
 */

// Express.js Example
const express = require('express');
const app = express();

// ====================== ⚡ WHERE ======================
/**
 * 🔴 WHERE: Deployment Contexts
 * 
 * Node servers commonly run in:
 * - Traditional hosting (AWS EC2, DigitalOcean)
 * - Containers (Docker, Kubernetes)
 * - Serverless (AWS Lambda, Vercel)
 * - Edge locations (Cloudflare Workers)
 */

// ====================== ⚡ ROUTING & MIDDLEWARE ======================
/**
 * 🟣 ROUTING: Handling Different Endpoints
 */

// Basic routing in Express
app.get('/', (req, res) => {
  res.send('Home Page');
});

app.get('/about', (req, res) => {
  res.send('About Page');
});

/**
 * 🟤 MIDDLEWARE: Concepts
 * 
 * Functions that:
 * - Execute between request and response
 * - Can modify req/res objects
 * - Can end request cycle
 * - Can call next middleware
 */

// Example middleware
app.use((req, res, next) => {
  console.log(`Request received: ${req.method} ${req.url}`);
  next(); // Pass control to next handler
});

// Built-in middleware
app.use(express.json()); // Parse JSON bodies

// ====================== ⚡ UNIQUE SCENARIOS ======================
/**
 * ⚪ UNIQUE SCENARIOS
 */

// 1. Streaming Responses
app.get('/stream', (req, res) => {
  const stream = fs.createReadStream('./large-file.txt');
  stream.pipe(res);
});

// 2. WebSocket Upgrade
const WebSocket = require('ws');
const wss = new WebSocket.Server({ server: basicServer });

// 3. Server-Sent Events
app.get('/events', (req, res) => {
  res.setHeader('Content-Type', 'text/event-stream');
  setInterval(() => {
    res.write(`data: ${new Date().toISOString()}\n\n`);
  }, 1000);
});

// ====================== ⚡ IMPORTANT CASES ======================
/**
 * 🔘 IMPORTANT CASES
 */

// 1. Error Handling
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});

// 2. File Uploads (using multer)
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
app.post('/upload', upload.single('file'), (req, res) => {
  res.send('File uploaded!');
});

// 3. Authentication Middleware
function authenticate(req, res, next) {
  if (req.headers.authorization === 'secret-token') {
    return next();
  }
  res.status(401).send('Unauthorized');
}

// ====================== 🏁 SUMMARY ======================
module.exports = {
  basicServer,
  app,
  serverTypes: ['Pure HTTP', 'Express', 'Fastify', 'Koa', 'NestJS'],
  coreConcepts: {
    routing: 'Mapping requests to handlers',
    middleware: 'Request processing pipeline',
    errorHandling: 'Centralized error management'
  }
};

console.log("✅ Web Server Concepts Loaded");
console.log("🔗 Next: 05_express_framework.js");

/**
 * ░█▄█░█▀█░█▀▄░█░█░█░░░█▀▀
 * ░█░█░█░█░█░█░█░█░█░░░█▀▀
 * ░▀░▀░▀▀▀░▀▀░░▀▀▀░▀▀▀░▀▀▀
 */