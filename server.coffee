http = require 'http'
url  = require 'url'

# Starts a simple web server on port 8888.
exports.start = (route, handle) ->

  http.createServer (request, response) ->
    pathname = url.parse(request.url).pathname

    console.log "Request received: #{pathname}"

    content = route handle, pathname

    response.writeHead 200, 'Content-Type': 'text/html'
    response.write content
    response.end()
  .listen(8888)

  console.log 'Server started.'
