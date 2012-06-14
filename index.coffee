
fs = require('fs')
ghm = require('ghm')
http = require('http')
path = __dirname + "/docs/"

server = http.createServer (req, res)->
	req.url.replace /^\/([a-z0-9-_]*)/, (str, name)->
		name = 'index' if name is ''
		fs.readFile "#{path}#{name}.md", 'utf8', (err, data)->
			if err?
				res.writeHead(404, {'Content-Type': 'text/plain'})
				res.end("Doc #{name} not found")
			else
				res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'})
				res.end(ghm.parse("#{data}"))

port = process.env.PORT or 5000
server.listen port, ()->
	console.log "Server listening on port #{port}"
