
// Node.js is a JavaScript runtime built on Chrome's V8 engine.

// VERSIONS
const npmVersion = "8.5.1";
const nodeVersion = "v12.22.9";


// GLOBALS
console.log(__dirname)
console.log(__filename)
console.log(module)
console.log(process)
console.log(require)


// ------------------------------------------------------------------


// Node vs NPM

    // - `NODE`
        // - Runtime Environment (Engine that runs JS code)
        // - Run JavaScript outside browser
        // - Needs installation


    // - `NPM`
        // - Package Manager
        // - Manage JS libraries/packages
        // - Comes with Node.js


// ------------------------------------------------------------------


//  Runtime vs Event Loop

// - `RUNTIME` - Sync

    // 	- Environment to execute JavaScript code
    // 	- Parses, compiles, and runs code
    // 	- Call stack, memory heap, APIs, etc.
    // 	- Entire JS execution setup
    // 	- Call Stack - Executes Sync code


// - `EVENT LOOP` - Async

    // 	- Mechanism to handle async operations
    // 	- Manages execution of tasks/callbacks
    // 	- Handles non-blocking behavior
    // 	- Callback queue, microtasks, call stack
    // 	- Event Loop : 
        // - Callback Queue : setTimout, setInterval, I/O
        // - Microtask Queue : Promises, async/await


// ------------------------------------------------------------------


