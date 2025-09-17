

// 🌐 HTTP STATUS CODES with Node.js 

// --------------------------------------------------------------------


// 🔵 1xx – Informational

// 100	    Continue	            (Handled internally by browsers)
// 101	    Switching Protocols	    (Used in WebSockets, rarely set manually)


// --------------------------------------------------------------------


// 🟢 2xx – Success

// Request was received, understood, and accepted.

res.status(200).json({ message: "OK" });           // 200 OK
res.status(201).json({ message: "Created" });      // 201 Created
res.status(202).json({ message: "Accepted" });     // 202 Accepted (processing async)
res.status(204).send();                            // 204 No Content (nothing to return)
res.status(206).json({ message: "Partial Content" }); 


// --------------------------------------------------------------------


// 🟡 3xx – Redirection

// Client must take additional action.

res.redirect(301, "/new-url");                     // 301 Moved Permanently
res.redirect(302, "/temporary");                   // 302 Found
res.redirect(307, "/keep-method");                 // 307 Temporary Redirect

// 300	Multiple Choices
// 301	Moved Permanently
// 302	Found
// 303	See Other
// 304	Not Modified
// 307	Temporary Redirect
// 308	Permanent Redirect


// --------------------------------------------------------------------


// 🔴 4xx – Client Errors

// The client made a bad request.

res.status(400).json({ error: "Bad Request" });           // 400
res.status(401).json({ error: "Unauthorized" });          // 401
res.status(403).json({ error: "Forbidden" });             // 403
res.status(404).json({ error: "Not Found" });             // 404
res.status(409).json({ error: "Conflict" });              // 409
res.status(422).json({ error: "Unprocessable Entity" });  // 422

// 400	Bad Request
// 401	Unauthorized
// 402	Payment Required
// 403	Forbidden
// 404	Not Found
// 405	Method Not Allowed
// 406	Not Acceptable
// 408	Request Timeout
// 409	Conflict
// 410	Gone
// 411	Length Required
// 413	Payload Too Large
// 415	Unsupported Media Type
// 418	I'm a teapot ☕ (fun Easter egg)
// 422	Unprocessable Entity
// 429	Too Many Requests


// --------------------------------------------------------------------


// 🔥 5xx – Server Errors

// The server failed to process a valid request.

res.status(500).json({ error: "Internal Server Error" });   // 500
res.status(501).json({ error: "Not Implemented" });         // 501
res.status(502).json({ error: "Bad Gateway" });             // 502
res.status(503).json({ error: "Service Unavailable" });     // 503
res.status(504).json({ error: "Gateway Timeout" });         // 504

// 500	Internal Server Error
// 501	Not Implemented
// 502	Bad Gateway
// 503	Service Unavailable
// 504	Gateway Timeout
// 505	HTTP Version Not Supported

// --------------------------------------------------------------------