#!/usr/bin/env coffee

Router = require 'node-simple-router'
http   = require 'http'

argv = process.argv.slice 2

router = Router(
  static_route: process.cwd()
  served_by: "Guaycuru Web Server"
  version: '0.0.8'
  cgi_dir: argv[1] or 'cgi-bin'
)


#Ok, just start the server!

server = http.createServer router

server.on 'listening', ->
  addr = server.address() or {address: '0.0.0.0', port: argv[0] or 8000}
  router.log "Serving web content at #{addr.address}:#{addr.port}"
  router.log "Working directory: #{router.static_route}"
      
process.on "SIGINT", ->
  server.close()
  router.log "\n Server shutting up...\n"
  process.exit 0

server.listen if argv[0]? and not isNaN(parseInt(argv[0])) then parseInt(argv[0]) else 8000

