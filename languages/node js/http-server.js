const http = require('http');

const PORT = 8082

const server = http.createServer( (req, res) => {

    // HEADER
    // res.writeHead(200, {'Content-type': 'text/html'});
    res.setHeader( 'Content-type', 'text/html' )
    // res.statusCode = 200 


    // Request info
    // res.write(
    //     "This is Home Page.<br>" +
    //     "HTTP Method: " + req.method + "<br>" +
    //     "Requested URL: " + req.url + "<br>" +
    //     "Requested Headers: " + req.headers
    // );
    // "Requested Headers: " + req.headers - Cannot render headers after they are sent to the client


    // ROUTERS
    if ( req.url === '/' || req.url === '/home' ){
        res.writeHead( 200 )
        res.end('<h1>This is Home page</h1>')
    } 
    else if ( req.url === '/about' ) {
        res.writeHead( 200 )
        res.end('<h1>This is About Us page</h1>')
    }
    else if ( req.url === '/contact' ) {
        res.writeHead( 200 )
        res.end('<h1>This is Contact page</h1>')
    }
    else {
        res.writeHead( 404 )
        res.end('<h1>404</h1><p>Page not found</p>')
    }


    // switch (req.url) {
    //     case '/':
    //     case '/home':
    //         res.writeHead(200);
    //         res.end('<h1>Home</h1><p>Welcome Home!</p>');
    //         break;
    //     case '/about':
    //         res.writeHead(200);
    //         res.end('<h1>About</h1><p>This is the About page</p>');
    //         break;
    //     case '/contact':
    //         res.writeHead(200);
    //         res.end('<h1>Contact</h1><p>Reach us at contact@example.com</p>');
    //         break;
    //     default:
    //         res.writeHead(404);
    //         res.end('<h1>404</h1><p>Page not found</p>');
    // }
    
    
    // END POINT
    // res.end();

});

server.listen( PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});
