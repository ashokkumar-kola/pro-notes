// ------------------------------------------------------------------------ //
//                               🌐 HTTP Module                             //
// ------------------------------------------------------------------------ //


// 🔷 WHAT is http module?
    // The http module in Node.js allows you to create HTTP servers and make HTTP requests (client-side).
    // It is a core module, so no installation is required.


// 🔷 WHY use http module?
    // To create RESTful APIs without external frameworks
    // Fully control request/response cycle (low-level access)
    // Ideal for lightweight, dependency-free services or custom behavior

// 

// ------------------------------------------------------------------------ //


// 🔷 CREATING A SERVER

    const http = require('http');

    const server = http.createServer((req, res) => {
        // Request info
        console.log(req.method, req.url);

        // Response setup
        res.writeHead(200, { 'Content-Type': 'text/plain' });
        res.end('Hello from Node HTTP server!');
    });

    server.listen(3000, () => {
        console.log('Server running at http://localhost:3000');
    });





// ------------------------------------------------------------------------ //


// 🔷 KEY OBJECTS

    // 📌 req (IncomingMessage)

        // .url             → request path
        // .method          → GET, POST, PUT, PULL
        // .headers         → object of request headers
        // .on('data')      → body chunks (for POST)
        // .on('end')       → end of stream


    // 📌 res (ServerResponse)

        // .writeHead(statusCode, headers)
        // .write(data)
        // .end(data)                           → closes response
        // .setHeader(key, value)
        // .statusCode = 200


// ------------------------------------------------------------------------ //


// 1️⃣ Basic Server (Single File)

    const server = http.createServer((req, res) => {
        // handle routes manually
    });


// 2️⃣ Modular Routing (Custom Router)

    const routes = {
        '/': 'Welcome',
        '/about': 'About Page',
    };
    
    const server = http.createServer((req, res) => {
        res.writeHead(200, { 'Content-Type': 'text/plain' });
        res.end(routes[req.url] || 'Not Found');
    });
  

// 3️⃣ File-Based Server (Serve HTML/Static)

    const fs = require('fs');
    const path = require('path');

    http.createServer((req, res) => {
    const file = path.join(__dirname, req.url === '/' ? 'index.html' : req.url);

    fs.readFile(file, (err, content) => {
        if (err) {
        res.writeHead(404);
        res.end('404 Not Found');
        } else {
        res.writeHead(200);
        res.end(content);
        }
    });
    }).listen(3000);


// ------------------------------------------------------------------------ //


// 🔷 CLIENT REQUEST (Make Request)


    const http = require('http');

    const options = {
        hostname: 'jsonplaceholder.typicode.com',
        path: '/posts/1',
        method: 'GET',
    };

    const req = http.request(options, res => {
        let data = '';
        res.on('data', chunk => data += chunk);
        res.on('end', () => console.log(JSON.parse(data)));
    });

    req.on('error', err => console.error(err));
    req.end();



// ------------------------------------------------------------------------ //







// ------------------------------------------------------------------------ //









// ------------------------------------------------------------------------ //









// ------------------------------------------------------------------------ //


// 🔷 SIMPLE JSON API Example

    http.createServer((req, res) => {
        if (req.method === 'GET' && req.url === '/api') {
        const data = { name: 'Node.js', type: 'core' };
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify(data));
        } else {
        res.writeHead(404);
        res.end('Not Found');
        }
    }).listen(4000);
  