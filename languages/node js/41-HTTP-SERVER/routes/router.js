const fs = require('fs');
const path = require('path');

const serveFile = (filePath, contentType, res) => {
  fs.readFile(filePath, (err, content) => {
    if (err) {
      res.writeHead(500);
      res.end('Server Error');
    } else {
      res.writeHead(200, { 'Content-Type': contentType });
      res.end(content);
    }
  });
};

module.exports = (req, res) => {
  const url = req.url;

  if (url === '/' || url === '/home') {
    serveFile(path.join(__dirname, '../public/home.html'), 'text/html', res);
  } else if (url === '/about') {
    serveFile(path.join(__dirname, '../public/about.html'), 'text/html', res);
  } else if (url === '/contact') {
    serveFile(path.join(__dirname, '../public/contact.html'), 'text/html', res);
  } else if (url === '/style.css') {
    serveFile(path.join(__dirname, '../public/style.css'), 'text/css', res);
  } else if (url === '/script.js') {
    serveFile(path.join(__dirname, '../public/script.js'), 'application/javascript', res);
  } else {
    res.writeHead(404);
    res.end('404 - Page Not Found');
  }
};
