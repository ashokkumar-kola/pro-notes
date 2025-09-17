// ------------------------------------------------------------------------ //
//                            📁 FOLDER STRUCTURE                           //
// ------------------------------------------------------------------------ //


// FOLDER STRUCTURE

// 📁 project-root/                     ## Root folder
// │
// ├── 📁 app/                          ## Feature modules
// │   ├── 📁 user/                     ## User feature
// │   │   ├── 📄 index.js                 // Entry point
// │   │   ├── 📄 user.controller.js       // Request logic
// │   │   ├── 📄 user.request.js          // Input schema
// │   │   ├── 📄 user.route.js            // API routes
// │   │   ├── 📄 user.spec.js             // Unit test
// │   │   └── 📄 user.service.js          // Business logic
// │   │
// │   └── 📁 task/                     ## Task feature
// │       ├── 📄 index.js                 // Entry point
// │       ├── 📄 task.controller.js       // Request logic
// │       ├── 📄 task.request.js          // Input schema
// │       ├── 📄 task.route.js            // API routes
// │       ├── 📄 task.spec.js             // Unit test
// │       └── 📄 task.service.js          // Business logic
// │
// ├── 📁 config/                       ## App config
// │   ├── 📄 index.js                     // Config entry
// │   └── 📄 server.js                    // Server setup
// │
// ├── 📁 db/                           ## Database layer
// │   ├── 📁 migrations/                  // Schema changes
// │   ├── 📁 configs/                     // DB config (or seeders)
// │   └── 📁 models/                      // ORM models
// │
// ├── 📁 utilities/                    ## Helper modules
// │   ├── 📁 server-utilities/         ## Server tools
// │   │   └── 📄 cluster-utils.js         // Clustering logic
// │   ├── 📄 constants.js                 // Shared values
// │   ├── 📄 status-message.js            // Response texts
// │   └── 📄 validation.js                // Input validation
// │
// ├── 📁 services/                     ## External services
// │   ├── 📄 aws.service.js               // AWS wrapper
// │   ├── 📄 jwt.service.js               // JWT logic
// │   ├── 📄 logger.service.js            // Logging tool
// │   └── 📄 response-handler.service.js  // Unified response
// │
// ├── 📁 scripts/                      ## Shell tools
// │   ├── 📄 server-setup.sh              // Init script
// │   └── 📄 drop-db.sh                   // DB teardown
// │
// ├── 📄 .sequelizerc                     // Sequelize config
// ├── 📄 index.js                         // App entry point
// └── 📄 package.json                     // Project metadata


