// ------------------------------------------------------------------------ //
//                            📦 Node.js Modules                            //
// ------------------------------------------------------------------------ //



    // Modules in Node.js are reusable chunks of code
    // split across files to keep code organized and modular. 
    // Node uses the CommonJS module system.

    // 📘 Official Docs: https://nodejs.org/api/modules.html


// ------------------------------------------------------------ //


// CommonJS vs ES Modules

    // CommonJS
        
        // Synchronous Loading
        // .js (default in Node.js)

        // Import : `const x = require('x')`
        // Export : `module.exports = x`

        // Usage  Older projects 


    // ES Modules
	
        // Asynchronous Loading
        // .mjs or .js with type: "module"

        // Import : `import { x } from 'x'`
        // Export : `export default x / export { x }`

        // Usage - Modern projects



// ------------------------------------------------------------ //

// 🔹 CommonJS

    // EXPORTS

        module.exports = { a, b, fun }
        module.exports.items = [ 'item1', 'item2' ] 
        module.exports.singlePerson = person


    // IMPORTS

        const names = require('./nodejs')
        require('./nodejs') 


// 🔹 ES Modules 
    
    // EXPORTS

        export { add };

        export { add as sum };

        export { add, sub, mul };

        export function greet() { console.log('Hello'); }

        export default function add(a, b) {                 // → default export
            return a + b; 
        }


    // IMPORTS

        import * as math from './math.js';                  // → import all

        import { add } from './math.js';

        import { sum as add } from './math.js';

        import { add, subtract } from './math.js';
    
        import add from './math.js';                        // → named imports

        const { add } = await import('./math.js');          // → async import


// ------------------------------------------------------------ //


// BUILT-IN (Core) MODULES

    // Module	            Use
    // -----------------------------------------------------
    // fs	                File System (read/write files)
    // http	                Create servers
    // path	                Handle file paths
    // os	                System info
    // url	                URL parsing


// ------------------------------------------------------------ //


// Folder/File Convention

    // /src
    // /utils
    //     math.js         ← ES6 module
    // /services
    //     apiService.js   ← Default + named exports
    // index.js            ← Entry file (ES6 imports)


// CACHING IN MODULES

    // Node caches modules after the first require to improve performance.
    // ⚠️ Changes in the file won't reflect unless the server restarts.


// If you require() a folder, Node looks for:

    //  index.js file

    //  Or a file defined in package.json as "main"


// ------------------------------------------------------------ //


// 🔹 OPERATING SYSTEM

    const os = require('os');

    console.log(
        os.userInfo(),       // → { username, uid, gid, shell, homedir }
        os.uptime(),         // → System uptime in seconds
        os.type(),           // → OS name (e.g., 'Linux')
        os.release(),        // → Kernel version
        os.totalmem(),       // → Total system memory (bytes)
        os.freemem(),        // → Free memory (bytes)
        os.hostname(),       // → Hostname
        os.platform(),       // → 'win32', 'linux', etc.
        os.arch(),           // → CPU arch (e.g., 'x64')
        os.cpus(),           // → Array of CPU core info
    );


// ------------------------------------------------------------ //


// 🔹 PATH

    const path = require('path')

    console.log(
        path.basename('/user/test/file.txt'),               // → 'file.txt'
        path.dirname('/user/test/file.txt'),                // → '/user/test'
        path.extname('/user/test/file.txt'),                // → '.txt'
        path.join(__dirname, 'folder', 'file.js'),          // → Safe join path
        path.resolve('folder', 'file.js'),                  // → Absolute path
        path.sep(),                                         // → seperator
        path.join('/content/', 'subfolder', 'test.txt'),    // → join
    );

    console.log(
        
    )


// ------------------------------------------------------------ //


// 🔹 FILE SYSTEM

    // readFile(path, encoding, callback)
    // writeFile(path, data, callback)
    // appendFile(path, data, callback)

    const fs = require('fs')

    // ✅ Async read
    fs.readFile('file.txt', 'utf8', (err, data) => {
        if (err) throw err;
        console.log(data);
    });
    
    // ✅ Sync write
    fs.writeFileSync('new.txt', 'Hello, world!');
    
    // ✅ Append
    fs.appendFile('log.txt', 'New log\n', err => {
        if (err) throw err;
    });


// ------------------------------------------------------------ //


// 🔹 URL

    const url = require('url');

    const myUrl = new URL('https://example.com:8080/path/name?user=test#section');

    console.log(
        myUrl.href,                         // → Full URL
        myUrl.hostname,                     // → example.com
        myUrl.pathname,                     // → /path/name
        myUrl.searchParams.get('user'),     // → test
        myUrl.port                          // → 8080
    );


// ------------------------------------------------------------ //


// 🔹 EVENTS – Event Emitter

    const EventEmitter = require('events');
    const emitter = new EventEmitter();

    emitter.on('message', data => {
    console.log('Message received:', data);
    });

    emitter.emit('message', { user: 'John', text: 'Hello' });

    // on(eventName, callback)
    // emit(eventName, data)
    // once(eventName, callback)


// ------------------------------------------------------------ //


// 🔹 PROCESS

    console.log(
        process.pid,           // Process ID
        process.platform,      // OS platform
        process.cwd(),         // Current working dir
        process.argv,          // CLI args
        process.env.NODE_ENV   // Environment variables
    );
  


// ------------------------------------------------------------ //


// 🔹 crypto

    const crypto = require('crypto');

    const hash = crypto.createHash('sha256').update('hello').digest('hex');
    console.log(hash); // → Encrypted hash

    // createHash(algorithm)
    // .update(data)
    // .digest(encoding)


// ------------------------------------------------------------ //


// 🔹 HTTP

    const http = require('http');

    const server = http.createServer((req, res) => {
    console.log(req.method, req.url);
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Hello from server!');
    });

    server.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
    });


    // createServer(callback(req, res))
    // res.writeHead(statusCode, headers)
    // res.end(data)

    
// ------------------------------------------------------------ //

