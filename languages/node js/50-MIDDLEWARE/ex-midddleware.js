
// 🛠️ Middleware in Node.js: Complete Deep Dive
// 1️⃣ What is Middleware?

// Middleware are functions that have access to:

//     The request (req) object

//     The response (res) object

//     The next function in the application's request-response cycle

// javascript
// Copy

// function middleware(req, res, next) {
//   // Do something with req/res
//   next(); // Pass control to the next middleware
// }

// 2️⃣ How Middleware Works
// The Middleware Pipeline
// Copy

// Request → Middleware 1 → Middleware 2 → ... → Route Handler → Response

//     Each middleware can modify req/res

//     Must call next() to continue or end the cycle with res.send()

// Basic Example
// javascript
// Copy

// app.use((req, res, next) => {
//   console.log('Time:', Date.now());
//   next(); // Pass to next middleware
// });

// 3️⃣ Types of Middleware
// (1) Application-Level Middleware

// Applies to all routes:
// javascript
// Copy

// // Runs on EVERY request
// app.use((req, res, next) => {
//   console.log('Request received');
//   next();
// });

// // Only runs on '/admin' paths
// app.use('/admin', (req, res, next) => {
//   checkAdminPermissions(req);
//   next();
// });

// (2) Router-Level Middleware

// Same as application-level but bound to a router instance:
// javascript
// Copy

// const router = express.Router();

// router.use((req, res, next) => {
//   console.log('Router middleware activated');
//   next();
// });

// (3) Route-Specific Middleware

// Applies to specific HTTP methods:
// javascript
// Copy

// app.get('/protected', authMiddleware, (req, res) => {
//   res.send('Protected content');
// });

// (4) Error-Handling Middleware

// 4 parameters (err, req, res, next):
// javascript
// Copy

// app.use((err, req, res, next) => {
//   console.error(err.stack);
//   res.status(500).send('Something broke!');
// });

// (5) Built-in Middleware

// Express provides these out of the box:
// javascript
// Copy

// app.use(express.json()); // Parse JSON bodies
// app.use(express.urlencoded({ extended: true })); // Parse form data
// app.use(express.static('public')); // Serve static files

// (6) Third-Party Middleware

// Popular community middleware:
// javascript
// Copy

// const helmet = require('helmet');
// const cors = require('cors');

// app.use(helmet()); // Security headers
// app.use(cors()); // Enable CORS

// 4️⃣ Middleware Execution Flow
// Order Matters!
// javascript
// Copy

// app.use(middlewareA);
// app.use('/special', middlewareB);
// app.get('/', middlewareC, handler);

//     middlewareA runs on all requests

//     middlewareB runs only on /special routes

//     middlewareC runs only for GET /

// Terminating vs Non-Terminating
// javascript
// Copy

// // Terminating (ends request)
// app.use((req, res) => {
//   res.send('Request ended here');
// });

// // Non-Terminating (passes control)
// app.use((req, res, next) => {
//   req.user = { id: 123 };
//   next(); // Continue to next middleware
// });

// 5️⃣ Practical Middleware Examples
// (1) Logging Middleware
// javascript
// Copy

// const logger = (req, res, next) => {
//   console.log(`${req.method} ${req.path}`);
//   next();
// };
// app.use(logger);

// (2) Authentication Middleware
// javascript
// Copy

// const authenticate = (req, res, next) => {
//   if (req.headers.authorization === 'secret') {
//     next();
//   } else {
//     res.status(401).send('Unauthorized');
//   }
// };

// (3) Request Timing Middleware
// javascript
// Copy

// app.use((req, res, next) => {
//   const start = Date.now();
//   res.on('finish', () => {
//     console.log(`Request took ${Date.now() - start}ms`);
//   });
//   next();
// });

// (4) API Versioning Middleware
// javascript
// Copy

// app.use((req, res, next) => {
//   req.apiVersion = req.headers['accept-version'] || 'v1';
//   next();
// });

// 6️⃣ Advanced Middleware Patterns
// (1) Middleware Composition

// Combine multiple middlewares:
// javascript
// Copy

// const composeMiddlewares = (middlewares) => {
//   return (req, res, next) => {
//     const runMiddleware = (i) => {
//       if (i === middlewares.length) return next();
//       middlewares[i](req, res, () => runMiddleware(i + 1));
//     };
//     runMiddleware(0);
//   };
// };

// app.use(composeMiddlewares([logger, authenticate]));

// (2) Conditional Middleware
// javascript
// Copy

// const maybeMiddleware = (condition, middleware) => {
//   return (req, res, next) => {
//     if (condition(req)) {
//       middleware(req, res, next);
//     } else {
//       next();
//     }
//   };
// };

// (3) Async Middleware
// javascript
// Copy

// app.use(async (req, res, next) => {
//   try {
//     req.user = await User.find(req.token);
//     next();
//   } catch (err) {
//     next(err);
//   }
// });

// 7️⃣ Common Middleware Pitfalls

//     Forgetting to call next() → Request hangs

//     Error handling middleware must have 4 args

//     Order matters (place error handlers last)

//     Polluting req/res with too many properties

//     Not handling async errors properly

// 8️⃣ Middleware Cheat Sheet
// Type	Syntax	Use Case
// Application	app.use(fn)	Logging, security
// Router	router.use(fn)	Modular routes
// Route	app.get('/', fn, handler)	Auth, validation
// Error	app.use((err, req, res, next))	Centralized errors
// Built-in	express.json()	Body parsing
// Third-party	app.use(cors())	Cross-origin requests