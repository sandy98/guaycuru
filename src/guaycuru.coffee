#!/usr/bin/env coffee

Router = require 'node-simple-router'
http   = require 'http'
spawn  = require('child_process').spawn

argv = process.argv.slice 2

router = Router(
  static_route: process.cwd()
  served_by: "Guaycuru Web Server"
  version: '0.0.1'
  cgi_dir: argv[1] or 'cgi'
)

router._500 = (req, res, path, message) ->
  res.writeHead(500, {'Content-Type': 'text/html'})
  res.end("""
              <h2>500 - Resource #{path}: #{message}</h2>
              <hr/><h3>Served by #{router.served_by} v#{router.version}</h3>
              <p style="text-align: center;"><button onclick='history.back();'>Back</button></p>
          """)

# CGI support (very basic, as of 2012-04-30)

router.old_static = router.static

router.static = (pathname, res) ->
  if pathname.indexOf("#{router.cgi_dir}/") isnt - 1
    try
      full_path = "#{router.static_route}#{pathname}"
      child = spawn full_path
      res.writeHead 200, {'Content-type': 'text/html'}
      child.stdout.on 'data', (data) -> res.write(data)
      child.on 'exit', -> res.end()
    catch error
      router._500 null, res, pathname, error.toString() 
  else
    return router.old_static pathname, res

router.log "Working directory: #{router.static_route}"

# End of CGI support

server = http.createServer router
server.listen if argv[0]? and not isNaN(parseInt(argv[0])) then parseInt(argv[0]) else 8000

addr = server?.address() or {address: '0.0.0.0', port: argv[0] or 8000}

router.log "Serving web content at #{addr.address}:#{addr.port}"

process.on "SIGINT", ->
  server.close()
  router.log "\n Server shutting up...\n"
  process.exit 0


