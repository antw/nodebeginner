{exec} = require 'child_process'

# Given a request, handlers perform actions.

exports.start = (response) ->
  console.log 'Request handler "start" was called'

  exec 'ls -lah', (error, stdout, stderr) ->
    response.writeHead 200, 'Content-Type': 'text/html'
    response.write "<pre><tt>#{stdout}</tt></pre>"
    response.end()

exports.upload = (response) ->
  console.log 'Request handler "upload" was called'

  response.writeHead 200, 'Content-Type': 'text/html'
  response.write 'Hello upload'
  response.end()
