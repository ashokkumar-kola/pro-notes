// ------------------------------------------------------------------------ //
//                            📄 File System Module                         //
// ------------------------------------------------------------------------ //


// # File System Module - ( fs )


// -------------------------------------------------------------------------- //


// 🔹 IMPORT - fs

    // 🔄 Sync Loading

        const fs = require('fs');   // CommonJS


    // ⚡️ Async Loading

        import fs from 'fs';        // ES Module


// -------------------------------------------------------------------------- //


// 🔹 READING FILES

    // 🔄 Sync Method

        console.log('Start File Read')
        try {
            const data = fs.readFileSync('./example.txt', 'utf8');
            console.log('File Content:', data)
        } catch (err) {
            console.log('End File Read')
        }
        

    // ⚡️ Async Method

        console.log('Start File Read')
        fs.readFile('./example.txt', 'utf8', (err, data) => {
            if (err) {
                console.error("Error reading file", err);
                return;
            }
            console.log("File content", data);
        });
        console.log('End File Read')


// -------------------------------------------------------------------------- //


// 🔹 WRITING FILES

    // 🔄 Sync Method

        try {
            fs.writeFileSync('./newFile.txt', 'Hello, Rentify!');
            console.log("File written successfully");
        } catch (err) {
            console.error(err);
        }
        

    // ⚡️ Async Method

        fs.writeFile("newfile.txt", "Hello, Rentify!", (err) => {
            if (err) { 
                throw (err);
            }
            console.log("File written successfully");
        })


// -------------------------------------------------------------------------- //


// 🔹 APPENDING FILES
    
    // 🔄 Sync Method – fs.appendFileSync()
    
        try {
            fs.appendFileSync('log.txt', 'Sync append\n');
            console.log('Sync: Data appended');
        } catch (err) {
            console.error(err);
        } 
    

    // ⚡️ Async Method – fs.appendFile()

        fs.appendFile('log.txt', 'Async append\n', (err) => {
            if (err) throw err;
            console.log('Async: Data appended');
        });

    
// -------------------------------------------------------------------------- //


// 🔹 DELETING FILES

    // 🔄 Sync Method

        try {
            fs.unlinkSync('file.txt');
            console.log('Sync: File deleted');
        } catch (err) {
            console.error('Error deleting file:', err);
        }


    // ⚡️ Async Method

        fs.unlink('file.txt', (err) => {
            if (err) {
                console.error('Error deleting file:', err);
            } else {
                console.log('Async: File deleted');
            }
        });


// -------------------------------------------------------------------------- //


// 🔹 FILE EXISTS

    // 🔄 Sync Method

        var path = 'file.txt';

        if (fs.existsSync(path)) {
            fs.unlinkSync(path);
            console.log('File existed and was deleted');
        } else {
            console.log('File does not exist');
        }

    // ⚡️ Async Method

        var path = 'file.txt';

        fs.access(path, fs.constants.F_OK, (err) => {
        if (err) {
            console.log('File does not exist');
        } else {
            fs.unlink(path, (err) => {
            if (err) {
                console.error('Error deleting file:', err);
            } else {
                console.log('File existed and was deleted');
            }
            });
        }
        });

        // fs.exists() -  ❌ Deprecated


// -------------------------------------------------------------------------- //


// 📁 CREATING DIRECTORIES

    // 🔄 Sync – fs.mkdirSync()

        try {
            fs.mkdirSync('myDir');
            console.log('Sync: Directory created');
        } catch (err) {
            console.error('Error creating dir:', err);
        }
        


    // ⚡️ Async – fs.mkdir()

        fs.mkdir('myDir', (err) => {
            if (err) {
                console.error('Error creating dir:', err);
            } else {
                console.log('Async: Directory created');
            }
        });


// -------------------------------------------------------------------------- //


// 🗑️ REMOVE DIRECTORIES

    // 🔄 Sync – fs.rmSync()

        try {
            fs.rmSync('myDir', { recursive: true, force: true });
            console.log('Sync: Directory removed');
        } catch (err) {
            console.error('Error removing dir:', err);
        }


    // ⚡️ Async – fs.rm()

        fs.rm('myDir', { recursive: true, force: true }, (err) => {
            if (err) throw err;
            console.log('Async: Directory removed');
        });

        // fs.rmdir() -  ❌ Deprecated


// -------------------------------------------------------------------------- //


// Best Practice with Promises

    async function readFileAsync() {
        try {
            const data = await fs.readFile('example.txt', 'utf8');
            console.log(data)
        } catch (err) {
            console.error('Error : ', err)
        }
    }
    readFileAsync()


// -------------------------------------------------------------------------- //


// 📁 Directory Operations

    // fs.mkdir() / fs.mkdirSync()

    // fs.rm() / fs.rmSync()

    // fs.rmdir() / fs.rmdirSync() ❌ (deprecated)

    // fs.readdir() / fs.readdirSync()

    // fs.opendir() / fs.opendirSync()
    

// 📄 File Operations

    // fs.writeFile() / fs.writeFileSync()

    // fs.appendFile() / fs.appendFileSync()

    // fs.readFile() / fs.readFileSync()

    // fs.unlink() / fs.unlinkSync()

    // fs.rename() / fs.renameSync()

    // fs.copyFile() / fs.copyFileSync()


// 🔎 Check / Access

    // fs.existsSync() ❗ (only sync version remains)

    // fs.access() / fs.accessSync()

    // fs.stat() / fs.statSync()

    // fs.lstat() / fs.lstatSync()

    // fs.fstat() / fs.fstatSync()


// 📦 Streams

    // fs.createReadStream()

    // fs.createWriteStream()


// 🧰 File Descriptors (Advanced)

    // fs.open() / fs.openSync()

    // fs.close() / fs.closeSync()

    // fs.read() / fs.readSync()

    // fs.write() / fs.writeSync()


// 🧪 Other Utilities

    // fs.watch() – Watch file/dir for changes

    // fs.realpath() / fs.realpathSync() – Resolve symlinks

    // fs.truncate() / fs.truncateSync() – Resize file