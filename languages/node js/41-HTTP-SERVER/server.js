const http = require('http');
const fs = require('fs');
const path = require('path');
const router = require('./routes/router');

const server = http.createServer((req, res) => {
  router(req, res);
});

server.listen(3000, () => {
  console.log('Server running at http://localhost:3000');
});





// 2nd WAY

const PORT = 3000;
const publicDir = path.join(__dirname, 'public');

const server = http.createServer((req, res) => {
    // Determine the file path
    let filePath = path.join(publicDir, req.url === '/' ? 'home.html' : req.url);
    const extname = path.extname(filePath);
    
    // Set content type based on file extension
    const mimeTypes = {
        '.html': 'text/html',
        '.js': 'text/javascript',
        '.css': 'text/css',
        '.json': 'application/json',
        '.png': 'image/png',
        '.jpg': 'image/jpg',
        '.gif': 'image/gif',
    };

    const contentType = mimeTypes[extname] || 'application/octet-stream';

    // Read and serve the file
    fs.readFile(filePath, (err, content) => {
        if (err) {
            if (err.code === 'ENOENT') {
                // Page not found
                fs.readFile(path.join(publicDir, '404.html'), (err, content) => {
                    res.writeHead(404, { 'Content-Type': 'text/html' });
                    res.end(content, 'utf-8');
                });
            } else {
                // Server error
                res.writeHead(500);
                res.end(`Server Error: ${err.code}`);
            }
        } else {
            // Success
            res.writeHead(200, { 'Content-Type': contentType });
            res.end(content, 'utf-8');
        }
    });
});

server.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});