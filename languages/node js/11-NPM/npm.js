

// 📦 NPM (Node Package Manager)


    // 📘 Official: https://docs.npmjs.com/


// --------------------------------------------------------------------------


// Install Node.js – NPM comes bundled with it.

    // node -v
    // npm -v


// --------------------------------------------------------------------------


// 📁 INITIALIZE PROJECT

    // npm init         # Step-by-step
    // npm init -y      # Quick default package.json


// --------------------------------------------------------------------------


// 📦 INSTALLING PACKAGES / DEPENDENCIES

    // npm install <pkg>	        Install locally
    // npm install -g <pkg>	        Install globally
    // npm i <pkg>@version	        Install specific version
    // npm i	                    Install all deps from package.json


    // SAVING DEPENDENCIES

        // npm install express                  # Saved under dependencies
        // npm install --save-dev nodemon       # Saved under devDependencies
        // npm install --save-optional          # Saved under optionalDependencies

        // Manual setup in package.json         # peerDependencies

        
// --------------------------------------------------------------------------


// 📌 SAVE FLAGS

    // Flag	                Usage Example	            Effect
    // --save	            npm i lodash --save	        (default) saves to deps
    // --save-dev	        npm i jest --save-dev	    Adds to devDependencies
    // --no-save	        npm i <pkg> --no-save	    Installs but not saved


// --------------------------------------------------------------------------


// ⚙️ SCRIPTS (package.json)

    "scripts": {
        "start": "node index.js",
        "dev": "nodemon index.js",
        "test": "jest"
    }

    // npm run dev

// --------------------------------------------------------------------------


// 🔁 UPDATE & UNINSTALL

    // Command	                Description
    // npm update <pkg>	        Update a specific package
    // npm uninstall <pkg>	    Remove a package
    // npm outdated	            Show outdated packages
    // npm audit	            Show vulnerability report
    // npm audit fix	        Auto-fix vulnerabilities
    // npm list	                Shows installed packages
    // npm ci	                Clean install from package-lock.json
    // npm cache                clean --force	Clears NPM cache


    // All CLI commands :       https://docs.npmjs.com/cli/v10/commands


// --------------------------------------------------------------------------


// 📌 USEFUL FILES

    // File	                    Purpose
    // package.json	            Project metadata, scripts, deps
    // package-lock.json	    Exact versions installed
    // node_modules/	        Installed packages
    // .npmrc	                Custom NPM configs (proxy, registry, etc.)


// --------------------------------------------------------------------------


// 📌 NECESSARY COMMANDS IN REAL SCENARIOS
    
    // Task	                            Command
    // Install all deps	                npm install
    // Reinstall everything	            Delete node_modules + package-lock.json, then npm i
    // Clean cache	                    npm cache clean --force
    // Show installed versions	        npm list
    // Global package location	        npm root -g
    // Show package info	            npm view <pkg>


// --------------------------------------------------------------------------


// 📈 PUBLISHING A PACKAGE (Optional)

    // npm login
    // npm publish