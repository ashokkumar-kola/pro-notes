// ------------------------------------------------------------------------ //
//                             🌐 HTTP Routing                              //
// ------------------------------------------------------------------------ //




// ------------------------------------------------------------------------ //


// ✅ Basic Version: Inline Routing

    const http = require('http');

    const server = http.createServer((req, res) => {
        res.setHeader('Content-Type', 'text/html');

        if (req.url === '/' || req.url === '/home') {
            res.writeHead(200);
            res.end('<h1>Home Page</h1><p>Welcome to the Home Page</p>');
        } else if (req.url === '/about') {
            res.writeHead(200);
            res.end('<h1>About Page</h1><p>We are building great things!</p>');
        } else if (req.url === '/contact') {
            res.writeHead(200);
            res.end('<h1>Contact Page</h1><p>Contact us at hello@example.com</p>');
        } else {
            res.writeHead(404);
            res.end('<h1>404 - Page Not Found</h1>');
        }
    });

    server.listen(3000, () => console.log('Server running at http://localhost:3000'));


// ------------------------------------------------------------------------ //


// 🧩 Advanced Version: Modular Routing (Best Practice)


    // 📁 Folder Structure:

        // /routes
        //   └── index.js
        // server.js


    // 🔹 /routes/index.js
    module.exports = function routeHandler(req, res) {
        res.setHeader('Content-Type', 'text/html');
      
        switch (req.url) {
            case '/':
            case '/home':
                res.writeHead(200);
                res.end('<h1>Home</h1><p>Welcome Home!</p>');
                break;
            case '/about':
                res.writeHead(200);
                res.end('<h1>About</h1><p>This is the About page</p>');
                break;
            case '/contact':
                res.writeHead(200);
                res.end('<h1>Contact</h1><p>Reach us at contact@example.com</p>');
                break;
            default:
                res.writeHead(404);
                res.end('<h1>404</h1><p>Page not found</p>');
        }
    };
      

    // 🔹 server.js
    const http = require('http');
    const routeHandler = require('./routes');

    const server = http.createServer((req, res) => {
        routeHandler(req, res);
    });

    server.listen(3000, () => console.log('Server running at http://localhost:3000'));


// ------------------------------------------------------------------------ //




// 1. Core HTTP Module Routing (Manual)

const http = require('http');

const server = http.createServer((req, res) => {
  const { method, url } = req;
  
  // Basic routing
  if (method === 'GET' && url === '/') {
    res.end('Home Page');
  } 
  else if (method === 'GET' && url === '/about') {
    res.end('About Page');
  }
  else if (method === 'POST' && url === '/login') {
    // Handle POST data
    let body = '';
    req.on('data', chunk => body += chunk);
    req.on('end', () => {
      res.end(`Received: ${body}`);
    });
  }
  else {
    res.writeHead(404);
    res.end('Not Found');
  }
});

server.listen(3000);

// Pros: No dependencies
// Cons: Manual parsing gets messy


// -----------------------------------------------------------------------


// 2. Express.js Routing (Most Popular)

const express = require('express');
const app = express();

// Basic routes
app.get('/', (req, res) => res.send('Home'));
app.post('/login', (req, res) => res.send('Login'));

// Route parameters
app.get('/users/:id', (req, res) => {
  res.send(`User ID: ${req.params.id}`);
});

// Query parameters
app.get('/search', (req, res) => {
  res.send(`Searching for: ${req.query.q}`);
});

app.listen(3000);


// -----------------------------------------------------------------------


// 3. Router Class (Modular Express)

// routes/users.js
const router = require('express').Router();

router.get('/', (req, res) => res.send('User List'));
router.get('/:id', (req, res) => res.send(`User ${req.params.id}`));

module.exports = router;

// main.js
const userRoutes = require('./routes/users');
app.use('/users', userRoutes);


// -----------------------------------------------------------------------


// 4. Fastify Routing (High Performance)

const fastify = require('fastify')();

fastify.get('/', async (request, reply) => {
  return { hello: 'world' };
});

fastify.get('/user/:id', async (request, reply) => {
  return { user: request.params.id };
});

fastify.listen(3000);


// -----------------------------------------------------------------------


// 5. Koa.js Routing

const Koa = require('koa');
const Router = require('koa-router');

const app = new Koa();
const router = new Router();

router.get('/', (ctx) => {
  ctx.body = 'Home Page';
});

router.get('/about', (ctx) => {
  ctx.body = 'About Page';
});

app.use(router.routes());
app.listen(3000);



// 6. NestJS Controller-Based Routing

import { Controller, Get, Param } from '@nestjs/common';

@Controller('users')
export class UsersController {
  @Get()
  findAll(): string {
    return 'All users';
  }

  @Get(':id')
  findOne(@Param('id') id: string): string {
    return `User ${id}`;
  }
}


// 7. Hapi.js Routing

const Hapi = require('@hapi/hapi');

const init = async () => {
  const server = Hapi.server({ port: 3000 });

  server.route({
    method: 'GET',
    path: '/',
    handler: (request, h) => {
      return 'Hello World!';
    }
  });

  await server.start();
};

init();


// 8. File System Based Routing (Next.js API Routes)

// pages/api/users.js
export default function handler(req, res) {
    res.status(200).json({ name: 'John Doe' });
  }













//   Advanced Routing Patterns

// 1. Regular Expression Routes
  app.get(/.*fly$/, (req, res) => {
    res.send('/butterfly, /dragonfly, etc.');
  });
  

// 2. Route Middleware
  const checkAuth = (req, res, next) => {
    if (req.headers.authorization) next();
    else res.status(401).send('Unauthorized');
  };
  
  app.get('/admin', checkAuth, (req, res) => {
    res.send('Admin Dashboard');
  });
  

// 3. Chained Routing
  app.route('/book')
    .get((req, res) => res.send('Get a book'))
    .post((req, res) => res.send('Add a book'))
    .put((req, res) => res.send('Update the book'));
  
    
// 4. 405 Method Not Allowed Handling
  app.route('/user')
    .get((req, res) => res.send('Get user'))
    .all((req, res) => res.status(405).send('Method Not Allowed')